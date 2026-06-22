"use client";
import { useState, useEffect } from "react";
import { Button } from "@/components/ui/Button";
import { Card } from "@/components/ui/Card";
import { Label } from "@/components/ui/Input";

interface Location { id: string; name: string; }
interface Exception {
  id: string; entryTime: string; name: string; cardId: string;
  therapistName: string | null; reason: string;
  location: { name: string } | null;
}

export default function FanvilPage() {
  const [locations, setLocations] = useState<Location[]>([]);
  const [locationId, setLocationId] = useState("");
  const [importing, setImporting] = useState(false);
  const [importResult, setImportResult] = useState<{ text: string; ok: boolean } | null>(null);

  const [from, setFrom] = useState(() => { const d = new Date(); d.setDate(1); return d.toISOString().slice(0, 10); });
  const [to, setTo] = useState(() => new Date().toISOString().slice(0, 10));
  const [exceptions, setExceptions] = useState<Exception[]>([]);
  const [total, setTotal] = useState(0);
  const [loadingReport, setLoadingReport] = useState(false);
  const [reportRun, setReportRun] = useState(false);

  useEffect(() => {
    fetch("/api/locations").then(r => r.json()).then(d => {
      setLocations(d.locations ?? []);
      if (d.locations?.[0]) setLocationId(d.locations[0].id);
    });
  }, []);

  async function handleCSV(e: React.ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0];
    if (!file) return;
    setImporting(true); setImportResult(null);
    const text = await file.text();
    const lines = text.trim().split("\n").filter(Boolean);
    const header = lines[0].replace(/^\uFEFF/, "").split(",").map(h => h.trim().replace(/^"|"$/g, ""));
    const rows = lines.slice(1).map(line => {
      const vals = line.split(",").map(v => v.trim().replace(/^"|"$/g, ""));
      return Object.fromEntries(header.map((h, i) => [h, vals[i] ?? ""]));
    });
    const mapped = rows.map(r => ({
      relay: parseInt(r["Relay"] ?? r["\uFEFFRelay"] ?? "0"),
      result: r["Result"] ?? "", name: r["Name"] ?? "",
      cardId: r["Extra"] ?? "", entryType: r["Type"] ?? "",
      reason: r["Reason"] ?? undefined, entryTime: r["Time"] ?? "",
    }));
    const res = await fetch("/api/fanvil/import", {
      method: "POST", headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ rows: mapped, locationId: locationId || undefined }),
    });
    const d = await res.json();
    setImportResult({ text: res.ok ? `Imported ${d.imported} entries.` : (d.error ?? "Import failed"), ok: res.ok });
    setImporting(false); e.target.value = "";
  }

  async function runReport() {
    setLoadingReport(true); setReportRun(true);
    const r = await fetch(`/api/fanvil/exceptions?from=${from}T00:00:00Z&to=${to}T23:59:59Z`);
    const d = await r.json();
    setExceptions(d.exceptions ?? []); setTotal(d.total ?? 0); setLoadingReport(false);
  }

  function exportCSV() {
    const rows = [
      ["Entry time","Name","Card ID","Therapist","Location","Reason"],
      ...exceptions.map(e => [new Date(e.entryTime).toLocaleString("en-GB"), e.name, e.cardId, e.therapistName ?? "Unknown", e.location?.name ?? "—", e.reason])
    ];
    const csv = rows.map(r => r.map(c => `"${c}"`).join(",")).join("\n");
    const blob = new Blob([csv], { type: "text/csv" });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a"); a.href = url;
    a.download = `fanvil-exceptions-${from}-to-${to}.csv`; a.click(); URL.revokeObjectURL(url);
  }

  return (
    <div className="space-y-4 max-w-4xl">
      <h1 className="text-xl font-semibold text-foreground">Fanvil Door Entry</h1>

      <Card className="space-y-4">
        <h2 className="text-xs font-semibold text-muted-foreground uppercase tracking-wider">Import log</h2>
        <div className="flex items-end gap-4">
          <div>
            <Label>Location</Label>
            <select value={locationId} onChange={e => setLocationId(e.target.value)}
              className="rounded-[var(--radius)] border border-border bg-surface px-3 py-2 text-sm text-foreground focus-visible:outline-2 focus-visible:outline-primary">
              {locations.map(l => <option key={l.id} value={l.id}>{l.name}</option>)}
            </select>
          </div>
          <div>
            <Label>CSV file</Label>
            <input type="file" accept=".csv" onChange={handleCSV} disabled={importing}
              className="text-sm text-foreground file:mr-3 file:py-1.5 file:px-3 file:rounded-[var(--radius)] file:border-0 file:text-sm file:bg-primary file:text-primary-foreground hover:file:bg-primary-hover file:cursor-pointer" />
          </div>
        </div>
        {importing && <p className="text-sm text-muted-foreground">Importing…</p>}
        {importResult && <p className={`text-sm ${importResult.ok ? "text-primary" : "text-danger"}`}>{importResult.text}</p>}
        <p className="text-xs text-muted-foreground">Cleaner card and admin fob are excluded automatically.</p>
      </Card>

      <Card className="space-y-4">
        <h2 className="text-xs font-semibold text-muted-foreground uppercase tracking-wider">Exceptions report</h2>
        <p className="text-xs text-muted-foreground">Flags entries with no booking within 45 minutes before / 30 minutes after entry time.</p>
        <div className="flex items-end gap-4 flex-wrap">
          <div>
            <Label>From</Label>
            <input type="date" value={from} onChange={e => setFrom(e.target.value)}
              className="rounded-[var(--radius)] border border-border bg-surface px-3 py-2 text-sm text-foreground focus-visible:outline-2 focus-visible:outline-primary" />
          </div>
          <div>
            <Label>To</Label>
            <input type="date" value={to} onChange={e => setTo(e.target.value)}
              className="rounded-[var(--radius)] border border-border bg-surface px-3 py-2 text-sm text-foreground focus-visible:outline-2 focus-visible:outline-primary" />
          </div>
          <Button onClick={runReport} disabled={loadingReport}>{loadingReport ? "Running…" : "Run report"}</Button>
          {exceptions.length > 0 && <Button variant="secondary" onClick={exportCSV}>Export CSV</Button>}
        </div>

        {reportRun && !loadingReport && (
          <>
            <div className="flex items-center gap-4 text-sm border-t border-border pt-3">
              <span className="text-muted-foreground">{total} total entries scanned</span>
              <span className={`font-medium ${exceptions.length > 0 ? "text-danger" : "text-primary"}`}>
                {exceptions.length} exceptions
              </span>
            </div>
            {exceptions.length > 0 ? (
              <table className="w-full text-sm">
                <thead className="bg-surface-muted text-left text-xs font-medium text-muted-foreground">
                  <tr>
                    <th className="px-3 py-2">Time</th>
                    <th className="px-3 py-2">Name (Fanvil)</th>
                    <th className="px-3 py-2">Card ID</th>
                    <th className="px-3 py-2">Matched therapist</th>
                    <th className="px-3 py-2">Location</th>
                    <th className="px-3 py-2">Reason</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-border">
                  {exceptions.map(ex => (
                    <tr key={ex.id} className="hover:bg-danger-bg/50 transition-colors">
                      <td className="px-3 py-2 text-foreground whitespace-nowrap">
                        {new Date(ex.entryTime).toLocaleString("en-GB", { day: "2-digit", month: "short", hour: "2-digit", minute: "2-digit" })}
                      </td>
                      <td className="px-3 py-2 text-foreground">{ex.name}</td>
                      <td className="px-3 py-2 text-muted-foreground font-mono text-xs">{ex.cardId}</td>
                      <td className="px-3 py-2 text-foreground">{ex.therapistName ?? <span className="text-danger">Unknown card</span>}</td>
                      <td className="px-3 py-2 text-muted-foreground">{ex.location?.name ?? "—"}</td>
                      <td className="px-3 py-2 text-muted-foreground text-xs">{ex.reason}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            ) : (
              <p className="text-primary text-sm">✓ No exceptions — all entries have matching bookings.</p>
            )}
          </>
        )}
      </Card>
    </div>
  );
}
