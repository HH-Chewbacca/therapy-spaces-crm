/**
 * Email sending abstraction.
 *
 * In development (no API key configured) this logs to the console
 * instead of sending, so the app is fully testable without a real
 * provider. At deploy time, set EMAIL_PROVIDER + the relevant API key
 * env vars to send real emails via Resend (recommended) or SendGrid.
 *
 * This is intentionally a thin, generic interface so an SMS channel
 * (Twilio) can be added later as a sibling module (sms.ts) without
 * touching any calling code — callers just call `sendInviteEmail` /
 * `sendPasswordResetEmail`, not provider-specific functions.
 */

interface SendEmailParams {
  to: string;
  subject: string;
  html: string;
  text: string;
}

async function sendViaResend(params: SendEmailParams): Promise<void> {
  const apiKey = process.env.RESEND_API_KEY;
  const from = process.env.EMAIL_FROM || "bookings@example.com";

  const res = await fetch("https://api.resend.com/emails", {
    method: "POST",
    headers: {
      Authorization: `Bearer ${apiKey}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      from,
      to: params.to,
      subject: params.subject,
      html: params.html,
      text: params.text,
    }),
  });

  if (!res.ok) {
    const body = await res.text();
    throw new Error(`Resend email failed: ${res.status} ${body}`);
  }
}

async function sendEmail(params: SendEmailParams): Promise<void> {
  const provider = process.env.EMAIL_PROVIDER;

  if (provider === "resend" && process.env.RESEND_API_KEY) {
    await sendViaResend(params);
    return;
  }

  // Fallback: log instead of sending. Useful for local dev/testing
  // and means the app works end-to-end before any provider is wired up.
  console.log("---- EMAIL (dev mode, not actually sent) ----");
  console.log("To:", params.to);
  console.log("Subject:", params.subject);
  console.log(params.text);
  console.log("----------------------------------------------");
}

export async function sendInviteEmail(params: {
  to: string;
  name: string;
  inviteUrl: string;
}): Promise<void> {
  await sendEmail({
    to: params.to,
    subject: "You've been invited to set up your booking account",
    text: `Hi ${params.name},\n\nAn account has been created for you. Set your password here:\n${params.inviteUrl}\n\nThis link expires in 7 days.`,
    html: `<p>Hi ${params.name},</p><p>An account has been created for you. Set your password using the link below:</p><p><a href="${params.inviteUrl}">${params.inviteUrl}</a></p><p>This link expires in 7 days.</p>`,
  });
}

export async function sendPasswordResetEmail(params: {
  to: string;
  name: string;
  resetUrl: string;
}): Promise<void> {
  await sendEmail({
    to: params.to,
    subject: "Reset your password",
    text: `Hi ${params.name},\n\nReset your password here:\n${params.resetUrl}\n\nThis link expires in 1 hour. If you didn't request this, you can ignore this email.`,
    html: `<p>Hi ${params.name},</p><p>Reset your password using the link below:</p><p><a href="${params.resetUrl}">${params.resetUrl}</a></p><p>This link expires in 1 hour. If you didn't request this, you can ignore this email.</p>`,
  });
}

export interface DailySummaryEmailData {
  date: string; // e.g. "20 June 2026"
  monthLabel: string; // e.g. "June 2026"
  monthTotal: number;
  hoursBooked: number;
  hoursCancelled: number;
  cancellationsByTherapist: { name: string; hours: number }[];
  lastMonthSameDayTotal: number | null; // null if no data available for comparison
  lastYearSameDayTotal: number | null;
}

function formatHours(h: number): string {
  return `${h.toFixed(1)}h`;
}

function formatComparison(current: number, comparison: number | null): string {
  if (comparison === null) return "no comparable data";
  const diff = current - comparison;
  const sign = diff >= 0 ? "+" : "";
  return `${formatHours(comparison)} (${sign}${diff.toFixed(1)}h)`;
}

export async function sendDailySummaryEmail(
  to: string,
  data: DailySummaryEmailData
): Promise<void> {
  const cancellationLines =
    data.cancellationsByTherapist.length > 0
      ? data.cancellationsByTherapist.map((c) => `  - ${c.name}: ${formatHours(c.hours)}`).join("\n")
      : "  (none)";

  const cancellationListHtml =
    data.cancellationsByTherapist.length > 0
      ? `<ul>${data.cancellationsByTherapist
          .map((c) => `<li>${c.name}: ${formatHours(c.hours)}</li>`)
          .join("")}</ul>`
      : "<p>(none)</p>";

  const text = `Daily booking summary — ${data.date}

${data.monthLabel} total so far: ${formatHours(data.monthTotal)}
Hours booked today: ${formatHours(data.hoursBooked)}
Hours cancelled today: ${formatHours(data.hoursCancelled)}

Cancelled by:
${cancellationLines}

Comparison — same point in time:
  Last month: ${formatComparison(data.monthTotal, data.lastMonthSameDayTotal)}
  Last year: ${formatComparison(data.monthTotal, data.lastYearSameDayTotal)}
`;

  const html = `
    <h2>Daily booking summary — ${data.date}</h2>
    <p><strong>${data.monthLabel} total so far:</strong> ${formatHours(data.monthTotal)}</p>
    <p><strong>Hours booked today:</strong> ${formatHours(data.hoursBooked)}</p>
    <p><strong>Hours cancelled today:</strong> ${formatHours(data.hoursCancelled)}</p>
    <h3>Cancelled by</h3>
    ${cancellationListHtml}
    <h3>Comparison — same point in time</h3>
    <ul>
      <li>Last month: ${formatComparison(data.monthTotal, data.lastMonthSameDayTotal)}</li>
      <li>Last year: ${formatComparison(data.monthTotal, data.lastYearSameDayTotal)}</li>
    </ul>
  `;

  await sendEmail({
    to,
    subject: `Daily booking summary — ${data.date}`,
    text,
    html,
  });
}

interface Attachment {
  filename: string;
  content: string; // base64
}

async function sendViaResendWithAttachments(params: SendEmailParams & { attachments?: Attachment[] }): Promise<void> {
  const apiKey = process.env.RESEND_API_KEY;
  const from = process.env.EMAIL_FROM || "enquiries@therapyspaces.co.uk";

  const body: Record<string, unknown> = {
    from,
    to: params.to,
    subject: params.subject,
    html: params.html,
    text: params.text,
  };
  if (params.attachments?.length) {
    body.attachments = params.attachments.map(a => ({ filename: a.filename, content: a.content }));
  }

  const res = await fetch("https://api.resend.com/emails", {
    method: "POST",
    headers: { Authorization: `Bearer ${apiKey}`, "Content-Type": "application/json" },
    body: JSON.stringify(body),
  });
  if (!res.ok) {
    const bodyText = await res.text();
    throw new Error(`Resend email failed: ${res.status} ${bodyText}`);
  }
}

export function buildInductionEmailHtml(params: {
  name: string;
  branches: string[];
  stlRequired: boolean;
  keyCardAlreadyIssued: boolean;
}): string {
  const { name, branches, stlRequired, keyCardAlreadyIssued } = params;
  const firstName = name.split(" ")[0];
  const branchList = branches.join(" and ");
  const stlBullet = stlRequired
    ? `<li>Evidence of a special treatment licence or membership of an organisation with an exemption</li>`
    : "";
  const accessItems: string[] = [];
  if (branches.some(b => b.toLowerCase().includes("surbiton"))) accessItems.push("key");
  if (branches.some(b => b.toLowerCase().includes("wimbledon"))) accessItems.push("fob");
  const accessPhrase = accessItems.join(" and ") || "key";
  const keyLine = keyCardAlreadyIssued
    ? `Once we've received these, we can arrange access to our online room booking system.`
    : `Once we've received these, we can arrange access to our online room booking system and arrange to get a ${accessPhrase} to you.`;
  return `
<p>Dear ${firstName},</p>

<p>I enclose our Terms of Agreement and associated induction documents for your review; if you are happy with this I would be grateful if you could sign, scan and return this to us by email. Please could you also provide us with a copy of the following:</p>

<ul>
  <li>Professional indemnity insurance</li>
  <li>Evidence of professional accreditation</li>
  <li>Photographic ID, either passport or driving licence</li>
  <li>A utility bill from the past three months as proof of address</li>
  ${stlBullet}
</ul>

<p>${keyLine}</p>

<p>We have agreed that we will license you to use rooms in ${branchList}. Room charges are shown in the attached induction document.</p>

<p>Payment will be taken by direct debit at the end of each month. We will email you a link to set up the direct debit; we use GoCardless as our service provider and all payments are of course covered by the direct debit guarantee. We use an online room booking system and therapists are provided with a username and password for managing booking details.</p>

<p>Please let me know if you have any questions and we look forward to welcoming you to the clinic.</p>

<p>Best regards,<br/>
<strong>Peter Strong</strong><br/>
Director</p>

<table cellpadding="0" cellspacing="0" border="0" style="margin-top:16px">
  <tr>
    <td style="padding-right:12px;vertical-align:middle">
      <img src="https://admin.therapyspaces.co.uk/logo.jpg" alt="Therapy Spaces" width="48" style="display:block"/>
    </td>
    <td style="vertical-align:middle;font-family:Arial,sans-serif;font-size:13px;color:#444">
      <strong style="color:#222">Therapy Spaces</strong><br/>
      t: 07710 132 221<br/>
      e: <a href="mailto:enquiries@therapyspaces.co.uk">enquiries@therapyspaces.co.uk</a><br/>
      w: <a href="https://www.therapyspaces.co.uk">www.therapyspaces.co.uk</a>
    </td>
  </tr>
</table>
`;
}

export async function sendInductionEmail(params: {
  to: string;
  name: string;
  branches: string[]; // e.g. ["Surbiton"] or ["South Wimbledon"] or both
  skill: string | null;
  stlStatus: string | null;
  stlRequired: boolean;
  keyCardAlreadyIssued: boolean;
  attachments: Attachment[];
}): Promise<void> {
  const { name, branches, stlRequired, keyCardAlreadyIssued } = params;
  const firstName = name.split(" ")[0];
  const branchList = branches.join(" and ");

  const accessItems: string[] = [];
  if (branches.some(b => b.toLowerCase().includes("surbiton"))) accessItems.push("key");
  if (branches.some(b => b.toLowerCase().includes("wimbledon"))) accessItems.push("fob");
  const accessPhrase = accessItems.join(" and ") || "key";

  const keyLine = keyCardAlreadyIssued
    ? `Once we've received these, we can arrange access to our online room booking system.`
    : `Once we've received these, we can arrange access to our online room booking system and arrange to get a ${accessPhrase} to you.`;

  const html = buildInductionEmailHtml({ name, branches, stlRequired, keyCardAlreadyIssued });

  const text = `Dear ${firstName},

I enclose our Terms of Agreement and associated induction documents for your review; if you are happy with this I would be grateful if you could sign, scan and return this to us by email. Please could you also provide us with a copy of the following:

- Professional indemnity insurance
- Evidence of professional accreditation
- Photographic ID, either passport or driving licence
- A utility bill from the past three months as proof of address${stlRequired ? "\n- Evidence of a special treatment licence or membership of an organisation with an exemption" : ""}

${keyLine}

We have agreed that we will license you to use rooms in ${branchList}. Room charges are shown in the attached induction document.

Payment will be taken by direct debit at the end of each month. We will email you a link to set up the direct debit; we use GoCardless as our service provider and all payments are of course covered by the direct debit guarantee. We use an online room booking system and therapists are provided with a username and password for managing booking details.

Please let me know if you have any questions and we look forward to welcoming you to the clinic.

Best regards,
Peter Strong
Director
Therapy Spaces
t: 07710 132 221
e: enquiries@therapyspaces.co.uk
w: www.therapyspaces.co.uk`;

  const provider = process.env.EMAIL_PROVIDER;
  if (provider === "resend" && process.env.RESEND_API_KEY) {
    await sendViaResendWithAttachments({
      to: params.to,
      subject: "Therapy Spaces Induction Pack",
      html,
      text,
      attachments: params.attachments,
    });
  } else {
    console.log("---- INDUCTION EMAIL (dev mode) ----");
    console.log("To:", params.to);
    console.log("Branches:", branchList);
    console.log("Attachments:", params.attachments.map(a => a.filename).join(", "));
    console.log(text);
    console.log("------------------------------------");
  }
}
