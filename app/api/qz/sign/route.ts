import { NextRequest, NextResponse } from "next/server";
import crypto from "crypto";

export async function POST(req: NextRequest) {
  try {
    const { request } = await req.json();

    const privateKey = (process.env.QZ_PRIVATE_KEY ?? "").replace(/\\n/g, "\n");
    const certificate = (process.env.QZ_CERTIFICATE ?? "").replace(/\\n/g, "\n");

    if (!privateKey || !certificate) {
      return NextResponse.json({ error: "QZ keys not configured" }, { status: 500 });
    }

    // Sign the request string QZ Tray sends us
    const sign = crypto.createSign("SHA512");
    sign.update(request);
    const signature = sign.sign(privateKey, "base64");

    return NextResponse.json({ signature, certificate });
  } catch (e) {
    console.error("QZ sign error:", e);
    return NextResponse.json({ error: "Signing failed" }, { status: 500 });
  }
}
