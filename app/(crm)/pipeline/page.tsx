"use client";
import { useState, useEffect, useCallback } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";
import { Button } from "@/components/ui/Button";
import { Card, Alert } from "@/components/ui/Card";
import { DialButton } from "@/components/ui/DialButton";
import { formatPhone } from "@/lib/phone";

interface Therapist {
  id: string; name: string; email: string; phone: string | null; flag: boolean;
  skill: string | null; companyName: string | null; isActive: boolean;
  viewingDate: string | null; documentPackDate: string | null;
  documentReviewDate: string | null; bookingSystemInvitedAt: string | null;
  keyGivenDate: string | null; keySentDate: string | null; depositInvoicedDate: string | null;
  createdAt: string;
}

type Stage = "Enquiry" | "Viewed" | "Pack sent" | "Docs reviewed" | "Invited" | "Key sent";

const STAGE_ORDER: Stage[] = ["Enquiry", "Viewed", "Pack sent", "Docs reviewed", "Invited", "Key sent"];

const STAGE_CONFIG: Record<Stage, { label: string; desc: string; row: string; badge: string; dot: string }> = {
  "Enquiry":       { label: "Enquiry",       desc: "No viewing date set",           row: "bg-red-50 border-red-200",       badge: "bg-red-100 text-red-700",       dot: "bg-red-500" },
  "Viewed":        { label: "Viewed",         desc: "Viewing date recorded",         row: "bg-orange-50 border-orange-200", badge: "bg-orange-100 text-orange-700", dot: "bg-orange-500" },
  "Pack sent":     { label: "Pack sent",      desc: "Document pack sent",            row: "bg-amber-50 border-amber-200",   badge: "bg-amber-100 text-amber-700",   dot: "bg-amber-500" },
  "Docs reviewed": { label: "Docs reviewed",  desc: "Documents checked & reviewed",  row: "bg-yellow-50 border-yellow-200", badge: "bg-yellow-100 text-yellow-700", dot: "bg-yellow-500" },
  "Invited":       { label: "Invited",        desc: "Booking system invite sent",    row: "bg-lime-50 border-lime-200",     badge: "bg-lime-100 text-lime-700",     dot: "bg-lime-500" },
  "Key sent":      { label: "Key sent",       desc: "Key issued — awaiting deposit", row: "bg-green-50 border-green-200",   badge: "bg-green-100 text-green-700",   dot: "bg-green-500" },
};

function getStage(t: Therapist): Stage {
  if (t.keySentDate || t.keyGivenDate) return "Key sent";
  if (t.bookingSystemInvitedAt) return "Invited";
  if (t.documentReviewDate) return "Docs reviewed";
  if (t.documentPackDate) return "Pack sent";
  if (t.viewingDate) return "Viewed";
  return "Enquiry";
}

function graduated(t: Therapist): boolean {
  return !!(t.keySentDate || t.keyGivenDate || t.depositInvoicedDate);
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

export default function PipelinePage() {
  const router = useRouter();
  const [therapists, setTherapists] = useState<Therapist[]>([]);
  const [search, setSearch] = useState("");
  const [loading, setLoading] = useState(true);
  const [dragging, setDragging] = useState(false);
  const [parsing, setParsing] = useState(false);
  const [parsed, setParsed] = useState<Record<string, string> | null>(null);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const load = useCallback(async () => {
    const r = await fetch("/api/therapists");
    const d = await r.json();
    const list = (d.therapists ?? []).filter((t: Therapist) => t.isActive && !graduated(t));
    list.sort((a: Therapist, b: Therapist) => new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime());
    setTherapists(list);
    setLoading(false);
  }, []);

  // eslint-disable-next-line react-hooks/set-state-in-effect
  useEffect(() => { load(); }, [load]);

  const filtered = search.trim()
    ? therapists.filter(t => {
        const q = search.toLowerCase();
        return t.name.toLowerCase().includes(q)
          || t.email.toLowerCase().includes(q)
          || (t.skill ?? "").toLowerCase().includes(q)
          || (t.phone ?? "").includes(q);
      })
    : therapists;

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

  if (loading) return <p className="text-muted-foreground text-sm">Loading…</p>;

  return (
    <div className="space-y-4">
      <div className="flex items-center justify-between">
        <h1 className="text-xl font-semibold text-foreground">Pipeline</h1>
        <div className="flex items-center gap-2">
          <p className="text-sm text-muted-foreground">
            {filtered.length}{search ? ` of ${therapists.length}` : ""} in progress
          </p>
          <Link href="/therapists/new"><Button>+ New therapist</Button></Link>
        </div>
      </div>

      {/* Colour key */}
      <div className="flex flex-wrap gap-3 p-3 bg-surface border border-border rounded-[var(--radius)]">
        {STAGE_ORDER.map(stage => {
          const cfg = STAGE_CONFIG[stage];
          const count = therapists.filter(t => getStage(t) === stage).length;
          return (
            <div key={stage} className="flex items-center gap-1.5">
              <span className={`w-3 h-3 rounded-full shrink-0 ${cfg.dot}`} />
              <span className="text-xs text-foreground font-medium">{cfg.label}</span>
              <span className="text-xs text-muted-foreground hidden sm:inline">— {cfg.desc}</span>
              {count > 0 && <span className={`text-xs px-1.5 py-0.5 rounded-full font-medium ${cfg.badge}`}>{count}</span>}
            </div>
          );
        })}
      </div>

      {/* Search */}
      <input type="search" placeholder="Search by name, email, skill or phone…"
        value={search} onChange={e => setSearch(e.target.value)}
        className="w-full max-w-md rounded-[var(--radius)] border border-border bg-surface px-3 py-2 text-sm text-foreground placeholder:text-muted-foreground focus-visible:outline-2 focus-visible:outline-primary" />

      {/* Email drop zone */}
      <div onDragOver={e => { e.preventDefault(); setDragging(true); }}
        onDragLeave={() => setDragging(false)} onDrop={handleDrop}
        className={`border-2 border-dashed rounded-[var(--radius)] p-5 text-center transition-colors ${dragging ? "border-primary bg-green-50" : "border-border bg-surface"}`}>
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

      {/* Flat table sorted by createdAt desc */}
      <Card className="p-0 overflow-hidden">
        <table className="w-full text-sm">
          <thead className="bg-surface-muted text-left text-xs font-medium text-muted-foreground uppercase tracking-wider">
            <tr>
              <th className="px-4 py-3">Name</th>
              <th className="px-4 py-3">Skill</th>
              <th className="px-4 py-3">Stage</th>
              <th className="px-4 py-3">Phone</th>
              <th className="px-4 py-3">Last action</th>
              <th className="px-4 py-3">Added</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-border">
            {filtered.map(t => {
              const stage = getStage(t);
              const cfg = STAGE_CONFIG[stage];
              return (
                <tr key={t.id} className={`${cfg.row} transition-colors`}>
                  <td className="px-4 py-2.5 font-medium text-foreground">
                    <Link href={`/therapists/${t.id}`} className="hover:underline">
                      {t.flag && "🚩 "}{t.name}
                      {t.companyName && <span className="text-muted-foreground font-normal ml-1">({t.companyName})</span>}
                    </Link>
                  </td>
                  <td className="px-4 py-2.5 text-muted-foreground">{t.skill ?? "—"}</td>
                  <td className="px-4 py-2.5">
                    <span className={`inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-xs font-medium ${cfg.badge}`}>
                      <span className={`w-1.5 h-1.5 rounded-full ${cfg.dot}`} />
                      {cfg.label}
                    </span>
                  </td>
                  <td className="px-4 py-2.5 text-muted-foreground whitespace-nowrap">
                    {t.phone ? (
                      <span className="inline-flex items-center gap-2">
                        {formatPhone(t.phone)}
                        <DialButton phone={t.phone} />
                      </span>
                    ) : "—"}
                  </td>
                  <td className="px-4 py-2.5 text-muted-foreground">{lastAction(t)}</td>
                  <td className="px-4 py-2.5 text-muted-foreground text-xs">
                    {new Date(t.createdAt).toLocaleDateString("en-GB", { day: "numeric", month: "short", year: "2-digit" })}
                  </td>
                </tr>
              );
            })}
            {filtered.length === 0 && (
              <tr><td colSpan={6} className="px-4 py-8 text-center text-muted-foreground">
                {search ? "No results found" : "No therapists in the pipeline"}
              </td></tr>
            )}
          </tbody>
        </table>
      </Card>
    </div>
  );
}
