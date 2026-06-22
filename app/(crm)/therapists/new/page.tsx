"use client";
import { useState, useEffect } from "react";
import { useRouter } from "next/navigation";
import { Button } from "@/components/ui/Button";
import { Card } from "@/components/ui/Card";
import { Input, Label } from "@/components/ui/Input";

export default function NewTherapistPage() {
  const router = useRouter();
  const [locations, setLocations] = useState<{ id: string; name: string }[]>([]);
  const [form, setForm] = useState({ name: "", email: "", phone: "", companyName: "", skill: "", locationIds: [] as string[] });
  const [error, setError] = useState("");
  const [saving, setSaving] = useState(false);

  useEffect(() => {
    fetch("/api/locations").then(r => r.json()).then(d => setLocations(d.locations ?? []));
  }, []);

  function toggleLocation(id: string) {
    setForm(f => ({
      ...f, locationIds: f.locationIds.includes(id)
        ? f.locationIds.filter(l => l !== id)
        : [...f.locationIds, id],
    }));
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault(); setError(""); setSaving(true);
    const res = await fetch("/api/therapists", {
      method: "POST", headers: { "Content-Type": "application/json" },
      body: JSON.stringify(form),
    });
    if (res.ok) {
      const d = await res.json(); router.push(`/therapists/${d.therapist.id}`);
    } else {
      const d = await res.json(); setError(d.error ?? "Could not create therapist"); setSaving(false);
    }
  }

  const FIELDS = [
    ["name", "Full name", "text", true],
    ["email", "Email", "email", true],
    ["phone", "Phone", "tel", false],
    ["companyName", "Company name", "text", false],
    ["skill", "Skill / therapy type", "text", false],
  ] as const;

  return (
    <div className="max-w-2xl space-y-4">
      <h1 className="text-xl font-semibold text-foreground">New therapist</h1>
      {error && <div className="rounded-[var(--radius)] border border-danger/30 bg-danger-bg px-4 py-3 text-sm text-danger">{error}</div>}
      <Card>
        <form onSubmit={handleSubmit} className="space-y-4">
          <div className="grid grid-cols-2 gap-4">
            {FIELDS.map(([field, label, type, req]) => (
              <div key={field}>
                <Label>{label}</Label>
                <Input type={type} required={req}
                  value={(form as unknown as Record<string, string>)[field]}
                  onChange={e => setForm(f => ({ ...f, [field]: e.target.value }))} />
              </div>
            ))}
          </div>
          {locations.length > 0 && (
            <div>
              <Label>Authorised locations</Label>
              <div className="flex gap-4 mt-1">
                {locations.map(l => (
                  <label key={l.id} className="flex items-center gap-2 cursor-pointer text-sm text-foreground">
                    <input type="checkbox" checked={form.locationIds.includes(l.id)}
                      onChange={() => toggleLocation(l.id)}
                      className="h-4 w-4 rounded border-border text-primary" />
                    {l.name}
                  </label>
                ))}
              </div>
            </div>
          )}
          <div className="flex gap-3 pt-2">
            <Button type="submit" disabled={saving}>{saving ? "Creating…" : "Create therapist"}</Button>
            <Button type="button" variant="secondary" onClick={() => router.push("/therapists")}>Cancel</Button>
          </div>
        </form>
      </Card>
    </div>
  );
}
