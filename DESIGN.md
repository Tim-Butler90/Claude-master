---
version: alpha
name: Claude-master
description: A calm, high-contrast product canvas. One warm terracotta accent
  carries every primary action; everything else is quiet ink on paper. Type is
  modest in weight, depth comes from hairline borders instead of shadows, and
  corners are softly rounded so the system feels friendly but precise.
colors:
  primary: "#C2552D"
  primary-hover: "#A94624"
  primary-active: "#8F3A1D"
  on-primary: "#FFFFFF"
  ink: "#1A1814"
  body: "#3B3731"
  muted: "#6F695F"
  canvas: "#FAF7F2"
  surface: "#FFFFFF"
  surface-sunken: "#F1ECE3"
  hairline: "#E4DDD0"
  focus-ring: "#2457D6"
  success: "#2E7D4F"
  warning: "#B7791F"
  danger: "#C0392B"
  on-danger: "#FFFFFF"
typography:
  display-lg:
    fontFamily: "'Inter Tight', Inter, system-ui, sans-serif"
    fontSize: 56px
    fontWeight: 600
    lineHeight: 1.05
    letterSpacing: -1.6px
  heading-md:
    fontFamily: "'Inter Tight', Inter, system-ui, sans-serif"
    fontSize: 28px
    fontWeight: 600
    lineHeight: 1.2
    letterSpacing: -0.5px
  body-md:
    fontFamily: "Inter, system-ui, sans-serif"
    fontSize: 16px
    fontWeight: 400
    lineHeight: 1.55
    letterSpacing: 0
  button:
    fontFamily: "Inter, system-ui, sans-serif"
    fontSize: 14px
    fontWeight: 500
    lineHeight: 1
    letterSpacing: 0
  caption:
    fontFamily: "Inter, system-ui, sans-serif"
    fontSize: 12px
    fontWeight: 400
    lineHeight: 1.4
    letterSpacing: 0.2px
  mono:
    fontFamily: "'JetBrains Mono', ui-monospace, monospace"
    fontSize: 13px
    fontWeight: 400
    lineHeight: 1.5
    letterSpacing: 0
rounded:
  none: 0px
  xs: 2px
  sm: 4px
  md: 8px
  lg: 12px
  xl: 16px
  full: 9999px
spacing:
  3xs: 2px
  2xs: 4px
  xs: 8px
  sm: 12px
  md: 16px
  lg: 24px
  xl: 32px
  2xl: 48px
  3xl: 64px
  section: 96px
components:
  button-primary:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.on-primary}"
    typography: "{typography.button}"
    rounded: "{rounded.md}"
    padding: "{spacing.sm} {spacing.md}"
  button-secondary:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.ink}"
    typography: "{typography.button}"
    rounded: "{rounded.md}"
    padding: "{spacing.sm} {spacing.md}"
  button-ghost:
    backgroundColor: "transparent"
    textColor: "{colors.ink}"
    typography: "{typography.button}"
    rounded: "{rounded.md}"
    padding: "{spacing.sm} {spacing.md}"
  button-danger:
    backgroundColor: "{colors.danger}"
    textColor: "{colors.on-danger}"
    typography: "{typography.button}"
    rounded: "{rounded.md}"
    padding: "{spacing.sm} {spacing.md}"
  card:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.ink}"
    rounded: "{rounded.lg}"
    padding: "{spacing.lg}"
---

# Claude-master Design System (master)

Source of truth for every design token in this repo. `getdesign.md` is the
structural index of this file; `src/index.css` is the compiled implementation.
Change a value here first, then mirror it in `src/index.css` (same names,
prefixed `--color-`, `--font-`, `--spacing-`, `--radius-`).

Format follows the getdesign.md / Google Stitch `DESIGN.md` alpha spec
(YAML tokens + rationale prose). Layout of sections borrows the "token, rule,
rationale in one file" approach catalogued in rohitg00/awesome-claude-design.

## Overview

The canvas is warm paper `{colors.canvas}` holding deep ink type, with a single
voltage of terracotta `{colors.primary}` on every primary action. There is no
secondary brand color; the accent works because it is scarce.

**Key Characteristics:**
- One accent. `{colors.primary}` is the only brand color on any screen.
- Modest weights. Display sits at 600, body at 400. Size sets hierarchy, not boldness.
- Hairline depth. Surfaces separate with 1px `{colors.hairline}` borders, never drop shadows.
- Soft corners. `{rounded.md}` (8px) is the default control radius.
- Anti-slop: no purple-blue gradients, no centered-hero-plus-three-cards by default.

## Colors

### Brand & Accent
- **Terracotta** (`{colors.primary}` #C2552D): primary CTAs, active nav, inline links. Hover/active darken one and two steps. White text on it is 4.5:1 (AA, at the limit; do not lighten it).

### Surface
- **Canvas** (`{colors.canvas}`): page floor. Warm off-white, lower glare than pure white.
- **Surface** (`{colors.surface}`): cards and inputs, a half-step above canvas.
- **Surface Sunken** (`{colors.surface-sunken}`): wells, code blocks, table stripes.
- **Hairline** (`{colors.hairline}`): all borders and dividers.

### Text
- **Ink** (`{colors.ink}`): headings, button labels. 16:1 on canvas.
- **Body** (`{colors.body}`): running text.
- **Muted** (`{colors.muted}`): captions, placeholders. Never below 4.5:1; do not use for essential content on `{colors.surface-sunken}`.

### Semantic
- **Success / Warning / Danger**: status only, always paired with an icon or label (never color alone).
- **Focus Ring** (`{colors.focus-ring}`): keyboard focus only; deliberately not the brand color so focus is never confused with hover.

## Typography

Families: Inter Tight for display/headings, Inter for UI and body, JetBrains
Mono for code. All fall back to the system stack.

| Token | Size | Weight | Line height | Tracking | Use |
|---|---|---|---|---|---|
| `display-lg` | 56px | 600 | 1.05 | -1.6px | Hero headline, one per page |
| `heading-md` | 28px | 600 | 1.2 | -0.5px | Section titles |
| `body-md` | 16px | 400 | 1.55 | 0 | Running text |
| `button` | 14px | 500 | 1 | 0 | All buttons |
| `caption` | 12px | 400 | 1.4 | 0.2px | Meta, helper text |
| `mono` | 13px | 400 | 1.5 | 0 | Code, tokens |

### Principles
Large sizes get negative tracking so headlines read as one shape; small sizes
get slight positive tracking for legibility. Body never drops below 16px on mobile.

## Layout

T-shirt spacing scale on a 4px base: `3xs 2px`, `2xs 4px`, `xs 8px`,
`sm 12px`, `md 16px`, `lg 24px`, `xl 32px`, `2xl 48px`, `3xl 64px`,
`section 96px`. Use `{spacing.md}` inside components, `{spacing.section}`
between page sections. Content caps at 1200px; gutters absorb the rest.

## Elevation

Flat by default. Depth is a 1px `{colors.hairline}` border. The only shadow tier
is `--shadow-overlay` (menus, dialogs, popovers).

## Radii

`none 0`, `xs 2`, `sm 4`, `md 8` (default controls), `lg 12` (cards),
`xl 16` (modals), `full 9999` (pills, avatars).

## Components

**`button-primary`**: background `{colors.primary}`, text `{colors.on-primary}`,
type `{typography.button}`, padding `{spacing.sm}` × `{spacing.md}`, rounded
`{rounded.md}`. Hover `{colors.primary-hover}`, press `{colors.primary-active}`.

**`button-secondary`**: `{colors.surface}` with a 1px `{colors.hairline}` border,
text `{colors.ink}`. Hover fills `{colors.surface-sunken}`.

**`button-ghost`**: transparent, text `{colors.ink}`. Hover fills `{colors.surface-sunken}`.

**`button-danger`**: `{colors.danger}` / `{colors.on-danger}`. Destructive actions only.

**`card`**: `{colors.surface}`, `{colors.ink}`, rounded `{rounded.lg}`, padding
`{spacing.lg}`, 1px `{colors.hairline}` border, no shadow.

## Responsive Behavior

| Name | Width | Key Changes |
|---|---|---|
| Mobile | < 640px | Display 56→34px; single column; section spacing 96→56px |
| Tablet | 640–1024px | Two-up grids |
| Desktop | > 1024px | Full layout, content max 1200px |

### Touch Targets
Interactive controls are at least 44 × 44px on touch (`--size-touch`). Buttons
`md` and `lg` meet this; `sm` is for dense desktop UI only.

## Known Gaps

- Dark mode is not defined.
- Motion/animation timing is limited to one 150ms ease-out transition token.
- Form inputs, tables, and navigation components are not yet specified.
- Font files are not bundled; families fall back to the system stack until added.
