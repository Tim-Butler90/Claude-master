# Claude-master

## UI work
Before writing or editing any UI, follow the `design-system` skill (`.claude/skills/design-system/SKILL.md`).
Source of truth: `DESIGN.md` (values and rationale), `getdesign.md` (token map), `src/index.css` (implementation).
Never hard-code colors, spacing, radii or font sizes in components. Use the theme variables.
After changing tokens, run `npm run check:tokens`.

## Commands
- `npm run build` builds CSS and JS to `dist/`
- `npm run demo` builds and serves the Button demo at http://localhost:4173/index.html
- `npm run check:tokens` verifies `DESIGN.md` and `src/index.css` agree

## Skills
Installed third-party skills are listed in `SKILLS.md`. Scan new ones before trusting them.
