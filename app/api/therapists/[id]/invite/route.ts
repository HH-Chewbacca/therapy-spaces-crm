import { NextRequest, NextResponse } from "next/server";
import { requireAdmin } from "@/lib/session";
import { prisma } from "@/lib/prisma";
import { generateLinkToken } from "@/lib/auth";
import { sendInviteEmail } from "@/lib/email";

const INVITE_TTL_MS = 7 * 24 * 60 * 60 * 1000;

export async function POST(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const admin = await requireAdmin(req);
  if (!admin) return NextResponse.json({ error: "Forbidden" }, { status: 403 });
  const { id } = await params;

  const therapist = await prisma.user.findUnique({ where: { id } });
  if (!therapist) return NextResponse.json({ error: "Not found" }, { status: 404 });
  if (therapist.passwordHash) return NextResponse.json({ error: "Therapist has already set up their account." }, { status: 409 });

  const token = generateLinkToken();
  await prisma.inviteToken.create({
    data: { token, userId: id, expiresAt: new Date(Date.now() + INVITE_TTL_MS) },
  });

  const baseUrl = process.env.BOOKING_APP_URL ?? process.env.APP_URL ?? req.nextUrl.origin;
  const inviteUrl = `${baseUrl}/accept-invite?token=${token}`;
  await sendInviteEmail({ to: therapist.email, name: therapist.name, inviteUrl });

  // Record when the invite was sent
  await prisma.user.update({
    where: { id },
    data: { bookingSystemInvitedAt: new Date() },
  });

  return NextResponse.json({ ok: true, inviteUrl });
}
