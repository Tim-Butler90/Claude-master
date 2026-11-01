---
name: situation-router
description: Use at the start of any new task, or when unsure which skill, plugin or MCP to use. Matches the user's profile and the situation to the right installed tool, and says what to search for when nothing installed fits.
---

# Situation router

## Profile (edit this; it is the "who I am" input)
- Builds digital products and platforms and wants a second income stream that keeps working while the user is away.
- Wants trends and topics early, before they are saturated. Evidence over hype; cite sources.
- Prefers that Claude does the work and explains cost or blockers plainly. Wants a yes/no menu before big or recurring actions.
- Works in Claude Code (cloud) in this repo. Outbound installs of external code may be blocked by the permission classifier.

## Situation to tool
| Situation | Use |
|---|---|
| Any UI, component, page, CSS | `design-system` skill, then `impeccable` for critique and polish |
| Restyle / new look / themed kit | `npm run build:themes`, `design-reference/awesome-claude-design/` |
| "What should I build / is this niche growing" | `radar/PROMPT.md`, Firecrawl search; cite sources |
| Promo video, explainer, launch clip | `hyperframes` (router), then `product-launch-video` or `motion-graphics` |
| Slides / deck | `slideshow` (interactive) or `anthropic-skills:pptx` |
| Selling a skill or MCP | `products/niche-skill-template/` |
| Reviewing a third-party skill | `skill-inspector` |
| PDF / Word / Excel | the matching `adobe-for-creativity:*` or `anthropic-skills:*` skill |

## When nothing fits
1. Search before building: `SearchSkills` / `ListSkills` for skills, `SearchPlugins` for plugins, `SearchMcpRegistry` for MCP servers, `ToolSearch` for tools already connected but not loaded.
2. Prefer something already installed over adding new code. Installing new external code needs the user's approval.
3. Tell the user what was found and what it costs before enabling it.

## Limits
This is a routing table, not an auto-installer. It cannot know anything about the user beyond the profile above, so keep the profile current.
