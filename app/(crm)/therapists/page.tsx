"use client";
import { useState, useEffect, useCallback } from "react";
import Link from "next/link";
import { Button } from "@/components/ui/Button";
import { Card } from "@/components/ui/Card";

interface Therapist {
  id: string; name: string; email: string; phone: string | null;
  companyName: string | null; skill: string | null; isActive: boolean;
  flag: boolean; includeInBilling: boolean;
  viewingDate: string | null; documentPackDate: string | null;
  documentReviewDate: string | null; bookingSystemInvitedAt: string | null;
  keyGiven: boolean; keySent: boolean; depositInvoiced: boolean;
  idChecked: boolean; addressChecked: boolean;
  accreditationChecked: boolean; insuranceChecked: boolean;
  organisation: { id: string; name: string } | null;
  primaryBranch: { id: string; name: string } | null;
  authorisedLocations: { location: { id: string; name: string } }[];
}

function stage(t: Therapist): string {
  if (t.depositInvoiced) return "Active";
  if (t.keySent || t.keyGiven) return "Key issued";
  if (t.bookingSystemInvitedAt) return "Invited";
  if (t.documentReviewDate) return "Docs reviewed";
  if (t.documentPackDate) return "Pack sent";
  if (t.viewingDate) return "Viewed";
  return "Enquiry";
}

const STAGE_COLOURS: Record<string, string> = {
  "Active":         "bg-success-bg text-primary",
  "Key issued":     "bg-primary/10 text-primary",
  "Invited":        "bg-accent/10 text-accent",
  "Docs reviewed":  "bg-warning-bg text-foreground",
  "Pack sent":      "bg-warning-bg text-foreground",
  "Viewed":         "bg-surface-muted text-muted-foreground",
  "Enquiry":        "bg-danger-bg text-danger",
};

export default function TherapistsPage() {
  const [therapists, setTherapists] = useState<Therapist[]>([]);
  const [search, setSearch] = useState("");
  const [loading, setLoading] = useState(true);

  const load = useCallback(async () => {
    setLoading(true);
    const q = search ? `?search=${encodeURIComponent(search)}` : "";
    const r = await fetch(`/api/therapists${q}`);
    const d = await r.json();
    setTherapists(d.therapists ?? []);
    setLoading(false);
  }, [search]);

  // eslint-disable-next-line react-hooks/set-state-in-effect
  useEffect(() => { load(); }, [load]);

  return (
    <div className="space-y-4">
      <div className="flex items-center justify-between">
        <h1 className="text-xl font-semibold text-foreground">Therapists</h1>
        <Link href="/therapists/new">
          <Button>+ New therapist</Button>
        </Link>
      </div>

      <input type="search" placeholder="Search by name, email or company…"
        value={search} onChange={e => setSearch(e.target.value)}
        className="w-full max-w-md rounded-[var(--radius)] border border-border bg-surface px-3 py-2 text-sm text-foreground placeholder:text-muted-foreground focus-visible:outline-2 focus-visible:outline-primary" />

      {loading ? (
        <p className="text-muted-foreground text-sm">Loading…</p>
      ) : (
        <Card className="p-0 overflow-hidden">
          <table className="w-full text-sm">
            <thead className="bg-surface-muted text-left text-xs font-medium text-muted-foreground uppercase tracking-wider">
              <tr>
                <th className="px-4 py-3">Name</th>
                <th className="px-4 py-3">Email</th>
                <th className="px-4 py-3">Skill</th>
                <th className="px-4 py-3">Branch</th>
                <th className="px-4 py-3">Stage</th>
                <th className="px-4 py-3">Organisation</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-border">
              {therapists.map(t => (
                <tr key={t.id} className="hover:bg-surface-muted/50 transition-colors">
                  <td className="px-4 py-2.5 font-medium text-foreground">
                    <Link href={`/therapists/${t.id}`} className="hover:text-primary transition-colors">
                      {t.flag && <span className="mr-1">🚩</span>}
                      {t.name}
                      {t.companyName && <span className="text-muted-foreground font-normal ml-1">({t.companyName})</span>}
                      {!t.isActive && <span className="ml-2 text-xs text-danger">(inactive)</span>}
                    </Link>
                  </td>
                  <td className="px-4 py-2.5 text-muted-foreground">{t.email}</td>
                  <td className="px-4 py-2.5 text-muted-foreground">{t.skill ?? "—"}</td>
                  <td className="px-4 py-2.5 text-muted-foreground">
                    {(t.primaryBranch?.name ?? t.authorisedLocations.map(l => l.location.name).join(", ")) || "—"}
                  </td>
                  <td className="px-4 py-2.5">
                    <span className={`inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium ${STAGE_COLOURS[stage(t)] ?? ""}`}>
                      {stage(t)}
                    </span>
                  </td>
                  <td className="px-4 py-2.5 text-muted-foreground">{t.organisation?.name ?? "—"}</td>
                </tr>
              ))}
              {therapists.length === 0 && (
                <tr><td colSpan={6} className="px-4 py-8 text-center text-muted-foreground">No therapists found</td></tr>
              )}
            </tbody>
          </table>
        </Card>
      )}
    </div>
  );
}
