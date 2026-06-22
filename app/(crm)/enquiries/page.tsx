"use client";
import { useState, useEffect, useCallback } from "react";
import { useRouter } from "next/navigation";
import { Button } from "@/components/ui/Button";
import { Card, Alert } from "@/components/ui/Card";

interface Enquiry {
  id: string; createdAt: string; firstName: string | null; lastName: string | null;
  email: string | null; phone: string | null; location: string | null;
  therapyType: string | null; bookingType: string | null; message: string | null; status: string;
}

const STATUS_COLOURS: Record<string, string> = {
  new:       "bg-danger-bg text-danger",
  contacted: "bg-warning-bg text-foreground",
  viewed:    "bg-primary/10 text-primary",
  converted: "bg-success-bg text-primary",
  rejected:  "bg-surface-muted text-muted-foreground",
};

export default function EnquiriesPage() {
  const router = useRouter();
  const [enquiries, setEnquiries] = useState<Enquiry[]>([]);
  const [loading, setLoading] = useState(true);
  const [filter, setFilter] = useState("new");
  const [dragging, setDragging] = useState(false);
  const [parsing, setParsing] = useState(false);
  const [parsed, setParsed] = useState<Record<string, string> | null>(null);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const load = useCallback(async () => {
    setLoading(true);
    const q = filter !== "all" ? `?status=${filter}` : "";
    const r = await fetch(`/api/enquiries${q}`);
    const d = await r.json();
    setEnquiries(d.enquiries ?? []);
    setLoading(false);
  }, [filter]);

  // eslint-disable-next-line react-hooks/set-state-in-effect
  useEffect(() => { load(); }, [load]);

  async function handleDrop(e: React.DragEvent) {
    e.preventDefault(); setDragging(false); setError(null);
    const file = e.dataTransfer.files[0];
    if (!file) return;
    if (!file.name.toLowerCase().endsWith(".msg") && !file.name.toLowerCase().endsWith(".eml")) {
      setError("Please drop a .msg or .eml email file");
      return;
    }
    setParsing(true);
    const formData = new FormData();
    formData.append("file", file);
    const res = await fetch("/api/enquiries/parse-email", {
      method: "POST",
      body: formData,
    });
    const data = await res.json();
    if (!res.ok) { setError(data.error ?? "Failed to parse email"); setParsing(false); return; }
    setParsed(data); setParsing(false);
  }

  async function saveEnquiry() {
    if (!parsed) return;
    setSaving(true);
    const res = await fetch("/api/enquiries", {
      method: "POST", headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ ...parsed, status: "new" }),
    });
    if (res.ok) { setParsed(null); await load(); }
    setSaving(false);
  }

  async function convertToTherapist(eq: Enquiry) {
    const res = await fetch("/api/therapists", {
      method: "POST", headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        name: [eq.firstName, eq.lastName].filter(Boolean).join(" ") || "Unknown",
        email: eq.email ?? "", phone: eq.phone ?? undefined, skill: eq.therapyType ?? undefined,
      }),
    });
    if (res.ok) {
      const d = await res.json();
      await fetch(`/api/enquiries/${eq.id}`, {
        method: "PATCH", headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ status: "converted", convertedToUserId: d.therapist.id }),
      });
      router.push(`/therapists/${d.therapist.id}`);
    }
  }

  async function updateStatus(id: string, status: string) {
    await fetch(`/api/enquiries/${id}`, {
      method: "PATCH", headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ status }),
    });
    await load();
  }

  const FILTERS = ["all", "new", "contacted", "viewed", "converted", "rejected"];

  return (
    <div className="space-y-4">
      <h1 className="text-xl font-semibold text-foreground">Enquiries</h1>

      {/* Drop zone */}
      <div
        onDragOver={e => { e.preventDefault(); setDragging(true); }}
        onDragLeave={() => setDragging(false)}
        onDrop={handleDrop}
        className={`border-2 border-dashed rounded-[var(--radius)] p-8 text-center transition-colors ${
          dragging ? "border-primary bg-success-bg" : "border-border bg-surface"
        }`}>
        {parsing ? (
          <p className="text-muted-foreground text-sm">Parsing email…</p>
        ) : (
          <>
            <p className="text-sm text-foreground font-medium">Drop a viewing-request <code className="bg-surface-muted px-1 rounded text-xs">.msg</code> file here</p>
            <p className="text-xs text-muted-foreground mt-1">Web3Forms format is parsed automatically</p>
          </>
        )}
      </div>

      {/* Parsed preview */}
      {parsed && (
        <Card>
          <h2 className="text-sm font-semibold text-foreground mb-3">Review before saving</h2>
          <div className="grid grid-cols-2 gap-3">
            {Object.entries(parsed).filter(([k]) => k !== "rawEmail").map(([k, v]) => (
              <div key={k}>
                <label className="mb-1 block text-xs font-medium text-muted-foreground capitalize">
                  {k.replace(/([A-Z])/g, " $1").trim()}
                </label>
                <input className="w-full rounded-[var(--radius)] border border-border bg-surface px-3 py-1.5 text-sm text-foreground focus-visible:outline-2 focus-visible:outline-primary"
                  value={v as string} onChange={e => setParsed(p => ({ ...p!, [k]: e.target.value }))} />
              </div>
            ))}
          </div>
          <div className="flex gap-2 mt-4">
            <Button onClick={saveEnquiry} disabled={saving}>{saving ? "Saving…" : "Save enquiry"}</Button>
            <Button variant="secondary" onClick={() => setParsed(null)}>Discard</Button>
          </div>
        </Card>
      )}

      {error && <Alert variant="danger">{error}</Alert>}

      {/* Filters */}
      <div className="flex gap-1.5">
        {FILTERS.map(s => (
          <button key={s} onClick={() => setFilter(s)}
            className={`px-3 py-1.5 rounded-[var(--radius)] text-sm capitalize transition-colors ${
              filter === s ? "bg-primary text-primary-foreground" : "bg-surface border border-border text-foreground hover:bg-surface-muted"
            }`}>
            {s}
          </button>
        ))}
      </div>

      {loading ? <p className="text-muted-foreground text-sm">Loading…</p> : (
        <Card className="p-0 overflow-hidden">
          <table className="w-full text-sm">
            <thead className="bg-surface-muted text-left text-xs font-medium text-muted-foreground uppercase tracking-wider">
              <tr>
                <th className="px-4 py-3">Name</th>
                <th className="px-4 py-3">Email</th>
                <th className="px-4 py-3">Location</th>
                <th className="px-4 py-3">Therapy type</th>
                <th className="px-4 py-3">Received</th>
                <th className="px-4 py-3">Status</th>
                <th className="px-4 py-3"></th>
              </tr>
            </thead>
            <tbody className="divide-y divide-border">
              {enquiries.map(eq => (
                <tr key={eq.id} className="hover:bg-surface-muted/50 transition-colors">
                  <td className="px-4 py-2.5 font-medium text-foreground">
                    {[eq.firstName, eq.lastName].filter(Boolean).join(" ") || "—"}
                  </td>
                  <td className="px-4 py-2.5 text-muted-foreground">{eq.email ?? "—"}</td>
                  <td className="px-4 py-2.5 text-muted-foreground">{eq.location ?? "—"}</td>
                  <td className="px-4 py-2.5 text-muted-foreground">{eq.therapyType ?? "—"}</td>
                  <td className="px-4 py-2.5 text-muted-foreground text-xs">
                    {new Date(eq.createdAt).toLocaleDateString("en-GB")}
                  </td>
                  <td className="px-4 py-2.5">
                    <select value={eq.status} onChange={e => updateStatus(eq.id, e.target.value)}
                      className={`text-xs px-2 py-0.5 rounded-full font-medium border-0 cursor-pointer ${STATUS_COLOURS[eq.status] ?? ""}`}>
                      {["new","contacted","viewed","converted","rejected"].map(s => (
                        <option key={s} value={s}>{s}</option>
                      ))}
                    </select>
                  </td>
                  <td className="px-4 py-2.5 text-right">
                    {eq.status !== "converted" && eq.status !== "rejected" && (
                      <button onClick={() => convertToTherapist(eq)}
                        className="text-xs text-primary hover:text-primary-hover font-medium transition-colors">
                        Convert →
                      </button>
                    )}
                  </td>
                </tr>
              ))}
              {enquiries.length === 0 && (
                <tr><td colSpan={7} className="px-4 py-8 text-center text-muted-foreground">No enquiries</td></tr>
              )}
            </tbody>
          </table>
        </Card>
      )}
    </div>
  );
}
