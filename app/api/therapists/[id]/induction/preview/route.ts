import { NextRequest, NextResponse } from "next/server";
import { requireAdmin } from "@/lib/session";
import { prisma } from "@/lib/prisma";
import { detectStlRequired } from "@/lib/stl";
import { buildInductionEmailHtml } from "@/lib/email";
import { LOGO_DATA_URI } from "@/lib/logo";

export async function GET(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const admin = await requireAdmin(req);
  if (!admin) return NextResponse.json({ error: "Forbidden" }, { status: 403 });
  const { id } = await params;

  const therapist = await prisma.user.findUnique({
    where: { id },
    include: { authorisedLocations: { include: { location: { select: { id: true, name: true } } } } },
  });
  if (!therapist) return NextResponse.json({ error: "Not found" }, { status: 404 });

  const locationNames = therapist.authorisedLocations.map(l => l.location.name);
  const isSurbiton = locationNames.some(n => n.toLowerCase().includes("surbiton"));
  const isSwim = locationNames.some(n => n.toLowerCase().includes("wimbledon"));
  const branches: string[] = [];
  if (isSurbiton || (!isSurbiton && !isSwim)) branches.push("Surbiton");
  if (isSwim || (!isSurbiton && !isSwim)) branches.push("South Wimbledon");

  const html = buildInductionEmailHtml({
    name: therapist.name,
    branches,
    stlRequired: (therapist.stlRequired || detectStlRequired(therapist.skill)),
    keyCardAlreadyIssued: !!(therapist.keyGivenDate || therapist.keySentDate),
    logoSrc: LOGO_DATA_URI,
  });

  return NextResponse.json({ html, to: therapist.email, branches });
}
