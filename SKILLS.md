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
