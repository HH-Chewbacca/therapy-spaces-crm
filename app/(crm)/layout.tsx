"use client";
import Link from "next/link";
import { usePathname, useRouter } from "next/navigation";
import { useEffect, useState } from "react";

const NAV = [
  { href: "/therapists",    label: "Therapists" },
  { href: "/pipeline",      label: "Pipeline" },
  { href: "/organisations", label: "Organisations" },
  { href: "/fanvil",        label: "Fanvil" },
];

export default function CRMLayout({ children }: { children: React.ReactNode }) {
  const pathname = usePathname();
  const router = useRouter();
  const [user, setUser] = useState<{ name: string } | null>(null);

  useEffect(() => {
    fetch("/api/auth/me").then(r => {
      if (!r.ok) { router.push("/login"); return null; }
      return r.json();
    }).then(d => d && setUser(d.user));
  }, [router]);

  async function logout() {
    await fetch("/api/auth/me", { method: "DELETE" });
    router.push("/login");
  }

  return (
    <div className="min-h-screen flex flex-col bg-background text-foreground">
      <header className="bg-primary text-primary-foreground px-6 py-0 flex items-center justify-between h-12 shrink-0">
        <div className="flex items-center gap-6">
          <span className="font-semibold text-sm tracking-tight">Therapy Spaces CRM</span>
          <nav className="flex">
            {NAV.map(({ href, label }) => (
              <Link key={href} href={href}
                className={`px-3 py-3.5 text-sm font-medium border-b-2 transition-colors ${
                  pathname?.startsWith(href)
                    ? "border-primary-foreground text-primary-foreground"
                    : "border-transparent text-primary-foreground/70 hover:text-primary-foreground hover:border-primary-foreground/40"
                }`}>
                {label}
              </Link>
            ))}
          </nav>
        </div>
        <div className="flex items-center gap-4 text-sm text-primary-foreground/80">
          {user && <span>{user.name}</span>}
          <button onClick={logout} className="hover:text-primary-foreground transition-colors">Sign out</button>
        </div>
      </header>
      <main className="flex-1 p-6 max-w-7xl mx-auto w-full">{children}</main>
    </div>
  );
}
