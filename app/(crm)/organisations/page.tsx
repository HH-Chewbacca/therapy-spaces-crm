"use client";
import { useState, useEffect, useCallback } from "react";
import { Button } from "@/components/ui/Button";
import { Card, Alert } from "@/components/ui/Card";
import { Input, Label } from "@/components/ui/Input";

interface Member { id: string; name: string; email: string; }
interface Org {
  id: string; name: string; email: string | null; phone: string | null;
  address1: string | null; city: string | null; postcode: string | null; notes: string | null;
  members: Member[];
}
interface Therapist { id: string; name: string; email: string; organisationId: string | null; }

const BLANK = { name: "", email: "", phone: "", address1: "", city: "", postcode: "", notes: "" };

export default function OrganisationsPage() {
  const [orgs, setOrgs] = useState<Org[]>([]);
  const [therapists, setTherapists] = useState<Therapist[]>([]);
  const [loading, setLoading] = useState(true);
  const [showForm, setShowForm] = useState(false);
  const [form, setForm] = useState(BLANK);
  const [saving, setSaving] = useState(false);
  const [editing, setEditing] = useState<string | null>(null);
  const [editForm, setEditForm] = useState(BLANK);
  const [managingMembers, setManagingMembers] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);

  const load = useCallback(async () => {
    setLoading(true);
    const [or, tr] = await Promise.all([
      fetch("/api/organisations").then(r => r.json()),
      fetch("/api/therapists").then(r => r.json()),
    ]);
    setOrgs(or.organisations ?? []);
    setTherapists(tr.therapists ?? []);
    setLoading(false);
  }, []);

  // eslint-disable-next-line react-hooks/set-state-in-effect
  useEffect(() => { load(); }, [load]);

  async function create(e: React.FormEvent) {
    e.preventDefault(); setSaving(true); setError(null);
    await fetch("/api/organisations", {
      method: "POST", headers: { "Content-Type": "application/json" },
      body: JSON.stringify(form),
    });
    setForm(BLANK); setShowForm(false); setSaving(false); await load();
  }

  async function save(id: string) {
    await fetch(`/api/organisations/${id}`, {
      method: "PATCH", headers: { "Content-Type": "application/json" },
      body: JSON.stringify(editForm),
    });
    setEditing(null); await load();
  }

  async function remove(id: string, name: string) {
    if (!confirm(`Delete "${name}"? Members will be unlinked.`)) return;
    await fetch(`/api/organisations/${id}`, { method: "DELETE" });
    await load();
  }

  async function toggleMember(therapistId: string, currentOrgId: string | null, targetOrgId: string) {
    const newOrgId = currentOrgId === targetOrgId ? null : targetOrgId;
    await fetch(`/api/therapists/${therapistId}`, {
      method: "PATCH", headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ organisationId: newOrgId }),
    });
    await load();
  }

  const fields = [
    ["name", "Organisation name", true],
    ["email", "Email", false],
    ["phone", "Phone", false],
    ["address1", "Address", false],
    ["city", "City", false],
    ["postcode", "Postcode", false],
  ] as const;

  return (
    <div className="space-y-4 max-w-3xl">
      <div className="flex items-center justify-between">
        <h1 className="text-xl font-semibold text-foreground">Organisations</h1>
        <Button onClick={() => setShowForm(s => !s)}>+ New organisation</Button>
      </div>

      {error && <Alert variant="danger">{error}</Alert>}

      {showForm && (
        <Card>
          <form onSubmit={create} className="space-y-4">
            <div className="grid grid-cols-2 gap-4">
              {fields.map(([f, label, req]) => (
                <div key={f}>
                  <Label>{label}</Label>
                  <Input required={req} value={form[f]}
                    onChange={e => setForm(p => ({ ...p, [f]: e.target.value }))} />
                </div>
              ))}
            </div>
            <div>
              <Label>Notes</Label>
              <textarea value={form.notes} rows={2} onChange={e => setForm(p => ({ ...p, notes: e.target.value }))}
                className="w-full rounded-[var(--radius)] border border-border bg-surface px-3 py-2 text-sm focus-visible:outline-2 focus-visible:outline-primary" />
            </div>
            <div className="flex gap-2">
              <Button type="submit" disabled={saving}>{saving ? "Creating…" : "Create"}</Button>
              <Button type="button" variant="secondary" onClick={() => setShowForm(false)}>Cancel</Button>
            </div>
          </form>
        </Card>
      )}

      {loading ? <p className="text-muted-foreground text-sm">Loading…</p> : (
        <div className="space-y-3">
          {orgs.map(org => (
            <Card key={org.id}>
              {editing === org.id ? (
                <div className="space-y-4">
                  <div className="grid grid-cols-2 gap-4">
                    {fields.map(([f, label]) => (
                      <div key={f}>
                        <Label>{label}</Label>
                        <Input value={editForm[f]} onChange={e => setEditForm(p => ({ ...p, [f]: e.target.value }))} />
                      </div>
                    ))}
                  </div>
                  <div className="flex gap-2">
                    <Button onClick={() => save(org.id)}>Save</Button>
                    <Button variant="secondary" onClick={() => setEditing(null)}>Cancel</Button>
                  </div>
                </div>
              ) : (
                <div className="space-y-3">
                  <div className="flex items-start justify-between">
                    <div>
                      <h3 className="font-medium text-foreground">{org.name}</h3>
                      <p className="text-sm text-muted-foreground">{[org.email, org.phone].filter(Boolean).join(" · ")}</p>
                      <p className="text-sm text-muted-foreground">{[org.address1, org.city, org.postcode].filter(Boolean).join(", ")}</p>
                    </div>
                    <div className="flex gap-2">
                      <Button size="sm" variant="secondary"
                        onClick={() => setManagingMembers(managingMembers === org.id ? null : org.id)}>
                        {managingMembers === org.id ? "Done" : `Members (${org.members.length})`}
                      </Button>
                      <Button size="sm" variant="secondary"
                        onClick={() => { setEditing(org.id); setEditForm({ name: org.name, email: org.email ?? "", phone: org.phone ?? "", address1: org.address1 ?? "", city: org.city ?? "", postcode: org.postcode ?? "", notes: org.notes ?? "" }); }}>
                        Edit
                      </Button>
                      <Button size="sm" variant="danger" onClick={() => remove(org.id, org.name)}>Delete</Button>
                    </div>
                  </div>

                  {/* Member management panel */}
                  {managingMembers === org.id && (
                    <div className="border-t border-border pt-3 space-y-2">
                      <p className="text-xs font-medium text-muted-foreground uppercase tracking-wide">Assign therapists</p>
                      <div className="grid grid-cols-2 gap-1 max-h-48 overflow-y-auto">
                        {therapists.map(th => {
                          const isMember = th.organisationId === org.id;
                          const inOtherOrg = th.organisationId && th.organisationId !== org.id;
                          return (
                            <label key={th.id} className={`flex items-center gap-2 px-2 py-1.5 rounded-[var(--radius)] cursor-pointer text-sm ${isMember ? "bg-success-bg text-foreground" : "hover:bg-surface-muted text-foreground"} ${inOtherOrg ? "opacity-40 cursor-not-allowed" : ""}`}>
                              <input type="checkbox" checked={isMember} disabled={!!inOtherOrg}
                                onChange={() => toggleMember(th.id, th.organisationId, org.id)}
                                className="h-4 w-4 rounded border-border text-primary" />
                              <span className="truncate">{th.name}</span>
                              {inOtherOrg && <span className="text-xs text-muted-foreground ml-auto">(other org)</span>}
                            </label>
                          );
                        })}
                      </div>
                    </div>
                  )}

                  {/* Current members summary (when not managing) */}
                  {managingMembers !== org.id && org.members.length > 0 && (
                    <div className="flex flex-wrap gap-1.5 pt-1">
                      {org.members.map(m => (
                        <span key={m.id} className="text-xs bg-surface-muted text-muted-foreground rounded-full px-2.5 py-0.5">{m.name}</span>
                      ))}
                    </div>
                  )}
                </div>
              )}
            </Card>
          ))}
          {orgs.length === 0 && <p className="text-muted-foreground text-sm">No organisations yet.</p>}
        </div>
      )}
    </div>
  );
}
