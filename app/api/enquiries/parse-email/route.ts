import { NextRequest, NextResponse } from "next/server";
import { requireAdmin } from "@/lib/session";
import MsgReader from "@kenjiuno/msgreader";

const LABEL_MAP: Record<string, string> = {
  "name": "name",
  "email": "email",
  "phone": "phone",
  "location": "location",
  "therapy type": "therapyType",
  "booking type": "bookingType",
  "message": "message",
};

const BOILERPLATE = [
  "visitor ip", "report spam", "don't want", "this e-mail", "powered by",
  "form submission", "new form has been", "hello,", "a new form",
];

function parseBody(body: string): Record<string, string> {
  const lines = body.replace(/\r\n/g, "\n").replace(/\r/g, "\n").split("\n");
  const result: Record<string, string> = {};
  let currentKey: string | null = null;
  const valueLines: string[] = [];

  function flush() {
    if (currentKey) result[currentKey] = valueLines.join(" ").trim();
    valueLines.length = 0;
  }

  for (const line of lines) {
    const trimmed = line.trim();
    if (!trimmed) continue;

    const lower = trimmed.toLowerCase();
    const mappedKey = LABEL_MAP[lower];

    if (mappedKey) {
      flush();
      currentKey = mappedKey;
    } else if (currentKey) {
      if (BOILERPLATE.some(b => lower.startsWith(b))) {
        flush();
        currentKey = null;
      } else {
        valueLines.push(trimmed);
      }
    }
  }
  flush();
  return result;
}

// Accepts multipart/form-data with a 'file' field containing the .msg binary
export async function POST(req: NextRequest) {
  const admin = await requireAdmin(req);
  if (!admin) return NextResponse.json({ error: "Forbidden" }, { status: 403 });

  const formData = await req.formData();
  const file = formData.get("file") as File | null;

  if (!file) return NextResponse.json({ error: "No file provided" }, { status: 400 });

  const arrayBuffer = await file.arrayBuffer();
  const buffer = Buffer.from(arrayBuffer);

  let body = "";
  try {
    const reader = new MsgReader(buffer);
    const info = reader.getFileData();
    body = info.body ?? "";
  } catch {
    // Fallback: try treating as plain text (e.g. .eml files)
    body = buffer.toString("utf-8");
  }

  const parsed = parseBody(body);

  // Split name into first/last
  const nameParts = (parsed.name ?? "").trim().split(/\s+/);
  const firstName = nameParts.length > 1 ? nameParts.slice(0, -1).join(" ") : parsed.name ?? "";
  const lastName  = nameParts.length > 1 ? nameParts[nameParts.length - 1] : "";

  return NextResponse.json({
    firstName,
    lastName,
    email:       parsed.email ?? "",
    phone:       parsed.phone ?? "",
    location:    parsed.location ?? "",
    therapyType: parsed.therapyType ?? "",
    bookingType: parsed.bookingType ?? "",
    message:     parsed.message ?? "",
    rawEmail:    body,
  });
}
