# getdesign.md — structural token matrix

Machine-friendly index of `DESIGN.md`. Every row maps one token to its CSS
custom property in `src/index.css` and to the Tailwind v4 utility it generates.
`DESIGN.md` is authoritative for values and rationale; this file is authoritative
for naming and wiring.

**Spec:** getdesign.md / Google Stitch `DESIGN.md` alpha
(YAML tokens → prose rationale → component references).
**Consumers:** `src/index.css` (`@theme`), `src/components/*.jsx`.

## Wiring rules

1. A token is defined once in `DESIGN.md` and once in `src/index.css`. Nowhere else.
2. Components reference `var(--…)` only. No raw hex, px, or rem in `.jsx`.
3. Names are roles, not values (`primary`, never `orange-500`).
4. Add a token → add it to all three: `DESIGN.md`, this file, `src/index.css`.

## Colors

| Token | Value | CSS variable | Tailwind utility | Role |
|---|---|---|---|---|
| primary | #C2552D | `--color-primary` | `bg-primary` | Primary action, links |
| primary-hover | #A94624 | `--color-primary-hover` | `bg-primary-hover` | Hover on primary |
| primary-active | #8F3A1D | `--color-primary-active` | `bg-primary-active` | Press on primary |
| on-primary | #FFFFFF | `--color-on-primary` | `text-on-primary` | Text on primary |
| ink | #1A1814 | `--color-ink` | `text-ink` | Headings, labels |
| body | #3B3731 | `--color-body` | `text-body` | Running text |
| muted | #6F695F | `--color-muted` | `text-muted` | Captions, placeholders |
| canvas | #FAF7F2 | `--color-canvas` | `bg-canvas` | Page floor |
| surface | #FFFFFF | `--color-surface` | `bg-surface` | Cards, inputs |
| surface-sunken | #F1ECE3 | `--color-surface-sunken` | `bg-surface-sunken` | Wells, hover fill |
| hairline | #E4DDD0 | `--color-hairline` | `border-hairline` | Borders, dividers |
| focus-ring | #2457D6 | `--color-focus-ring` | `ring-focus-ring` | Keyboard focus |
| success | #2E7D4F | `--color-success` | `text-success` | Status |
| warning | #B7791F | `--color-warning` | `text-warning` | Status |
| danger | #C0392B | `--color-danger` | `bg-danger` | Destructive, error |
| on-danger | #FFFFFF | `--color-on-danger` | `text-on-danger` | Text on danger |

## Typography

| Token | Family var | Size | Weight | Line height | Tracking |
|---|---|---|---|---|---|
| display-lg | `--font-display` | `--text-display-lg` 56px | 600 | 1.05 | -1.6px |
| heading-md | `--font-display` | `--text-heading-md` 28px | 600 | 1.2 | -0.5px |
| body-md | `--font-sans` | `--text-body-md` 16px | 400 | 1.55 | 0 |
| button | `--font-sans` | `--text-button` 14px | 500 | 1 | 0 |
| caption | `--font-sans` | `--text-caption` 12px | 400 | 1.4 | 0.2px |
| mono | `--font-mono` | `--text-mono` 13px | 400 | 1.5 | 0 |

## Spacing (t-shirt steps, 4px base)

| Step | Value | CSS variable |
|---|---|---|
| 3xs | 2px | `--spacing-3xs` |
| 2xs | 4px | `--spacing-2xs` |
| xs | 8px | `--spacing-xs` |
| sm | 12px | `--spacing-sm` |
| md | 16px | `--spacing-md` |
| lg | 24px | `--spacing-lg` |
| xl | 32px | `--spacing-xl` |
| 2xl | 48px | `--spacing-2xl` |
| 3xl | 64px | `--spacing-3xl` |
| section | 96px | `--spacing-section` |

## Corner radii

| Step | Value | CSS variable | Default for |
|---|---|---|---|
| none | 0 | `--radius-none` | Full-bleed |
| xs | 2px | `--radius-xs` | Tags |
| sm | 4px | `--radius-sm` | Inline chips |
| md | 8px | `--radius-md` | Buttons, inputs |
| lg | 12px | `--radius-lg` | Cards |
| xl | 16px | `--radius-xl` | Modals |
| full | 9999px | `--radius-full` | Pills, avatars |

## Other tokens (implementation-only)

| CSS variable | Value | Use |
|---|---|---|
| `--size-touch` | 44px | Min touch target |
| `--duration-fast` | 150ms | Hover/press transitions |
| `--ease-out` | cubic-bezier(0.2, 0, 0, 1) | Transitions |
| `--shadow-overlay` | 0 8px 24px rgb(26 24 20 / 0.12) | Menus, dialogs only |

## Component map

| Component | File | Variants | Sizes | Tokens used |
|---|---|---|---|---|
| Button | `src/components/Button.jsx` | primary, secondary, ghost, danger | sm, md, lg | color-primary*, color-surface*, color-ink, color-danger, radius-md, spacing-*, text-button, size-touch |
