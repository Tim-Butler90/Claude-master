// Verifies DESIGN.md front-matter tokens match the @theme block in src/index.css.
// No dependencies. Exit 1 on any mismatch.
import { readFileSync } from "node:fs";

const md = readFileSync("DESIGN.md", "utf8");
const css = readFileSync("src/index.css", "utf8");
const front = md.split(/^---$/m)[1] ?? "";

// Parse one-level "section:\n  key: value" blocks.
const sections = {};
let current = null;
for (const line of front.split("\n")) {
  const head = line.match(/^([a-z]+):\s*$/);
  if (head) { current = head[1]; sections[current] = {}; continue; }
  const kv = line.match(/^ {2}([\w-]+):\s*"?([^"\n]+?)"?\s*$/);
  if (kv && current && ["colors", "rounded", "spacing"].includes(current)) sections[current][kv[1]] = kv[2];
}

const cssVars = Object.fromEntries([...css.matchAll(/--([\w-]+):\s*([^;]+);/g)].map(m => [m[1], m[2].trim()]));
const prefix = { colors: "color", rounded: "radius", spacing: "spacing" };
const norm = v => v.toLowerCase().replace(/^0px$/, "0px");

let errors = 0, checked = 0;
for (const [section, tokens] of Object.entries(sections)) {
  for (const [name, value] of Object.entries(tokens)) {
    checked++;
    const key = `${prefix[section]}-${name}`;
    if (!(key in cssVars)) { console.error(`MISSING in index.css: --${key} (DESIGN.md ${section}.${name} = ${value})`); errors++; }
    else if (norm(cssVars[key]) !== norm(value)) { console.error(`MISMATCH --${key}: DESIGN.md=${value} index.css=${cssVars[key]}`); errors++; }
  }
  // Reverse check: CSS tokens absent from DESIGN.md
  for (const key of Object.keys(cssVars).filter(k => k.startsWith(prefix[section] + "-"))) {
    const name = key.slice(prefix[section].length + 1);
    if (!(name in tokens) && section !== "colors" || (section === "colors" && !(name in tokens))) {
      console.error(`EXTRA in index.css, not in DESIGN.md: --${key}`); errors++;
    }
  }
}
console.log(`${checked} tokens checked, ${errors} problem(s).`);
process.exit(errors ? 1 : 0);
