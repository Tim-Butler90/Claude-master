---
name: design-system
description: Use before writing or changing any UI in this repo (components, pages, CSS). Enforces the project's DESIGN.md / getdesign.md tokens, the anti-slop rules, and points to reference DESIGN.md files for restyling or remixing.
---

# Design system

1. Read `/DESIGN.md` (values + rationale) and `/getdesign.md` (token to CSS variable map) first.
2. Use only theme variables from `src/index.css` (`var(--color-*)`, `--spacing-*`, `--radius-*`, `--text-*`). No raw hex, px or rem in components.
3. New token? Add it to `DESIGN.md`, `getdesign.md` and `src/index.css`, then run `npm run check:tokens`.
4. Before generating a new page or layout, apply `design-reference/awesome-claude-design/prompts/break-default-aesthetic.md` (one accent, no pulsing status dots, container depth max 2, no three-column feature grid by default).
5. To restyle or remix, pick a family from `design-reference/awesome-claude-design/design-md/` (brutalist, cinematic, data-dense, editorial, glass, indie, playful, terminal, warm, remix) and port its tokens into `DESIGN.md`. Do not paste whole brand files.
6. Components: structure and accessibility in `.jsx`, visuals in `index.css`. Keep the 44px touch target, visible focus ring, and AA contrast.
