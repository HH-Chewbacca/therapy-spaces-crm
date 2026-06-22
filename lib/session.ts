import { NextRequest } from "next/server";
import { verifySessionToken } from "./auth";
import { prisma } from "./prisma";

export async function requireAdmin(req: NextRequest) {
  const token = req.cookies.get("crm_session")?.value;
  if (!token) return null;
  try {
    const payload = verifySessionToken(token) as { userId: string; role: string };
    if (payload.role !== "SUPER_ADMIN") return null;
    return await prisma.user.findUnique({ where: { id: payload.userId } });
  } catch {
    return null;
  }
}
