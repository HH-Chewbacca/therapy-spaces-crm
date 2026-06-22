"use client";
import { useState, useEffect, useCallback } from "react";
import Link from "next/link";


interface Therapist {
  id: string; name: string; email: string; phone: string | null; flag: boolean; isActive: boolean;
  viewingDate: string | null; documentPackDate: string | null;
  documentReviewDate: string | null; bookingSystemInvitedAt: string | null;
  keyGiven: boolean; keySent: boolean; depositInvoiced: boolean;
}

type Stage = "Enquiry" | "Viewed" | "Pack sent" | "Docs reviewed" | "Invited" | "Key issued";

function getStage(t: Therapist): Stage {
  if (t.depositInvoiced) return "Key issued";
  if (t.keySent || t.keyGiven) return "Key issued";
  if (t.bookingSystemInvitedAt) return "Invited";
  if (t.documentReviewDate) return "Docs reviewed";
  if (t.documentPackDate) return "Pack sent";
  if (t.viewingDate) return "Viewed";
  return "Enquiry";
}

function daysSince(d: string | null): number | null {
  if (!d) return null;
  return Math.floor((Date.now() - new Date(d).getTime()) / 86400000);
}

function lastAction(t: Therapist): string {
  const d = t.bookingSystemInvitedAt ?? t.documentReviewDate ?? t.documentPackDate ?? t.viewingDate;
  const n = daysSince(d);
  if (n === null) return "—";
  if (n === 0) return "Today";
  if (n === 1) return "Yesterday";
  return `${n} days ago`;
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
  const [therapists, setTherapists] = useState<Therapist[]>([]);
  const [loading, setLoading] = useState(true);

  const load = useCallback(async () => {
    const r = await fetch("/api/therapists");
    const d = await r.json();
    setTherapists((d.therapists ?? []).filter((t: Therapist) => t.isActive && !t.depositInvoiced));
    setLoading(false);
  }, []);

  // eslint-disable-next-line react-hooks/set-state-in-effect
  useEffect(() => { load(); }, [load]);

  const byStage = STAGE_ORDER.reduce<Record<Stage, Therapist[]>>((acc, s) => {
    acc[s] = therapists.filter(t => getStage(t) === s);
    return acc;
  }, {} as Record<Stage, Therapist[]>);

  if (loading) return <p className="text-muted-foreground text-sm">Loading…</p>;

  return (
    <div className="space-y-4">
      <div className="flex items-center justify-between">
        <h1 className="text-xl font-semibold text-foreground">Pipeline</h1>
        <p className="text-sm text-muted-foreground">{therapists.length} therapists in progress</p>
      </div>

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
                          </Link>
                        </td>
                        <td className="px-4 py-2 text-muted-foreground">{t.email}</td>
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
