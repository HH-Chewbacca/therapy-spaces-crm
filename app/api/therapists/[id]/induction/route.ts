import { NextRequest, NextResponse } from "next/server";
import { requireAdmin } from "@/lib/session";
import { prisma } from "@/lib/prisma";
import { detectStlRequired } from "@/lib/stl";
import { sendInductionEmail } from "@/lib/email";
import fs from "fs";
import path from "path";

function loadPdf(slug: string): string {
  const filePath = path.join(process.cwd(), "public", "induction", `${slug}.pdf`);
  return fs.readFileSync(filePath).toString("base64");
}

export async function POST(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const admin = await requireAdmin(req);
  if (!admin) return NextResponse.json({ error: "Forbidden" }, { status: 403 });
  const { id } = await params;

  const therapist = await prisma.user.findUnique({
    where: { id },
    include: { authorisedLocations: { include: { location: { select: { id: true, name: true } } } } },
  });
  if (!therapist) return NextResponse.json({ error: "Not found" }, { status: 404 });

  // Determine branches from authorisedLocations
  const locationNames = therapist.authorisedLocations.map(l => l.location.name);
  const isSurbiton = locationNames.some(n => n.toLowerCase().includes("surbiton"));
  const isSwim = locationNames.some(n => n.toLowerCase().includes("wimbledon"));

  // If no locations set, default to both
  const branches: string[] = [];
  if (isSurbiton || (!isSurbiton && !isSwim)) branches.push("Surbiton");
  if (isSwim || (!isSurbiton && !isSwim)) branches.push("South Wimbledon");

  // Build attachment list
  const attachments: { filename: string; content: string }[] = [];

  // Contract always included
  const today = new Date().toLocaleDateString("en-GB", { day: "2-digit", month: "2-digit", year: "numeric" }).replace(/\//g, "-");
  attachments.push({ filename: `Contract_${today}.pdf`, content: loadPdf("contract") });

  // Branch-specific induction + EAP
  if (branches.includes("Surbiton")) {
    attachments.push({ filename: "Induction_Document_-_Surbiton.pdf", content: loadPdf("induction-surbiton") });
    attachments.push({ filename: "Emergency_Action_Plan_-_Surbiton.pdf", content: loadPdf("eap-surbiton") });
  }
  if (branches.includes("South Wimbledon")) {
    attachments.push({ filename: "Induction_Document_-_South_Wimbledon.pdf", content: loadPdf("induction-swim") });
    attachments.push({ filename: "Emergency_Action_Plan_-_South_Wimbledon.pdf", content: loadPdf("eap-swim") });
  }

  await sendInductionEmail({
    to: therapist.email,
    name: therapist.name,
    branches,
    skill: therapist.skill,
    stlStatus: therapist.stlStatus,
    stlRequired: (therapist.stlRequired || detectStlRequired(therapist.skill)),
    keyCardAlreadyIssued: !!(therapist.keyGivenDate || therapist.keySentDate),
    attachments,
  });

  // Record that pack was sent (reuse documentPackDate)
  await prisma.user.update({
    where: { id },
    data: { documentPackDate: new Date() },
  });

  return NextResponse.json({ ok: true, branches });
}
