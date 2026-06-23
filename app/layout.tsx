import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import Script from "next/script";

const inter = Inter({ subsets: ["latin"], variable: "--font-inter" });

export const metadata: Metadata = {
  title: "Therapy Spaces CRM",
  description: "Admin CRM for Therapy Spaces",
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" className={inter.variable}>
      <body>
        {children}
        {/* QZ Tray for direct label printing */}
        <Script src="https://cdn.jsdelivr.net/npm/qz-tray@2.2.4/qz-tray.js" strategy="lazyOnload" />
      </body>
    </html>
  );
}
