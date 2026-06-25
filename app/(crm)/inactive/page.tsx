"use client";
import { useState, useEffect, useCallback } from "react";
import Link from "next/link";
import { Card } from "@/components/ui/Card";
import { MailButton } from "@/components/ui/MailButton";

interface Therapist {
  id: string; name: string; email: string; phone: string | null;
  companyName: string | null; skill: string | null; flag: boolean;
  isActive: boolean; depositInvoicedDate: string | null; createdAt: string;
  organisation: { id: string; name: string } | null;
  primaryBranch: { id: string; name: string } | null;
  authorisedLocations: { location: { id: string; name: string } }[];
}

function abbrevBranch(name: string): string {
  const n = name.toLowerCase();
  if (n.includes("wimbledon")) return "SWIM";
  if (n.includes("surbiton"))  return "SURB";
  return name;
}

function branches(t: Therapist): string {
  const names = t.primaryBranch
    ? [t.primaryBranch.name]
    : t.authorisedLocations.map(l => l.location.name);
  return names.map(abbrevBranch).join(", ") || "—";
}

export default function InactivePage() {
  const [therapists, setTherapists] = useState<Therapist[]>([]);
  const [search, setSearch] = useState("");
  const [loading, setLoading] = useState(true);

  const load = useCallback(async () => {
    setLoading(true);
    const q = search ? `?search=${encodeURIComponent(search)}` : "";
    const r = await fetch(`/api/therapists${q}`);
    const d = await r.json();
    const list = (d.therapists ?? []).filter((t: Therapist) => !t.isActive);
    // Sort by most recently active: depositInvoicedDate desc, then createdAt desc
    list.sort((a: Therapist, b: Therapist) => {
      const aDate = a.depositInvoicedDate ?? a.createdAt;
      const bDate = b.depositInvoicedDate ?? b.createdAt;
      return new Date(bDate).getTime() - new Date(aDate).getTime();
    });
    setTherapists(list);
    setLoading(false);
  }, [search]);

  // eslint-disable-next-line react-hooks/set-state-in-effect
  useEffect(() => { load(); }, [load]);

  return (
    <div className="space-y-4">
      <div className="flex items-center justify-between">
        <h1 className="text-xl font-semibold text-foreground">Inactive</h1>
        <p className="text-sm text-muted-foreground">{therapists.length} inactive</p>
      </div>
      <input type="search" placeholder="Search by name, email or company…"
        value={search} onChange={e => setSearch(e.target.value)}
        className="w-full max-w-md rounded-[var(--radius)] border border-border bg-surface px-3 py-2 text-sm text-foreground placeholder:text-muted-foreground focus-visible:outline-2 focus-visible:outline-primary" />
      {loading ? <p className="text-muted-foreground text-sm">Loading…</p> : (
        <Card className="p-0 overflow-hidden">
          <table className="w-full text-sm">
            <thead className="bg-surface-muted text-left text-xs font-medium text-muted-foreground uppercase tracking-wider">
              <tr>
                <th className="px-4 py-3">Name</th>
                <th className="px-4 py-3">Email</th>
                <th className="px-4 py-3">Skill</th>
                <th className="px-4 py-3">Branch</th>
                <th className="px-4 py-3">Organisation</th>
                <th className="px-4 py-3">Status</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-border">
              {therapists.map(t => (
                <tr key={t.id} className="hover:bg-surface-muted/50 transition-colors">
                  <td className="px-4 py-2.5 font-medium text-foreground">
                    <Link href={`/therapists/${t.id}`} className="hover:text-primary transition-colors">
                      {t.flag && <span className="mr-1">🚩</span>}{t.name}
                      {t.companyName && <span className="text-muted-foreground font-normal ml-1">({t.companyName})</span>}
                    </Link>
                  </td>
                  <td className="px-4 py-2.5 text-muted-foreground"><span className="inline-flex items-center gap-2">{t.email}<MailButton email={t.email} className="h-7 w-7" /></span></td>
                  <td className="px-4 py-2.5 text-muted-foreground">{t.skill ?? "—"}</td>
                  <td className="px-4 py-2.5 text-muted-foreground">{branches(t)}</td>
                  <td className="px-4 py-2.5 text-muted-foreground">{t.organisation?.name ?? "—"}</td>
                  <td className="px-4 py-2.5">
                    <span className="inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium bg-surface-muted text-muted-foreground">
                      {t.depositInvoicedDate ? "Was active" : "Never activated"}
                    </span>
                  </td>
                </tr>
              ))}
              {therapists.length === 0 && (
                <tr><td colSpan={6} className="px-4 py-8 text-center text-muted-foreground">No inactive therapists</td></tr>
              )}
            </tbody>
          </table>
        </Card>
      )}
    </div>
  );
}
