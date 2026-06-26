"use client";
import { Button } from "@/components/ui/Button";

export function BookingsLink({ userId }: { userId: string }) {
  return (
    <a
      href={`https://bookings.therapyspaces.co.uk/calendar?userId=${userId}`}
      target="_blank"
      rel="noopener noreferrer"
    >
      <Button variant="secondary" size="sm">📅 Bookings</Button>
    </a>
  );
}
