import { NextRequest, NextResponse } from "next/server";
import { requireAdmin } from "@/lib/session";
import { prisma } from "@/lib/prisma";

export async function PATCH(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const admin = await requireAdmin(req);
  if (!admin) return NextResponse.json({ error: "Forbidden" }, { status: 403 });
  const { id } = await params;
  const body = await req.json();
  const org = await prisma.organisation.update({ where: { id }, data: body });
  return NextResponse.json({ organisation: org });
}

export async function DELETE(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const admin = await requireAdmin(req);
  if (!admin) return NextResponse.json({ error: "Forbidden" }, { status: 403 });
  const { id } = await params;
  // Unlink members before deleting
  await prisma.user.updateMany({ where: { organisationId: id }, data: { organisationId: null } });
  await prisma.organisation.delete({ where: { id } });
  return NextResponse.json({ ok: true });
}
