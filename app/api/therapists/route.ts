import { NextRequest, NextResponse } from "next/server";
import { requireAdmin } from "@/lib/session";
import { prisma } from "@/lib/prisma";
import { z } from "zod";

export async function GET(req: NextRequest) {
  const admin = await requireAdmin(req);
  if (!admin) return NextResponse.json({ error: "Forbidden" }, { status: 403 });

  const { searchParams } = req.nextUrl;
  const search = searchParams.get("search") ?? "";

  const therapists = await prisma.user.findMany({
    where: {
      role: "THERAPIST",
      ...(search ? {
        OR: [
          { name: { contains: search, mode: "insensitive" } },
          { email: { contains: search, mode: "insensitive" } },
          { companyName: { contains: search, mode: "insensitive" } },
          { skill: { contains: search, mode: "insensitive" } },
        ]
      } : {}),
    },
    include: {
      organisation: { select: { id: true, name: true } },
      primaryBranch: { select: { id: true, name: true } },
      authorisedLocations: { include: { location: { select: { id: true, name: true } } } },
    },
    orderBy: { name: "asc" },
  });

  return NextResponse.json({ therapists });
}

const createSchema = z.object({
  name: z.string().min(1),
  email: z.string().email(),
  phone: z.string().optional(),
  companyName: z.string().optional(),
  skill: z.string().optional(),
});

export async function POST(req: NextRequest) {
  const admin = await requireAdmin(req);
  if (!admin) return NextResponse.json({ error: "Forbidden" }, { status: 403 });

  const body = await req.json();
  const parsed = createSchema.safeParse(body);
  if (!parsed.success) return NextResponse.json({ error: "Invalid data", details: parsed.error.issues }, { status: 400 });

  const { name, email, phone, companyName, skill } = parsed.data;

  const existing = await prisma.user.findFirst({ where: { email: { equals: email, mode: "insensitive" } } });
  if (existing) return NextResponse.json({ error: "A user with this email already exists." }, { status: 409 });

  const therapist = await prisma.user.create({
    data: { name, email, phone, companyName, skill, role: "THERAPIST" },
  });

  return NextResponse.json({ therapist }, { status: 201 });
}
