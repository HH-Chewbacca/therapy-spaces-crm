/** UK phone display formatting + SIP click-to-dial helpers. */

export function formatPhone(raw: string | null | undefined): string {
  if (!raw) return "";
  const digits = raw.replace(/\D/g, "");
  // Mobiles (07…): 5-3-3  ->  07XXX XXX XXX
  if (digits.length === 11 && digits.startsWith("07")) {
    return `${digits.slice(0, 5)} ${digits.slice(5, 8)} ${digits.slice(8)}`;
  }
  // London (020…): 3-4-4  ->  020 XXXX XXXX
  if (digits.length === 11 && digits.startsWith("020")) {
    return `${digits.slice(0, 3)} ${digits.slice(3, 7)} ${digits.slice(7)}`;
  }
  return raw.trim();
}

/** Build a sip: URI for click-to-dial. If NEXT_PUBLIC_SIP_DOMAIN is set the
 *  number is qualified as sip:<number>@<domain>, otherwise sip:<number>. */
export function sipHref(raw: string | null | undefined): string | null {
  if (!raw) return null;
  const digits = raw.replace(/\D/g, "");
  if (!digits) return null;
  const domain = process.env.NEXT_PUBLIC_SIP_DOMAIN;
  return domain ? `sip:${digits}@${domain}` : `sip:${digits}`;
}
