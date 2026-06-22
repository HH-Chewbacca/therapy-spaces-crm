import { NextRequest, NextResponse } from "next/server";
import { requireAdmin } from "@/lib/session";

export async function GET(req: NextRequest) {
  const user = await requireAdmin(req);
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  return NextResponse.json({ user: { id: user.id, name: user.name, email: user.email, role: user.role } });
}

export async function DELETE() {
  const res = NextResponse.json({ ok: true });
  res.cookies.delete("crm_session");
  return res;
}
