# Installed skills (project scope: `.claude/skills/`)

| Source repo | Skills | Notes |
|---|---|---|
| remotion-dev/remotion (`packages/skills/skills`) | remotion-best-practices, -captions, -create, -docs, -interactivity, -maps, -markup, -multimedia, -render, -saas, -studio, -upgrade | committed |
| heygen-com/hyperframes (`skills/`) | hyperframes (router), hyperframes-core/-cli/-animation/-audio/-creative/-keyframes/-registry/-studio, media-use, embedded-captions, faceless-explainer, figma, general-video, motion-graphics, music-to-video, pr-to-video, product-launch-video, remotion-to-hyperframes, slideshow, talking-head-recut | all 21 published skills; committed |
| NVIDIA/SkillSpector (`skills/skill-inspector`) | skill-inspector | skill only; the scanner CLI is separate: `uv tool install git+https://github.com/NVIDIA/skillspector.git` |
| pbakaus/impeccable (`.claude/skills/impeccable`) | impeccable | skill only, no edit hooks; run `/impeccable init` |
| garrytan/gstack | ~50 skills (/office-hours, /review, /ship, /qa, /cso, ...) | not committed (1.6GB build); run `scripts/install-gstack.sh`. Browser skills need Chromium (`./setup` bootstrap) |
| bradautomates/claude-video | - | SKIPPED: `watch` already available as `anthropic-skills:watch` |

To scan any third-party skill before trusting it: `skillspector scan .claude/skills/<name> --no-llm`.

## Design system (project scope)
| Item | Location | Notes |
|---|---|---|
| design-system skill | `.claude/skills/design-system/` | Enforces `DESIGN.md` / `getdesign.md` tokens; wired in via `CLAUDE.md` |
| rohitg00/awesome-claude-design (MIT) | `design-reference/awesome-claude-design/` | Markdown only: 35 reference DESIGN.md files, prompts (incl. anti-slop), recipes |
| Token drift check | `scripts/check-tokens.mjs` (`npm run check:tokens`) | Compares `DESIGN.md` tokens with `src/index.css` |

Still not installed here (the auto-mode classifier blocked running external code): SkillSpector CLI, gstack. Run `scripts/install-gstack.sh` and `uv tool install git+https://github.com/NVIDIA/skillspector.git` yourself, or allow them.

## Added in the product-machine pass
| Item | Location |
|---|---|
| situation-router skill | `.claude/skills/situation-router/` |
| Theme generator (30 themes, 5 skipped for unparsable palettes) | `scripts/make-themes.mjs`, output `src/themes/` (see `REPORT.md`) |
| Trend radar config + run prompt | `radar/NICHES.md`, `radar/PROMPT.md`, reports in `radar/reports/` |
| Niche skill template | `products/niche-skill-template/` |
