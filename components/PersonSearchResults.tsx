"use client";
import Link from "next/link";
import { Card } from "@/components/ui/Card";

export interface SearchablePerson {
  id: string;
  name: string;
  email: string;
  companyName?: string | null;
  skill?: string | null;
  phone?: string | null;
  flag?: boolean;
  keySentDate?: string | null;
  keyGivenDate?: string | null;
  depositInvoicedDate?: string | null;
}

function isGraduated(p: SearchablePerson): boolean {
  return !!(p.keySentDate || p.keyGivenDate || p.depositInvoicedDate);
}

export function personMatches(p: SearchablePerson, query: string): boolean {
  const q = query.trim().toLowerCase();
  if (!q) return false;
  return [p.name, p.email, p.companyName, p.skill, p.phone].some((v) =>
    (v ?? "").toLowerCase().includes(q)
  );
}

function Group({ title, rows }: { title: string; rows: SearchablePerson[] }) {
  return (
    <div>
      <h2 className="text-xs font-semibold text-muted-foreground uppercase tracking-wider mb-1.5">
        {title} ({rows.length})
      </h2>
      {rows.length === 0 ? (
        <p className="text-sm text-muted-foreground">No matches</p>
      ) : (
        <Card className="p-0 overflow-hidden">
          <table className="w-full text-sm">
            <thead className="bg-surface-muted text-left text-xs font-medium text-muted-foreground uppercase tracking-wider">
              <tr>
                <th className="px-4 py-3">Name</th>
                <th className="px-4 py-3">Email</th>
                <th className="px-4 py-3">Skill</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-border">
              {rows.map((p) => (
                <tr key={p.id} className="hover:bg-surface-muted/50 transition-colors">
                  <td className="px-4 py-2.5 font-medium text-foreground">
                    <Link href={`/therapists/${p.id}`} className="hover:text-primary transition-colors">
                      {p.flag && <span className="mr-1">\U0001F6A9</span>}
                      {p.name}
                      {p.companyName && (
                        <span className="text-muted-foreground font-normal ml-1">({p.companyName})</span>
                      )}
                    </Link>
                  </td>
                  <td className="px-4 py-2.5 text-muted-foreground">{p.email}</td>
                  <td className="px-4 py-2.5 text-muted-foreground">{p.skill ?? "\u2014"}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </Card>
      )}
    </div>
  );
}

export function PersonSearchResults({ people, query }: { people: SearchablePerson[]; query: string }) {
  const matched = people.filter((p) => personMatches(p, query));
  const therapists = matched.filter(isGraduated);
  const pipeline = matched.filter((p) => !isGraduated(p));
  return (
    <div className="space-y-4">
      <Group title="Therapists" rows={therapists} />
      <Group title="Pipeline" rows={pipeline} />
    </div>
  );
}
