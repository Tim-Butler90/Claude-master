import * as React from "react";
import { createRoot } from "react-dom/client";
import { ArrowRight } from "lucide-react";
import { Button } from "./components/Button";
import "./index.css";
import { THEME_IDS } from "./themes/ids.js";

const variants = ["primary", "secondary", "ghost", "danger"];
const themeIds = THEME_IDS;
const sizes = ["sm", "md", "lg"];

function Row({ title, children }) {
  return (
    <section style={{ marginBottom: "var(--spacing-xl)" }}>
      <h2 style={{ marginBottom: "var(--spacing-md)" }}>{title}</h2>
      <div style={{ display: "flex", flexWrap: "wrap", gap: "var(--spacing-md)", alignItems: "center" }}>
        {children}
      </div>
    </section>
  );
}

function App() {
  return (
    <main style={{ maxWidth: 960, margin: "0 auto", padding: "var(--spacing-2xl) var(--spacing-lg)" }}>
      <h1 style={{ marginBottom: "var(--spacing-2xl)" }}>Button</h1>
      <Row title="Variants">
        {variants.map((v) => <Button key={v} variant={v}>{v}</Button>)}
      </Row>
      <Row title="Sizes">
        {sizes.map((s) => <Button key={s} size={s}>Size {s}</Button>)}
      </Row>
      <Row title="States">
        <Button disabled>Disabled</Button>
        <Button loading>Loading</Button>
        <Button variant="secondary" disabled>Disabled</Button>
      </Row>
      <Row title="With icon / as link">
        <Button>Continue <ArrowRight size={16} aria-hidden="true" /></Button>
        <Button asChild variant="secondary"><a href="#top">Link styled as button</a></Button>
      </Row>
      <section style={{ marginTop: "var(--spacing-section)" }}>
        <h1 style={{ marginBottom: "var(--spacing-md)" }}>Themes</h1>
        <p style={{ marginBottom: "var(--spacing-xl)" }}>
          {themeIds.length} palettes generated from the reference library. Same component, only color tokens change.
        </p>
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(280px, 1fr))", gap: "var(--spacing-md)" }}>
          {themeIds.map((id) => (
            <div key={id} data-theme={id} style={{ padding: "var(--spacing-lg)", border: "1px solid var(--color-hairline)", borderRadius: "var(--radius-lg)" }}>
              <p style={{ fontFamily: "var(--font-mono)", fontSize: "var(--text-caption)", marginBottom: "var(--spacing-md)", color: "var(--color-muted)" }}>{id}</p>
              <div style={{ display: "flex", gap: "var(--spacing-xs)", flexWrap: "wrap" }}>
                <Button size="sm">Primary</Button>
                <Button size="sm" variant="secondary">Secondary</Button>
                <Button size="sm" variant="danger">Delete</Button>
              </div>
            </div>
          ))}
        </div>
      </section>
    </main>
  );
}

createRoot(document.getElementById("root")).render(<App />);
