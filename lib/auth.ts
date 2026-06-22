import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import crypto from "crypto";

const SESSION_SECRET = process.env.SESSION_SECRET || "dev-secret-change-me";
const SESSION_COOKIE_NAME = "session";
const SESSION_MAX_AGE_SECONDS = 60 * 60 * 24 * 30; // 30 days

export interface SessionPayload {
  userId: string;
  role: "SUPER_ADMIN" | "THERAPIST";
}

// ---------------------------------------------------------------------------
// Passwords
// ---------------------------------------------------------------------------

export async function hashPassword(plain: string): Promise<string> {
  return bcrypt.hash(plain, 12);
}

export async function verifyPassword(
  plain: string,
  hash: string
): Promise<boolean> {
  return bcrypt.compare(plain, hash);
}

export function validatePasswordStrength(password: string): {
  valid: boolean;
  error?: string;
} {
  if (password.length < 8) {
    return { valid: false, error: "Password must be at least 8 characters." };
  }
  return { valid: true };
}

// ---------------------------------------------------------------------------
// Session JWTs
// ---------------------------------------------------------------------------

export function createSessionToken(payload: SessionPayload): string {
  return jwt.sign(payload, SESSION_SECRET, {
    expiresIn: SESSION_MAX_AGE_SECONDS,
  });
}

export function verifySessionToken(token: string): SessionPayload | null {
  try {
    return jwt.verify(token, SESSION_SECRET) as SessionPayload;
  } catch {
    return null;
  }
}

export { SESSION_COOKIE_NAME, SESSION_MAX_AGE_SECONDS };

// ---------------------------------------------------------------------------
// Invite / reset tokens
// ---------------------------------------------------------------------------

/** Long random token for invite links and email-based reset links. */
export function generateLinkToken(): string {
  return crypto.randomBytes(32).toString("hex");
}

/** Short numeric code, suitable for emailing/texting as a reset code. */
export function generateNumericCode(length = 6): string {
  const max = 10 ** length;
  const num = crypto.randomInt(0, max);
  return num.toString().padStart(length, "0");
}
