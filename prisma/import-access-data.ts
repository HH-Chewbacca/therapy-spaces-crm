import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

// Paste the raw TSV data between the backticks below
const RAW_TSV = `PASTE_TSV_HERE`;

function parseDate(raw: string | undefined): Date | null {
  if (!raw || raw.trim() === "" || raw.trim() === "0") return null;
  const s = raw.trim();
  // Formats: "06/03/2023", "06/03/2023 15:17:52", "06/03/2023 15:17:26"
  const match = s.match(/^(\d{2})\/(\d{2})\/(\d{4})/);
  if (!match) return null;
  const [, day, month, year] = match;
  return new Date(`${year}-${month}-${day}T00:00:00.000Z`);
}

function clean(s: string | undefined): string | null {
  if (!s) return null;
  const t = s.trim().replace(/^"|"$/g, "");
  return t === "" || t === "0" ? null : t;
}

async function main() {
  const lines = RAW_TSV.trim().split("\n");
  const header = lines[0].split("\t");

  // Find second block start (second occurrence of TherapistID)
  let secondStart = -1;
  for (let i = 1; i < header.length; i++) {
    if (header[i] === "TherapistID") { secondStart = i; break; }
  }
  if (secondStart === -1) throw new Error("Could not find second block");

  // Column offsets from secondStart
  const C = {
    firstName:          secondStart + 3,
    lastName:           secondStart + 4,
    phone:              secondStart + 5,
    email:              secondStart + 7,
    address1:           secondStart + 8,
    address2:           secondStart + 9,
    address3:           secondStart + 10,
    city:               secondStart + 11,
    postcode:           secondStart + 12,
    county:             secondStart + 13,
    skill:              secondStart + 14,
    companyName:        secondStart + 2,
    notes:              secondStart + 30,
    referredBy:         secondStart + 31,
    viewingDate:        secondStart + 35,
    documentPackDate:   secondStart + 36,
    documentReviewDate: secondStart + 37,
    skeddaEnrolled:     secondStart + 38,
    keyGiven:           secondStart + 40,
    depositInvoiced:    secondStart + 41,
    accreditationBody:  secondStart + 42,
    accreditationNumber:secondStart + 43,
    clinicTelephone:    secondStart + 51,
    clinicEmail:        secondStart + 52,
    website:            secondStart + 53,
    keySent:            secondStart + 60,
    keyCard:            secondStart + 61,
  };

  let updated = 0, notFound = 0, skipped = 0;

  for (let i = 1; i < lines.length; i++) {
    const cols = lines[i].split("\t");
    if (cols.length < secondStart + 30) { skipped++; continue; }

    const firstName = clean(cols[C.firstName]) ?? "";
    const lastName  = clean(cols[C.lastName])  ?? "";
    if (!firstName && !lastName) { skipped++; continue; }

    const fullName = `${firstName} ${lastName}`.trim();

    // Find by name (case-insensitive)
    const existing = await prisma.user.findFirst({
      where: {
        name: { equals: fullName, mode: "insensitive" },
        role: "THERAPIST",
      },
    });

    if (!existing) {
      console.log(`NOT FOUND: ${fullName}`);
      notFound++;
      continue;
    }

    const referredByRaw = clean(cols[C.referredBy]);
    const referredBy = referredByRaw
      ? (["Website", "UKTR", "Friend", "Walk In", "Other"].includes(referredByRaw)
          ? referredByRaw
          : "Other")
      : null;

    await prisma.user.update({
      where: { id: existing.id },
      data: {
        phone:               clean(cols[C.phone])              ?? existing.phone,
        companyName:         clean(cols[C.companyName])        ?? existing.companyName,
        address1:            clean(cols[C.address1])           ?? existing.address1,
        address2:            clean(cols[C.address2])           ?? existing.address2,
        address3:            clean(cols[C.city])               ?? existing.address3,
        postcode:            clean(cols[C.postcode])           ?? existing.postcode,
        county:              clean(cols[C.county])             ?? existing.county,
        skill:               clean(cols[C.skill])              ?? existing.skill,
        notes:               clean(cols[C.notes])              ?? existing.notes,
        referredBy:          referredBy                        ?? existing.referredBy,
        accreditationBody:   clean(cols[C.accreditationBody])  ?? existing.accreditationBody,
        accreditationNumber: clean(cols[C.accreditationNumber])?? existing.accreditationNumber,
        clinicTelephone:     clean(cols[C.clinicTelephone])    ?? existing.clinicTelephone,
        clinicEmail:         clean(cols[C.clinicEmail])        ?? existing.clinicEmail,
        website:             clean(cols[C.website])            ?? existing.website,
        keyCard:             clean(cols[C.keyCard])            ?? existing.keyCard,
        viewingDate:         parseDate(cols[C.viewingDate])    ?? existing.viewingDate,
        documentPackDate:    parseDate(cols[C.documentPackDate])   ?? existing.documentPackDate,
        documentReviewDate:  parseDate(cols[C.documentReviewDate]) ?? existing.documentReviewDate,
        bookingSystemInvitedAt: parseDate(cols[C.skeddaEnrolled])  ?? existing.bookingSystemInvitedAt,
        keyGivenDate:        parseDate(cols[C.keyGiven])       ?? existing.keyGivenDate,
        keySentDate:         parseDate(cols[C.keySent])        ?? existing.keySentDate,
        depositInvoicedDate: parseDate(cols[C.depositInvoiced])?? existing.depositInvoicedDate,
      },
    });

    console.log(`UPDATED: ${fullName}`);
    updated++;
  }

  console.log(`\nDone. Updated: ${updated}, Not found: ${notFound}, Skipped: ${skipped}`);
}

main().catch(console.error).finally(() => prisma.$disconnect());
