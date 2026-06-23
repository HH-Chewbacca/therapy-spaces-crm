"use client";
import { useState, useEffect, useCallback, use } from "react";
import { useRouter } from "next/navigation";
import { Button } from "@/components/ui/Button";
import { Card, Alert } from "@/components/ui/Card";
import { Input, Label, Select } from "@/components/ui/Input";

interface Organisation { id: string; name: string; }
interface Location { id: string; name: string; }
interface Therapist {
  id: string; name: string; email: string; phone: string | null;
  isActive: boolean; companyName: string | null;
  address1: string | null; address2: string | null; address3: string | null;
  address4: string | null; postcode: string | null; county: string | null; country: string | null;
  skill: string | null; sameInvoiceAddress: boolean;
  invoiceCompanyName: string | null; invoiceFirstName: string | null;
  invoiceSurName: string | null; invoiceEmailAddress: string | null;
  invoicePhoneNumber: string | null; invoiceMobileNumber: string | null;
  invoiceAddress1: string | null; invoiceAddress2: string | null;
  invoiceAddress3: string | null; invoiceAddress4: string | null;
  invoicePostcode: string | null; invoiceCounty: string | null; invoiceCountry: string | null;
  notes: string | null; referredBy: string | null; flag: boolean; stlRequired: boolean;
  createdAt: string;
  viewingDate: string | null; documentPackDate: string | null;
  idChecked: boolean; addressChecked: boolean;
  accreditationChecked: boolean; insuranceChecked: boolean; stlStatus: string | null;
  documentReviewDate: string | null; bookingSystemInvitedAt: string | null;
  keyGivenDate: string | null; keySentDate: string | null;
  keyCard: string | null; depositInvoicedDate: string | null;
  accreditationBody: string | null; accreditationNumber: string | null;
  clinicTelephone: string | null; clinicEmail: string | null; website: string | null;
  clinicsDaysTimes: string | null; fees: string | null; insuranceCompanies: string | null;
  bioText: string | null; showProfile: boolean; includeInBilling: boolean;
  organisationId: string | null; documentsUrl: string | null; fanvilCardId: string | null;
  organisation: Organisation | null;
  primaryBranch: { id: string; name: string } | null;
  authorisedLocations: { location: { id: string; name: string } }[];
}

const REFERRAL_OPTIONS = ["Website", "UKTR", "Friend", "Walk In", "Other"];

// Keywords that indicate STL is likely required (from London Local Authorities Act A-Z list)
const STL_KEYWORDS = [
  "acupressure","acupuncture","acupuncturist","aesthet","aromatherapy","ayurvedic",
  "body massage","body piercing","body talk","body wrap","bowen","champissage",
  "chiropody","chiropractic","chiropractor","colour therapy","craniosacral","cryosauna",
  "deep tissue","dermal filler","dry needling","eft","electrolysis","electrocautery",
  "endermologie","faradism","fibroblast","filler","floatation","foot detox","galvanism",
  "gyratory","halotherapy","high frequency","holistic massage","hot stone","hydrotherapy",
  "indian head","infra red","infrared","infusion","ipl","kirlian","korean hand",
  "laser","lipo","lymphatic drainage","manicure","manual lymphatic","marma",
  "massage","metamorphic","micro current","microblading","micropigmentation","moxibustion",
  "myofascial","naet","nail extension","neuroskeletal","no hands massage","osteopath",
  "osteomyology","oxygen therapy","ozone sauna","pedicure","permanent make","permanent makeup",
  "physiotherap","physiotherapy","plasma","podiatry","polarity therapy","prp",
  "qi gong","radio frequency","reflexolog","reiki","rolfing","roll shaper","sauna",
  "scenar","semi permanent","shiatsu","soft tissue","spmu","sports massage","sports therapy",
  "steam","stone therapy","swedish massage","tapas acupressure","tattoo","thai massage",
  "thalassotherapy","thermavein","tongue tie","tui na","tui-na","ultrasonic","ultra sonic",
  "ultra violet","uv tanning",
];

function detectStlRequired(skill: string | null): boolean {
  if (!skill) return false;
  const s = skill.toLowerCase();
  return STL_KEYWORDS.some(k => s.includes(k));
}

function isOnboardingComplete(t: Therapist): boolean {
  return !!t.depositInvoicedDate;
}

function Section({ title, children }: { title: string; children: React.ReactNode }) {
  return (
    <Card className="space-y-4">
      <h2 className="text-xs font-semibold text-muted-foreground uppercase tracking-wider border-b border-border pb-2">{title}</h2>
      {children}
    </Card>
  );
}

function F({ label, children }: { label: string; children: React.ReactNode }) {
  return <div><Label>{label}</Label>{children}</div>;
}

function CheckStep({ label, checked, onChange }: { label: string; checked: boolean; onChange: (v: boolean) => void }) {
  return (
    <div className="flex items-center gap-3 cursor-pointer" onClick={() => onChange(!checked)}>
      <div className={`w-5 h-5 rounded-full border-2 flex items-center justify-center shrink-0 transition-colors ${checked ? "bg-primary border-primary" : "border-border"}`}>
        {checked && <svg className="w-3 h-3 text-primary-foreground" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={3}><path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" /></svg>}
      </div>
      <span className="text-sm text-foreground">{label}</span>
    </div>
  );
}

function DateStep({ label, value, onChange, actionLabel, onAction }: {
  label: string; value: string | null; onChange: (v: string) => void;
  actionLabel?: string; onAction?: () => void;
}) {
  const done = !!value;
  return (
    <div className="flex items-center gap-3">
      <div className={`w-5 h-5 rounded-full border-2 flex items-center justify-center shrink-0 ${done ? "bg-primary border-primary" : "border-border"}`}>
        {done && <svg className="w-3 h-3 text-primary-foreground" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={3}><path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" /></svg>}
      </div>
      <div className="flex-1">
        <p className="text-xs font-medium text-muted-foreground mb-1">{label}</p>
        <div className="flex items-center gap-2">
          <input type="date" value={value?.slice(0, 10) ?? ""} onChange={e => onChange(e.target.value)}
            className="rounded-[var(--radius)] border border-border bg-surface px-2 py-1 text-sm text-foreground focus-visible:outline-2 focus-visible:outline-primary" />
          {!done && actionLabel && onAction && (
            <button onClick={onAction}
              className="text-xs px-2 py-1 rounded-[var(--radius)] bg-primary text-primary-foreground hover:bg-primary-hover transition-colors">
              {actionLabel}
            </button>
          )}
        </div>
      </div>
    </div>
  );
}

function today() {
  return new Date().toISOString().slice(0, 10);
}

function abbrevBranch(name: string): string {
  const n = name.toLowerCase();
  if (n.includes("wimbledon")) return "SWIM";
  if (n.includes("surbiton")) return "SURB";
  return name;
}

export default function TherapistDetailPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = use(params);
  const router = useRouter();
  const [t, setT] = useState<Therapist | null>(null);
  const [orgs, setOrgs] = useState<Organisation[]>([]);
  const [locations, setLocations] = useState<Location[]>([]);
  const [selectedLocationIds, setSelectedLocationIds] = useState<string[]>([]);
  const [saving, setSaving] = useState(false);
  const [inviting, setInviting] = useState(false);
  const [sendingInduction, setSendingInduction] = useState(false);
  const [deleting, setDeleting] = useState(false);
  const [msg, setMsg] = useState<{ text: string; type: "success" | "error" } | null>(null);
  const [onboardingOpen, setOnboardingOpen] = useState(true);

  const load = useCallback(async () => {
    const [tr, or, lr] = await Promise.all([
      fetch(`/api/therapists/${id}`).then(r => r.json()),
      fetch("/api/organisations").then(r => r.json()),
      fetch("/api/locations").then(r => r.json()),
    ]);
    if (!tr.therapist) { router.push("/therapists"); return; }
    const therapist = tr.therapist;
    // Auto-set stlRequired if not already set and skill matches keywords
    if (!therapist.stlRequired && detectStlRequired(therapist.skill)) {
      therapist.stlRequired = true;
    }
    setT(therapist);
    setOrgs(or.organisations ?? []);
    setLocations(lr.locations ?? []);
    setSelectedLocationIds(tr.therapist.authorisedLocations.map((l: { location: { id: string } }) => l.location.id));
    setOnboardingOpen(!isOnboardingComplete(tr.therapist));
  }, [id, router]);

  // eslint-disable-next-line react-hooks/set-state-in-effect
  useEffect(() => { load(); }, [load]);

  function update<K extends keyof Therapist>(field: K, value: Therapist[K]) {
    setT(prev => prev ? { ...prev, [field]: value } : prev);
  }

  function toggleLocation(locId: string) {
    setSelectedLocationIds(prev =>
      prev.includes(locId) ? prev.filter(x => x !== locId) : [...prev, locId]
    );
  }

  async function save() {
    if (!t) return;
    setSaving(true); setMsg(null);

    const DATE_FIELDS = [
      "viewingDate","documentPackDate","documentReviewDate",
      "bookingSystemInvitedAt","keyGivenDate","keySentDate","depositInvoicedDate",
    ] as const;
    const payload = { ...t, locationIds: selectedLocationIds } as Record<string, unknown>;
    for (const f of DATE_FIELDS) {
      const v = payload[f];
      if (typeof v === "string" && v.length === 10) payload[f] = v + "T00:00:00.000Z";
    }

    const res = await fetch(`/api/therapists/${t.id}`, {
      method: "PATCH",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(payload),
    });
    if (res.ok) { setMsg({ text: "Saved successfully.", type: "success" }); await load(); }
    else { const d = await res.json(); setMsg({ text: d.error ?? "Error saving", type: "error" }); }
    setSaving(false);
  }

  async function sendInvite() {
    if (!t || !confirm(`Send booking system invite to ${t.email}?`)) return;
    setInviting(true); setMsg(null);
    const res = await fetch(`/api/therapists/${t.id}/invite`, { method: "POST" });
    if (res.ok) { setMsg({ text: "Invite sent.", type: "success" }); await load(); }
    else { const d = await res.json(); setMsg({ text: d.error ?? "Error sending invite", type: "error" }); }
    setInviting(false);
  }

  async function sendInductionPack() {
    if (!t || !confirm(`Send induction pack to ${t.email}?`)) return;
    setSendingInduction(true); setMsg(null);
    const res = await fetch(`/api/therapists/${t.id}/induction`, { method: "POST" });
    if (res.ok) {
      const d = await res.json();
      setMsg({ text: `Induction pack sent for ${d.branches.join(" & ")}.`, type: "success" });
      await load();
    } else {
      const d = await res.json();
      setMsg({ text: d.error ?? "Error sending induction pack", type: "error" });
    }
    setSendingInduction(false);
  }

  async function deleteTherapist() {
    if (!t || !confirm(`Permanently delete ${t.name}? This cannot be undone.`)) return;
    setDeleting(true);
    const res = await fetch(`/api/therapists/${t.id}`, { method: "DELETE" });
    if (res.ok) {
      router.push(t.depositInvoicedDate ? "/therapists" : "/pipeline");
    } else {
      const d = await res.json();
      setMsg({ text: d.error ?? "Error deleting", type: "error" });
      setDeleting(false);
    }
  }

  async function printAddressLabel() {
    if (!t) return;
    const lines = [
      t.name,
      t.companyName,
      t.address1,
      t.address2,
      t.address3,
      t.postcode,
      t.county,
    ].filter((l): l is string => !!l);

    // Try QZ Tray first (silent direct print), fall back to browser dialog
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const qz = (window as any).qz;
    if (qz) {
      try {
        // Set up certificate + signing so QZ Tray trusts this site
        qz.security.setCertificatePromise((_resolve: (v: string) => void, reject: (e: unknown) => void) => {
          fetch("/api/qz/sign", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ request: "" }),
          })
            .then(r => r.json())
            .then(d => _resolve(d.certificate))
            .catch(reject);
        });

        qz.security.setSignatureAlgorithm("SHA512");
        qz.security.setSignaturePromise((toSign: string) => {
          return (_resolve: (v: string) => void, reject: (e: unknown) => void) => {
            fetch("/api/qz/sign", {
              method: "POST",
              headers: { "Content-Type": "application/json" },
              body: JSON.stringify({ request: toSign }),
            })
              .then(r => r.json())
              .then(d => _resolve(d.signature))
              .catch(reject);
          };
        });

        await qz.websocket.connect();
        const printer = await qz.printers.find("Brother QL-800");
        const config = qz.configs.create(printer, {
          size: { width: 3.54, height: 1.14 }, // 90mm x 29mm in inches
          units: "in",
          orientation: "landscape",
        });
        // Print as HTML via QZ Tray
        const html = `<html><body style="margin:2mm 3mm;font-family:Arial,sans-serif;font-size:9pt;line-height:1.3">
          ${lines.map(l => `<p style="margin:0">${l}</p>`).join("")}
        </body></html>`;
        const printData = [{ type: "pixel", format: "html", flavor: "plain", data: html }];
        await qz.print(config, printData);
        await qz.websocket.disconnect();
        return;
      } catch (e) {
        console.warn("QZ Tray print failed, falling back to browser:", e);
      }
    }

    // Fallback: browser print dialog
    const win = window.open("", "_blank", "width=400,height=300");
    if (!win) return;
    win.document.write(`<!DOCTYPE html><html><head><title>Label</title>
<style>
  @page { size: 90mm 29mm landscape; margin: 0; }
  * { margin: 0; padding: 0; box-sizing: border-box; }
  html, body { width: 90mm; height: 29mm; overflow: hidden; background: white; display: inline-block; }
  body { padding: 2mm 3mm; font-family: Arial, Helvetica, sans-serif; font-size: 9pt; line-height: 1.35; color: #000; }
  p { margin: 0; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
</style></head><body>
${lines.map(l => `<p>${l}</p>`).join("")}
<script>setTimeout(function(){window.print();},150);<\/script>
</body></html>`);
    win.document.close();
  }


  function exportSkeddaCSV() {
    if (!t) return;
    const rows = [["Name","Email","Amount","Description"],[t.name,t.email,"20.00","Key deposit"]];
    const csv = rows.map(r => r.map(v => `"${v}"`).join(",")).join("\n");
    const blob = new Blob([csv], { type: "text/csv" });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url; a.download = `skedda-deposit-${t.name.replace(/\s+/g,"-").toLowerCase()}.csv`;
    a.click(); URL.revokeObjectURL(url);
  }

  if (!t) return <p className="text-muted-foreground text-sm">Loading…</p>;

  const complete = isOnboardingComplete(t);
  const activeBranches = selectedLocationIds
    .map(lid => locations.find(l => l.id === lid)?.name ?? "")
    .filter(Boolean);

  return (
    <div className="space-y-4 max-w-4xl">
      {/* Header */}
      <div className="flex items-start justify-between">
        <div>
          <button onClick={() => router.push(complete ? "/therapists" : "/pipeline")}
            className="text-sm text-muted-foreground hover:text-foreground transition-colors mb-1 block">
            ← {complete ? "Therapists" : "Pipeline"}
          </button>
          <h1 className="text-xl font-semibold text-foreground">
            {t.flag && <span className="mr-2">🚩</span>}{t.name}
            {t.companyName && <span className="text-muted-foreground font-normal ml-2 text-base">({t.companyName})</span>}
          </h1>
          <p className="text-sm text-muted-foreground mt-0.5">{t.email}</p>
          <p className="text-xs text-muted-foreground mt-0.5">
            Added {new Date(t.createdAt).toLocaleDateString("en-GB", { day: "numeric", month: "short", year: "numeric" })}
            {activeBranches.length > 0 && <span className="ml-2">· {activeBranches.map(abbrevBranch).join(", ")}</span>}
          </p>
        </div>
        <div className="flex gap-2 shrink-0 flex-wrap justify-end">
          {t.documentsUrl && (
            <a href={t.documentsUrl} target="_blank" rel="noopener noreferrer">
              <Button variant="secondary" size="sm">📁 Documents</Button>
            </a>
          )}
          <Button variant="secondary" size="sm" onClick={printAddressLabel}>🏷 Label</Button>
          {!t.bookingSystemInvitedAt && (
            <Button variant="secondary" size="sm" onClick={sendInvite} disabled={inviting}>
              {inviting ? "Sending…" : "Send invite"}
            </Button>
          )}
          {!complete && (
            <Button variant="secondary" size="sm" onClick={sendInductionPack} disabled={sendingInduction}>
              {sendingInduction ? "Sending…" : "📋 Induction pack"}
            </Button>
          )}
          <Button size="sm" onClick={save} disabled={saving}>{saving ? "Saving…" : "Save"}</Button>
          <Button size="sm" variant="danger" onClick={deleteTherapist} disabled={deleting}>{deleting ? "Deleting…" : "Delete"}</Button>
        </div>
      </div>

      {msg && <Alert variant={msg.type === "error" ? "danger" : "success"}>{msg.text}</Alert>}

      {/* Onboarding — collapsible */}
      <Card className="space-y-0 p-0 overflow-hidden">
        <button onClick={() => setOnboardingOpen(o => !o)}
          className="w-full flex items-center justify-between px-4 py-3 text-left hover:bg-surface-muted/50 transition-colors">
          <div className="flex items-center gap-3">
            <h2 className="text-xs font-semibold text-muted-foreground uppercase tracking-wider">Onboarding</h2>
            {complete && (
              <span className="inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-xs font-medium bg-success-bg text-primary">
                <svg className="w-3 h-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={3}><path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" /></svg>
                Complete
              </span>
            )}
          </div>
          <svg className={`w-4 h-4 text-muted-foreground transition-transform ${onboardingOpen ? "rotate-180" : ""}`} fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}><path strokeLinecap="round" strokeLinejoin="round" d="M19 9l-7 7-7-7" /></svg>
        </button>

        {onboardingOpen && (
          <div className="px-4 pb-4 space-y-3 border-t border-border pt-3">
            <DateStep label="Viewing date" value={t.viewingDate} onChange={v => update("viewingDate", v || null)}
              actionLabel="Today" onAction={() => update("viewingDate", today())} />
            <DateStep label="Document pack sent" value={t.documentPackDate} onChange={v => update("documentPackDate", v || null)}
              actionLabel="Today" onAction={() => update("documentPackDate", today())} />
            <div className="pl-8 ml-2.5 border-l-2 border-border space-y-2">
              <p className="text-xs font-medium text-muted-foreground">Document checks</p>
              <CheckStep label="ID checked" checked={t.idChecked} onChange={v => update("idChecked", v)} />
              <CheckStep label="Address checked" checked={t.addressChecked} onChange={v => update("addressChecked", v)} />
              <CheckStep label="Accreditation checked" checked={t.accreditationChecked} onChange={v => update("accreditationChecked", v)} />
              <CheckStep label="Insurance checked" checked={t.insuranceChecked} onChange={v => update("insuranceChecked", v)} />
              <div className="flex items-center gap-3 pt-1">
                <div className={`w-5 h-5 rounded-full border-2 flex items-center justify-center shrink-0 transition-colors ${
                  t.stlStatus === "STL held" || t.stlStatus === "Exempt" ? "bg-primary border-primary" : "border-border"
                }`}>
                  {(t.stlStatus === "STL held" || t.stlStatus === "Exempt") && (
                    <svg className="w-3 h-3 text-primary-foreground" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={3}><path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" /></svg>
                  )}
                </div>
                <div>
                  <p className="text-xs font-medium text-muted-foreground mb-1">Special treatment licence</p>
                  <select value={t.stlStatus ?? "Not required"} onChange={e => update("stlStatus", e.target.value)}
                    className="rounded-[var(--radius)] border border-border bg-surface px-2 py-1 text-sm text-foreground focus-visible:outline-2 focus-visible:outline-primary">
                    <option value="Not required">Not required</option>
                    <option value="STL held">STL held</option>
                    <option value="Exempt">Exempt</option>
                  </select>
                </div>
              </div>
            </div>
            <DateStep label="Documents reviewed" value={t.documentReviewDate} onChange={v => update("documentReviewDate", v || null)}
              actionLabel="Today" onAction={() => update("documentReviewDate", today())} />
            {/* Booking system invite */}
            <div className="flex items-center gap-3">
              <div className={`w-5 h-5 rounded-full border-2 flex items-center justify-center shrink-0 ${t.bookingSystemInvitedAt ? "bg-primary border-primary" : "border-border"}`}>
                {t.bookingSystemInvitedAt && <svg className="w-3 h-3 text-primary-foreground" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={3}><path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" /></svg>}
              </div>
              <div className="flex-1">
                <p className="text-xs font-medium text-muted-foreground mb-1">Booking system invited</p>
                <div className="flex items-center gap-2">
                  <span className="text-sm text-foreground">{t.bookingSystemInvitedAt ? new Date(t.bookingSystemInvitedAt).toLocaleDateString("en-GB") : "Not yet sent"}</span>
                  {!t.bookingSystemInvitedAt && (
                    <button onClick={sendInvite} disabled={inviting}
                      className="text-xs px-2 py-1 rounded-[var(--radius)] bg-primary text-primary-foreground hover:bg-primary-hover transition-colors disabled:opacity-50">
                      {inviting ? "Sending…" : "Send invite"}
                    </button>
                  )}
                </div>
              </div>
            </div>
            <DateStep label="Key sent" value={t.keySentDate ?? t.keyGivenDate}
              onChange={v => { update("keySentDate", v || null); update("keyGivenDate", v || null); }}
              actionLabel="Today" onAction={() => { update("keySentDate", today()); update("keyGivenDate", today()); }} />
            {/* Deposit invoiced */}
            <div className="flex items-center gap-3">
              <div className={`w-5 h-5 rounded-full border-2 flex items-center justify-center shrink-0 ${t.depositInvoicedDate ? "bg-primary border-primary" : "border-border"}`}>
                {t.depositInvoicedDate && <svg className="w-3 h-3 text-primary-foreground" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={3}><path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" /></svg>}
              </div>
              <div className="flex-1">
                <p className="text-xs font-medium text-muted-foreground mb-1">Deposit invoiced</p>
                <div className="flex items-center gap-2 flex-wrap">
                  <input type="date" value={t.depositInvoicedDate?.slice(0, 10) ?? ""}
                    onChange={e => update("depositInvoicedDate", e.target.value || null)}
                    className="rounded-[var(--radius)] border border-border bg-surface px-2 py-1 text-sm text-foreground focus-visible:outline-2 focus-visible:outline-primary" />
                  {!t.depositInvoicedDate && (
                    <button onClick={() => update("depositInvoicedDate", today())}
                      className="text-xs px-2 py-1 rounded-[var(--radius)] bg-primary text-primary-foreground hover:bg-primary-hover transition-colors">
                      Today
                    </button>
                  )}
                  <button onClick={exportSkeddaCSV}
                    className="text-xs px-2 py-1 rounded-[var(--radius)] bg-surface border border-border text-foreground hover:bg-surface-muted transition-colors">
                    ↓ £20 Skedda CSV
                  </button>
                </div>
              </div>
            </div>
          </div>
        )}
      </Card>

      {/* Contact */}
      <Section title="Contact">
        <div className="grid grid-cols-2 gap-4">
          <F label="Name"><Input value={t.name} onChange={e => update("name", e.target.value)} /></F>
          <F label="Email"><Input type="email" value={t.email} onChange={e => update("email", e.target.value)} /></F>
          <F label="Phone"><Input value={t.phone ?? ""} onChange={e => update("phone", e.target.value)} /></F>
          <F label="Company name"><Input value={t.companyName ?? ""} onChange={e => update("companyName", e.target.value)} /></F>
          <div>
            <Label>Skill / therapy type</Label>
            <div className="flex items-center gap-2">
              <Input value={t.skill ?? ""} onChange={e => {
                update("skill", e.target.value);
                // Auto-detect STL requirement from skill
                update("stlRequired", detectStlRequired(e.target.value));
              }} />
            </div>
            <div className="mt-1.5 flex items-center gap-2">
              <label className="flex items-center gap-1.5 cursor-pointer text-xs text-muted-foreground">
                <input type="checkbox" checked={t.stlRequired}
                  onChange={e => update("stlRequired", e.target.checked)}
                  className="h-3.5 w-3.5 rounded border-border text-primary" />
                STL required
              </label>
              {t.stlRequired && (
                <span className="text-xs text-amber-600 font-medium">⚠️ Special treatment licence needed</span>
              )}
            </div>
          </div>
          <F label="Website"><Input type="url" placeholder="https://…" value={t.website ?? ""} onChange={e => update("website", e.target.value)} /></F>
          <F label="Clinic telephone"><Input value={t.clinicTelephone ?? ""} onChange={e => update("clinicTelephone", e.target.value)} /></F>
          <F label="Clinic email"><Input type="email" value={t.clinicEmail ?? ""} onChange={e => update("clinicEmail", e.target.value)} /></F>
        </div>
        <div className="grid grid-cols-2 gap-4">
          <F label="Address line 1"><Input value={t.address1 ?? ""} onChange={e => update("address1", e.target.value)} /></F>
          <F label="Address line 2"><Input value={t.address2 ?? ""} onChange={e => update("address2", e.target.value)} /></F>
          <F label="Town/City"><Input value={t.address3 ?? ""} onChange={e => update("address3", e.target.value)} /></F>
          <F label="County"><Input value={t.county ?? ""} onChange={e => update("county", e.target.value)} /></F>
          <F label="Postcode"><Input value={t.postcode ?? ""} onChange={e => update("postcode", e.target.value)} /></F>
          <F label="Country"><Input value={t.country ?? ""} onChange={e => update("country", e.target.value)} /></F>
        </div>
        <F label="Notes">
          <textarea value={t.notes ?? ""} onChange={e => update("notes", e.target.value)} rows={4}
            className="w-full rounded-[var(--radius)] border border-border bg-surface px-3 py-2 text-sm text-foreground focus-visible:outline-2 focus-visible:outline-primary" />
        </F>
      </Section>

      {/* Organisation & Billing */}
      <Section title="Organisation & Billing">
        {/* Branch selector */}
        <div>
          <Label>Authorised branches</Label>
          <div className="flex gap-3 mt-1">
            {locations.map(loc => (
              <label key={loc.id} className="flex items-center gap-2 cursor-pointer text-sm text-foreground">
                <input type="checkbox"
                  checked={selectedLocationIds.includes(loc.id)}
                  onChange={() => toggleLocation(loc.id)}
                  className="h-4 w-4 rounded border-border text-primary" />
                {abbrevBranch(loc.name)}
              </label>
            ))}
          </div>
        </div>
        <div className="grid grid-cols-2 gap-4">
          <F label="Organisation">
            <Select value={t.organisationId ?? ""} onChange={e => update("organisationId", e.target.value || null)}>
              <option value="">— None (individual) —</option>
              {orgs.map(o => <option key={o.id} value={o.id}>{o.name}</option>)}
            </Select>
          </F>
          <F label="Key card / fob number"><Input value={t.keyCard ?? ""} onChange={e => update("keyCard", e.target.value)} /></F>
          <F label="Fanvil card ID"><Input value={t.fanvilCardId ?? ""} onChange={e => update("fanvilCardId", e.target.value)} /></F>
          <F label="Referred by">
            <Select value={t.referredBy ?? ""} onChange={e => update("referredBy", e.target.value || null)}>
              <option value="">— Not set —</option>
              {REFERRAL_OPTIONS.map(o => <option key={o} value={o}>{o}</option>)}
            </Select>
          </F>
        </div>
        {t.organisationId && (
          <p className="text-sm text-muted-foreground bg-surface-muted rounded-[var(--radius)] px-3 py-2">
            ℹ️ This therapist&apos;s bookings will be billed to the organisation&apos;s account.
          </p>
        )}
        <div className="flex gap-6">
          <label className="flex items-center gap-2 cursor-pointer text-sm text-foreground">
            <input type="checkbox" checked={t.includeInBilling} onChange={e => update("includeInBilling", e.target.checked)} className="h-4 w-4 rounded border-border text-primary" />
            Include in billing
          </label>
          <label className="flex items-center gap-2 cursor-pointer text-sm text-foreground">
            <input type="checkbox" checked={t.isActive} onChange={e => update("isActive", e.target.checked)} className="h-4 w-4 rounded border-border text-primary" />
            Active
          </label>
          <label className="flex items-center gap-2 cursor-pointer text-sm text-foreground">
            <input type="checkbox" checked={t.flag} onChange={e => update("flag", e.target.checked)} className="h-4 w-4 rounded border-border text-primary" />
            Flagged 🚩
          </label>
        </div>
      </Section>

      {/* Invoice Address */}
      <Section title="Invoice Address">
        <label className="flex items-center gap-2 cursor-pointer text-sm text-foreground">
          <input type="checkbox" checked={t.sameInvoiceAddress} onChange={e => update("sameInvoiceAddress", e.target.checked)} className="h-4 w-4 rounded border-border" />
          Same as contact address
        </label>
        {!t.sameInvoiceAddress && (
          <div className="grid grid-cols-2 gap-4 mt-3">
            <F label="Company"><Input value={t.invoiceCompanyName ?? ""} onChange={e => update("invoiceCompanyName", e.target.value)} /></F>
            <F label="First name"><Input value={t.invoiceFirstName ?? ""} onChange={e => update("invoiceFirstName", e.target.value)} /></F>
            <F label="Surname"><Input value={t.invoiceSurName ?? ""} onChange={e => update("invoiceSurName", e.target.value)} /></F>
            <F label="Email"><Input type="email" value={t.invoiceEmailAddress ?? ""} onChange={e => update("invoiceEmailAddress", e.target.value)} /></F>
            <F label="Address 1"><Input value={t.invoiceAddress1 ?? ""} onChange={e => update("invoiceAddress1", e.target.value)} /></F>
            <F label="Address 2"><Input value={t.invoiceAddress2 ?? ""} onChange={e => update("invoiceAddress2", e.target.value)} /></F>
            <F label="Town"><Input value={t.invoiceAddress3 ?? ""} onChange={e => update("invoiceAddress3", e.target.value)} /></F>
            <F label="Postcode"><Input value={t.invoicePostcode ?? ""} onChange={e => update("invoicePostcode", e.target.value)} /></F>
            <F label="Country"><Input value={t.invoiceCountry ?? ""} onChange={e => update("invoiceCountry", e.target.value)} /></F>
          </div>
        )}
      </Section>

      {/* Accreditation */}
      <Section title="Accreditation (Reference Only)">
        <div className="grid grid-cols-2 gap-4">
          <F label="Accreditation body"><Input value={t.accreditationBody ?? ""} onChange={e => update("accreditationBody", e.target.value)} /></F>
          <F label="Accreditation number"><Input value={t.accreditationNumber ?? ""} onChange={e => update("accreditationNumber", e.target.value)} /></F>
        </div>
      </Section>

      {/* Admin */}
      <Section title="Admin">
        <F label="OneDrive documents URL">
          <Input type="url" placeholder="https://onedrive.live.com/…" value={t.documentsUrl ?? ""} onChange={e => update("documentsUrl", e.target.value)} />
        </F>
      </Section>
    </div>
  );
}
