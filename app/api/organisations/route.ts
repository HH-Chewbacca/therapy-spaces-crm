import { NextRequest, NextResponse } from "next/server";
import { requireAdmin } from "@/lib/session";
import { prisma } from "@/lib/prisma";

export async function GET(req: NextRequest) {
  const admin = await requireAdmin(req);
  if (!admin) return NextResponse.json({ error: "Forbidden" }, { status: 403 });
  const orgs = await prisma.organisation.findMany({
    include: { members: { select: { id: true, name: true, email: true } } },
    orderBy: { name: "asc" },
  });
  return NextResponse.json({ organisations: orgs });
}

export async function POST(req: NextRequest) {
  const admin = await requireAdmin(req);
  if (!admin) return NextResponse.json({ error: "Forbidden" }, { status: 403 });
  const body = await req.json();
  const org = await prisma.organisation.create({ data: body });
  return NextResponse.json({ organisation: org }, { status: 201 });
}
