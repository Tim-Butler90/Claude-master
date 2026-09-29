#!/usr/bin/env bash
# Installs gstack (garrytan/gstack) project-scoped into .claude/skills/gstack.
# Idempotent: skips if already installed. Needs git + bun.
set -euo pipefail
cd "$(dirname "$0")/.."
if [ -f .claude/skills/gstack/SKILL.md ]; then echo "gstack already installed - skipping"; exit 0; fi
mkdir -p .claude/skills
git clone --single-branch --depth 1 https://github.com/garrytan/gstack.git .claude/skills/gstack
rm -rf .claude/skills/gstack/.git
(cd .claude/skills/gstack && ./setup --host claude --no-prefix)
