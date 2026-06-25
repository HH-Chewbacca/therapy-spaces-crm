export function MailButton({ email, className = "h-9 w-9" }: { email: string | null | undefined; className?: string }) {
  const e = (email || "").trim();
  if (!e) return null;
  return (
    <a
      href={`mailto:${e}`}
      title="Email"
      aria-label="Email"
      className={`inline-flex shrink-0 items-center justify-center rounded-[var(--radius)] border border-border text-muted-foreground hover:text-primary hover:bg-surface-muted transition-colors ${className}`}
    >
      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
        <rect x="3" y="5" width="18" height="14" rx="2" />
        <path d="m3 7 9 6 9-6" />
      </svg>
    </a>
  );
}
