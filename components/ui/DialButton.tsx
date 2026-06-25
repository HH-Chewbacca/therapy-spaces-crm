import { sipHref } from "@/lib/phone";

export function DialButton({ phone, className = "" }: { phone: string | null | undefined; className?: string }) {
  const href = sipHref(phone);
  if (!href) return null;
  return (
    <a
      href={href}
      title="Call (SIP)"
      aria-label="Call"
      className={`inline-flex h-9 w-9 shrink-0 items-center justify-center rounded-[var(--radius)] border border-border text-muted-foreground hover:text-primary hover:bg-surface-muted transition-colors ${className}`}
    >
      <svg width="15" height="15" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
        <path d="M6.62 10.79a15.05 15.05 0 0 0 6.59 6.59l2.2-2.2a1 1 0 0 1 1.02-.24c1.12.37 2.33.57 3.57.57a1 1 0 0 1 1 1V20a1 1 0 0 1-1 1A17 17 0 0 1 3 4a1 1 0 0 1 1-1h3.5a1 1 0 0 1 1 1c0 1.24.2 2.45.57 3.57a1 1 0 0 1-.24 1.02l-2.21 2.2z" />
      </svg>
    </a>
  );
}
