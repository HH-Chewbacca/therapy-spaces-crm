import { NextRequest, NextResponse } from "next/server";
import { requireAdmin } from "@/lib/session";
import { prisma } from "@/lib/prisma";

// Excluded card IDs (cleaner and Peter Strong's fob) — matches qselFanvilAudit

export async function POST(req: NextRequest) {
  const admin = await requireAdmin(req);
  if (!admin) return NextResponse.json({ error: "Forbidden" }, { status: 403 });

  const body = await req.json() as { rows: Array<{
    relay: number; result: string; name: string;
    cardId: string; entryType: string; reason?: string; entryTime: string;
  }>, locationId?: string };

  const { rows, locationId } = body;
  if (!rows?.length) return NextResponse.json({ error: "No rows provided" }, { status: 400 });

  // Filter to successful entries only (matches the Access query)
  const validRows = rows.filter(r => r.result === "Success");

  const created = await prisma.fanvilLog.createMany({
    data: validRows.map(r => ({
      relay: r.relay,
      result: r.result,
      name: r.name,
      cardId: String(r.cardId),
      entryType: r.entryType,
      reason: r.reason ?? null,
      entryTime: new Date(r.entryTime),
      locationId: locationId ?? null,
    })),
    skipDuplicates: false,
  });

  return NextResponse.json({ imported: created.count });
}
