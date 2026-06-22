import { NextRequest, NextResponse } from "next/server";
import { requireAdmin } from "@/lib/session";
import { prisma } from "@/lib/prisma";

export async function GET(req: NextRequest) {
  const admin = await requireAdmin(req);
  if (!admin) return NextResponse.json({ error: "Forbidden" }, { status: 403 });

  const { searchParams } = req.nextUrl;
  const status = searchParams.get("status") ?? undefined;

  const enquiries = await prisma.enquiry.findMany({
    where: status ? { status } : {},
    orderBy: { createdAt: "desc" },
  });

  return NextResponse.json({ enquiries });
}

export async function POST(req: NextRequest) {
  const admin = await requireAdmin(req);
  if (!admin) return NextResponse.json({ error: "Forbidden" }, { status: 403 });

  const body = await req.json();
  const enquiry = await prisma.enquiry.create({ data: body });
  return NextResponse.json({ enquiry }, { status: 201 });
}
