import { HTMLAttributes } from "react";

export function Card({ className = "", ...props }: HTMLAttributes<HTMLDivElement>) {
  return (
    <div
      className={`rounded-[var(--radius)] border border-border bg-surface p-5 ${className}`}
      {...props}
    />
  );
}

type AlertVariant = "danger" | "warning" | "success";

const alertClasses: Record<AlertVariant, string> = {
  danger: "bg-danger-bg border-danger/30 text-danger",
  warning: "bg-warning-bg border-warning-border text-foreground",
  success: "bg-success-bg border-primary/30 text-foreground",
};

export function Alert({
  variant = "danger",
  children,
  className = "",
}: {
  variant?: AlertVariant;
  children: React.ReactNode;
  className?: string;
}) {
  return (
    <div
      role="alert"
      className={`rounded-[var(--radius)] border px-4 py-3 text-sm ${alertClasses[variant]} ${className}`}
    >
      {children}
    </div>
  );
}
