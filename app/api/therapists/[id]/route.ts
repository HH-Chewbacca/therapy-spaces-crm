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

const ALLOWED_FIELDS = new Set([
  "name","email","phone","isActive","companyName","skill","notes","referredBy","flag",
  "address1","address2","address3","address4","postcode","county","country",
  "sameInvoiceAddress","invoiceCompanyName","invoiceFirstName","invoiceSurName",
  "invoiceEmailAddress","invoicePhoneNumber","invoiceMobileNumber",
  "invoiceAddress1","invoiceAddress2","invoiceAddress3","invoiceAddress4",
  "invoicePostcode","invoiceCounty","invoiceCountry",
  "viewingDate","documentPackDate","idChecked","addressChecked",
  "accreditationChecked","insuranceChecked","documentReviewDate",
  "bookingSystemInvitedAt","keyGivenDate","keySentDate","keyCard","depositInvoicedDate",
  "accreditationBody","accreditationNumber",
  "clinicTelephone","clinicEmail","website","clinicsDaysTimes","fees",
  "insuranceCompanies","bioText","showProfile","includeInBilling",
  "organisationId","documentsUrl","fanvilCardId",
]);

const DATE_FIELDS = new Set([
  "viewingDate","documentPackDate","documentReviewDate","bookingSystemInvitedAt",
  "keyGivenDate","keySentDate","depositInvoicedDate",
]);

// Ensure date-only strings (YYYY-MM-DD) become full ISO-8601 datetimes
function normaliseDate(v: unknown): unknown {
  if (typeof v !== "string" || v === "") return v === "" ? null : v;
  if (/^\d{4}-\d{2}-\d{2}$/.test(v)) return v + "T00:00:00.000Z";
  return v;
}

export async function PATCH(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const admin = await requireAdmin(req);
  if (!admin) return NextResponse.json({ error: "Forbidden" }, { status: 403 });
  const { id } = await params;

  let body: Record<string, unknown>;
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ error: "Invalid JSON" }, { status: 400 });
  }

  const { locationIds, ...rest } = body;

  const fields: Record<string, unknown> = {};
  for (const [k, v] of Object.entries(rest)) {
    if (!ALLOWED_FIELDS.has(k)) continue;
    fields[k] = DATE_FIELDS.has(k) ? normaliseDate(v) : v;
  }

  if (fields.email) {
    const conflict = await prisma.user.findFirst({
      where: { email: fields.email as string, id: { not: id } }
    });
    if (conflict) return NextResponse.json({ error: "Email already in use." }, { status: 409 });
  }

  try {
    const therapist = await prisma.user.update({ where: { id }, data: fields });

    if (locationIds !== undefined) {
      await prisma.userLocation.deleteMany({ where: { userId: id } });
      if (Array.isArray(locationIds) && locationIds.length > 0) {
        await prisma.userLocation.createMany({
          data: (locationIds as string[]).map((locationId) => ({ userId: id, locationId })),
        });
      }
    }

    return NextResponse.json({ therapist });
  } catch (e) {
    const msg = e instanceof Error ? e.message : "Unknown error";
    console.error("PATCH /api/therapists/[id] error:", msg);
    return NextResponse.json({ error: msg }, { status: 500 });
  }
}

export async function DELETE(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const admin = await requireAdmin(req);
  if (!admin) return NextResponse.json({ error: "Forbidden" }, { status: 403 });
  const { id } = await params;

  if (id === admin.id) return NextResponse.json({ error: "Cannot delete your own account." }, { status: 400 });

  await prisma.user.delete({ where: { id } });
  return NextResponse.json({ ok: true });
}
