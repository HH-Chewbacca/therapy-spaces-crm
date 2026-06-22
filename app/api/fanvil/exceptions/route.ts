import { NextRequest, NextResponse } from "next/server";
import { requireAdmin } from "@/lib/session";
import { prisma } from "@/lib/prisma";

// From qselFanvilAudit: 45 min before booking start, 30 min after booking end
const WINDOW_BEFORE_MS = 45 * 60 * 1000;
const WINDOW_AFTER_MS  = 30 * 60 * 1000;

// Excluded card IDs — cleaner (1398551661) and Peter Strong fob (6641417)
const EXCLUDED_CARD_IDS = new Set(["1398551661", "6641417"]);

export async function GET(req: NextRequest) {
  const admin = await requireAdmin(req);
  if (!admin) return NextResponse.json({ error: "Forbidden" }, { status: 403 });

  const { searchParams } = req.nextUrl;
  const from = searchParams.get("from");
  const to   = searchParams.get("to");
  if (!from || !to) return NextResponse.json({ error: "from and to required" }, { status: 400 });

  const fromDate = new Date(from);
  const toDate   = new Date(to);

  // Get all Fanvil logs in range, excluding the permanent exclusions
  const logs = await prisma.fanvilLog.findMany({
    where: {
      entryTime: { gte: fromDate, lte: toDate },
      result: "Success",
      NOT: { cardId: { in: [...EXCLUDED_CARD_IDS] } },
    },
    include: { location: { select: { name: true } } },
    orderBy: { entryTime: "asc" },
  });

  // Build a lookup of all therapists by their fanvilCardId
  const therapists = await prisma.user.findMany({
    where: { fanvilCardId: { not: null } },
    select: { id: true, name: true, fanvilCardId: true },
  });
  const therapistByCard = new Map(therapists.map(t => [t.fanvilCardId!, t]));

  // Get all bookings in the (extended) range — we need the window padding
  const windowedFrom = new Date(fromDate.getTime() - WINDOW_BEFORE_MS);
  const windowedTo   = new Date(toDate.getTime() + WINDOW_AFTER_MS);
  const bookings = await prisma.booking.findMany({
    where: {
      status: "CONFIRMED",
      startsAt: { gte: windowedFrom, lte: windowedTo },
    },
    select: { userId: true, startsAt: true, endsAt: true },
  });

  // For each log entry, check if there's a matching booking
  const exceptions = [];
  for (const log of logs) {
    const therapist = therapistByCard.get(log.cardId);

    // If no therapist record has this card ID at all, it's an unknown card — flag it
    if (!therapist) {
      exceptions.push({
        ...log,
        therapistName: null,
        reason: "Unknown card ID — not assigned to any therapist",
        hasBooking: false,
      });
      continue;
    }

    const entryMs = log.entryTime.getTime();
    const hasMatchingBooking = bookings.some(b =>
      b.userId === therapist.id &&
      entryMs >= b.startsAt.getTime() - WINDOW_BEFORE_MS &&
      entryMs <= b.endsAt.getTime() + WINDOW_AFTER_MS
    );

    if (!hasMatchingBooking) {
      exceptions.push({
        ...log,
        therapistName: therapist.name,
        reason: "No matching booking in window",
        hasBooking: false,
      });
    }
  }

  return NextResponse.json({ exceptions, total: logs.length, exceptionCount: exceptions.length });
}
