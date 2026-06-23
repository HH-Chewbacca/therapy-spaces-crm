"use client";
import { useState, useEffect, useCallback } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";
import { Button } from "@/components/ui/Button";
import { Card, Alert } from "@/components/ui/Card";

interface Therapist {
  id: string; name: string; email: string; phone: string | null; flag: boolean;
  skill: string | null; companyName: string | null; isActive: boolean;
  viewingDate: string | null; documentPackDate: string | null;
  documentReviewDate: string | null; bookingSystemInvitedAt: string | null;
  keyGivenDate: string | null; keySentDate: string | null; depositInvoicedDate: string | null;
  createdAt: string;
}

type Stage = "Enquiry" | "Viewed" | "Pack sent" | "Docs reviewed" | "Invited" | "Key issued";

function getStage(t: Therapist): Stage {
  if (t.keySentDate || t.keyGivenDate) return "Key issued";
  if (t.bookingSystemInvitedAt) return "Invited";
  if (t.documentReviewDate) return "Docs reviewed";
  if (t.documentPackDate) return "Pack sent";
  if (t.viewingDate) return "Viewed";
  return "Enquiry";
}

function latestDate(t: Therapist): number {
  const dates = [
    t.keySentDate, t.keyGivenDate, t.bookingSystemInvitedAt,
    t.documentReviewDate, t.documentPackDate, t.viewingDate, t.createdAt,
  ];
  const times = dates.map(d => d ? new Date(d).getTime() : 0);
  return Math.max(...times);
}

function daysSince(d: string | null): number | null {
  if (!d) return null;
  return Math.floor((Date.now() - new Date(d).getTime()) / 86400000);
}

function lastAction(t: Therapist): string {
  const d = t.keySentDate ?? t.keyGivenDate ?? t.bookingSystemInvitedAt ?? t.documentReviewDate ?? t.documentPackDate ?? t.viewingDate;
  const n = daysSince(d);
  if (n === null) return "—";
  if (n === 0) return "Today";
  if (n === 1) return "Yesterday";
  return `${n}d ago`;
}

const STAGE_ORDER: Stage[] = ["Enquiry", "Viewed", "Pack sent", "Docs reviewed", "Invited", "Key issued"];
const STAGE_COLOURS: Record<Stage, string> = {
  "Enquiry":       "bg-danger-bg border-danger/20",
  "Viewed":        "bg-surface-muted border-border",
  "Pack sent":     "bg-warning-bg border-warning-border",
  "Docs reviewed": "bg-warning-bg border-warning-border",
  "Invited":       "bg-success-bg border-primary/20",
  "Key issued":    "bg-primary/5 border-primary/20",
};
const STAGE_BADGE: Record<Stage, string> = {
  "Enquiry":       "bg-danger-bg text-danger",
  "Viewed":        "bg-surface-muted text-muted-foreground",
  "Pack sent":     "bg-warning-bg text-foreground",
  "Docs reviewed": "bg-warning-bg text-foreground",
  "Invited":       "bg-success-bg text-primary",
  "Key issued":    "bg-primary/10 text-primary",
};

export default function PipelinePage() {
  const router = useRouter();
  const [therapists, setTherapists] = useState<Therapist[]>([]);
  const [loading, setLoading] = useState(true);
  const [dragging, setDragging] = useState(false);
  const [parsing, setParsing] = useState(false);
  const [parsed, setParsed] = useState<Record<string, string> | null>(null);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const load = useCallback(async () => {
    const r = await fetch("/api/therapists");
    const d = await r.json();
    const list = (d.therapists ?? []).filter((t: Therapist) => t.isActive && !t.depositInvoicedDate);
    // Sort by most recent action descending
    list.sort((a: Therapist, b: Therapist) => latestDate(b) - latestDate(a));
    setTherapists(list);
    setLoading(false);
  }, []);

  // eslint-disable-next-line react-hooks/set-state-in-effect
  useEffect(() => { load(); }, [load]);

  async function handleDrop(e: React.DragEvent) {
    e.preventDefault(); setDragging(false); setError(null);
    const file = e.dataTransfer.files[0];
    if (!file) return;
    if (!file.name.toLowerCase().endsWith(".msg") && !file.name.toLowerCase().endsWith(".eml")) {
      setError("Please drop a .msg or .eml email file"); return;
    }
    setParsing(true);
    const formData = new FormData();
    formData.append("file", file);
    const res = await fetch("/api/enquiries/parse-email", { method: "POST", body: formData });
    const data = await res.json();
    if (!res.ok) { setError(data.error ?? "Failed to parse email"); setParsing(false); return; }
    setParsed(data); setParsing(false);
  }

  async function createFromParsed() {
    if (!parsed) return;
    setSaving(true); setError(null);
    const name = [parsed.firstName, parsed.lastName].filter(Boolean).join(" ") || "Unknown";
    const res = await fetch("/api/therapists", {
      method: "POST", headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ name, email: parsed.email ?? "", phone: parsed.phone || undefined, skill: parsed.therapyType || undefined }),
    });
    const data = await res.json();
    if (!res.ok) { setError(data.error ?? "Failed to create therapist"); setSaving(false); return; }
    router.push(`/therapists/${data.therapist.id}`);
  }

  const byStage = STAGE_ORDER.reduce<Record<Stage, Therapist[]>>((acc, s) => {
    acc[s] = therapists.filter(t => getStage(t) === s);
    return acc;
  }, {} as Record<Stage, Therapist[]>);

  if (loading) return <p className="text-muted-foreground text-sm">Loading…</p>;

  return (
    <div className="space-y-4">
      <div className="flex items-center justify-between">
        <h1 className="text-xl font-semibold text-foreground">Pipeline</h1>
        <div className="flex items-center gap-2">
          <p className="text-sm text-muted-foreground">{therapists.length} in progress</p>
          <Link href="/therapists/new"><Button>+ New therapist</Button></Link>
        </div>
      </div>
      <div onDragOver={e => { e.preventDefault(); setDragging(true); }}
        onDragLeave={() => setDragging(false)} onDrop={handleDrop}
        className={`border-2 border-dashed rounded-[var(--radius)] p-6 text-center transition-colors ${dragging ? "border-primary bg-success-bg" : "border-border bg-surface"}`}>
        {parsing ? <p className="text-muted-foreground text-sm">Parsing email…</p> : (
          <>
            <p className="text-sm text-foreground font-medium">Drop a <code className="bg-surface-muted px-1 rounded text-xs">.msg</code> viewing-request to import an enquiry</p>
            <p className="text-xs text-muted-foreground mt-1">Web3Forms format — fields parsed automatically</p>
          </>
        )}
      </div>
      {parsed && (
        <Card>
          <h2 className="text-sm font-semibold text-foreground mb-3">Review imported enquiry</h2>
          <div className="grid grid-cols-2 gap-3">
            {Object.entries(parsed).filter(([k]) => k !== "rawEmail").map(([k, v]) => (
              <div key={k}>
                <label className="mb-1 block text-xs font-medium text-muted-foreground capitalize">{k.replace(/([A-Z])/g, " $1").trim()}</label>
                <input className="w-full rounded-[var(--radius)] border border-border bg-surface px-3 py-1.5 text-sm text-foreground focus-visible:outline-2 focus-visible:outline-primary"
                  value={v as string} onChange={e => setParsed(p => ({ ...p!, [k]: e.target.value }))} />
              </div>
            ))}
          </div>
          <div className="flex gap-2 mt-4">
            <Button onClick={createFromParsed} disabled={saving}>{saving ? "Creating…" : "Add to pipeline →"}</Button>
            <Button variant="secondary" onClick={() => { setParsed(null); setError(null); }}>Discard</Button>
          </div>
        </Card>
      )}
      {error && <Alert variant="danger">{error}</Alert>}
      <div className="space-y-5">
        {STAGE_ORDER.map(stage => {
          const list = byStage[stage];
          if (list.length === 0) return null;
          return (
            <div key={stage}>
              <div className="flex items-center gap-2 mb-2">
                <span className={`px-2.5 py-0.5 rounded-full text-xs font-medium ${STAGE_BADGE[stage]}`}>{stage}</span>
                <span className="text-sm text-muted-foreground">{list.length}</span>
              </div>
              <div className={`border rounded-[var(--radius)] overflow-hidden ${STAGE_COLOURS[stage]}`}>
                <table className="w-full text-sm">
                  <thead className="bg-white/40 text-left text-xs font-medium text-muted-foreground">
                    <tr>
                      <th className="px-4 py-2">Name</th>
                      <th className="px-4 py-2">Email</th>
                      <th className="px-4 py-2">Skill</th>
                      <th className="px-4 py-2">Phone</th>
                      <th className="px-4 py-2">Last action</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-white/40">
                    {list.map(t => (
                      <tr key={t.id} className="hover:bg-white/30 transition-colors">
                        <td className="px-4 py-2 font-medium text-foreground">
                          <Link href={`/therapists/${t.id}`} className="hover:text-primary transition-colors">
                            {t.flag && "🚩 "}{t.name}
                            {t.companyName && <span className="text-muted-foreground font-normal ml-1">({t.companyName})</span>}
                          </Link>
                        </td>
                        <td className="px-4 py-2 text-muted-foreground">{t.email}</td>
                        <td className="px-4 py-2 text-muted-foreground">{t.skill ?? "—"}</td>
                        <td className="px-4 py-2 text-muted-foreground">{t.phone ?? "—"}</td>
                        <td className="px-4 py-2 text-muted-foreground">{lastAction(t)}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </div>
          );
        })}
        {therapists.length === 0 && <p className="text-muted-foreground text-sm">No therapists currently in the pipeline.</p>}
      </div>
    </div>
  );
}
