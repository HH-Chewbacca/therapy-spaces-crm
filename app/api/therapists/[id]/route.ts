import { NextRequest, NextResponse } from "next/server";
import { requireAdmin } from "@/lib/session";
import { prisma } from "@/lib/prisma";

export async function GET(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const admin = await requireAdmin(req);
  if (!admin) return NextResponse.json({ error: "Forbidden" }, { status: 403 });
  const { id } = await params;

  const therapist = await prisma.user.findUnique({
    where: { id },
    include: {
      organisation: true,
      primaryBranch: { select: { id: true, name: true } },
      authorisedLocations: { include: { location: { select: { id: true, name: true } } } },
    },
  });
  if (!therapist) return NextResponse.json({ error: "Not found" }, { status: 404 });
  return NextResponse.json({ therapist });
}

export async function PATCH(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const admin = await requireAdmin(req);
  if (!admin) return NextResponse.json({ error: "Forbidden" }, { status: 403 });
  const { id } = await params;

  const body = await req.json();
  const { locationIds, ...fields } = body;

  if (fields.email) {
    const conflict = await prisma.user.findFirst({ where: { email: fields.email, id: { not: id } } });
    if (conflict) return NextResponse.json({ error: "Email already in use." }, { status: 409 });
  }

  const therapist = await prisma.user.update({ where: { id }, data: fields });

  if (locationIds !== undefined) {
    await prisma.userLocation.deleteMany({ where: { userId: id } });
    if (locationIds.length > 0) {
      await prisma.userLocation.createMany({
        data: locationIds.map((locationId: string) => ({ userId: id, locationId })),
      });
    }
  }

  return NextResponse.json({ therapist });
}

export async function DELETE(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const admin = await requireAdmin(req);
  if (!admin) return NextResponse.json({ error: "Forbidden" }, { status: 403 });
  const { id } = await params;

  // Prevent deleting yourself
  if (id === admin.id) return NextResponse.json({ error: "Cannot delete your own account." }, { status: 400 });

  await prisma.user.delete({ where: { id } });
  return NextResponse.json({ ok: true });
}
