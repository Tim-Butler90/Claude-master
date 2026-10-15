#!/usr/bin/env bash
# Mac setup for Claude power tools. Run on YOUR Mac in Terminal:  bash setup-mac.sh
# Safe to re-run. Each step prints OK / SKIP / FAIL and the script keeps going.
# Nothing is piped into bash, and nothing uses sudo.

set -u
VENV="$HOME/.claude-tools-venv"
LOG="$HOME/claude-setup-$(date +%Y%m%d-%H%M%S).log"
PASS=(); FAIL=(); SKIP=()
exec > >(tee -a "$LOG") 2>&1

say()  { printf '\n\033[1m== %s ==\033[0m\n%s\n' "$1" "$2"; }
ok()   { PASS+=("$1"); echo "OK:   $1"; }
bad()  { FAIL+=("$1"); echo "FAIL: $1"; }
skip() { SKIP+=("$1"); echo "SKIP: $1"; }
have() { command -v "$1" >/dev/null 2>&1; }

[ "$(uname -s)" = "Darwin" ] || { echo "This script is for macOS only."; exit 1; }

# ---------------------------------------------------------------- 1. Homebrew
say "1. Homebrew" "Homebrew is the Mac app installer the other steps use."
if [ -x /opt/homebrew/bin/brew ]; then eval "$(/opt/homebrew/bin/brew shellenv)"; fi
if [ -x /usr/local/bin/brew ]; then eval "$(/usr/local/bin/brew shellenv)"; fi
if have brew; then
  ok "Homebrew installed ($(brew --version | head -1))"
else
  echo "Homebrew is missing. Install it from https://brew.sh (copy the one command"
  echo "shown there into Terminal), then run this script again."
  exit 1
fi

# ---------------------------------------------------------------- 2. CC Switch
say "2. CC Switch" "Installs the CC Switch app (no tap needed; the cask is in Homebrew already)."
if [ -d "/Applications/CC Switch.app" ]; then
  skip "CC Switch already in /Applications"
elif brew install --cask cc-switch; then
  if ls /Applications | grep -qi 'cc.switch'; then ok "CC Switch is in /Applications"; else bad "CC Switch installed but app not found in /Applications"; fi
else
  bad "brew install --cask cc-switch"
fi

# ------------------------------------------------- 3. Python tools in a venv
say "3. Crawl4AI + Browser Use" "Installs into a private Python environment at $VENV so nothing else on your Mac is touched."
PY=$(command -v python3.12 || command -v python3.11 || command -v python3)
if [ -z "$PY" ]; then
  brew install python@3.12 && PY=$(brew --prefix python@3.12)/bin/python3.12
fi
if [ -n "${PY:-}" ] && [ ! -d "$VENV" ]; then "$PY" -m venv "$VENV"; fi
if [ -x "$VENV/bin/pip" ]; then
  "$VENV/bin/pip" install --upgrade pip >/dev/null
  if "$VENV/bin/pip" install crawl4ai browser-use; then
    ok "crawl4ai + browser-use pip packages"
    "$VENV/bin/crawl4ai-setup" && ok "crawl4ai browser setup" || bad "crawl4ai-setup"
    "$VENV/bin/playwright" install chromium && ok "Playwright Chromium" || bad "playwright install chromium"
    "$VENV/bin/python" -c "import crawl4ai, browser_use" && ok "import check" || bad "import check"
  else
    bad "pip install crawl4ai browser-use"
  fi
else
  bad "could not create Python environment"
fi

# ---------------------------------------------------------------- 4. Agent-Reach
say "4. Agent-Reach" "The install link you gave is a text guide for an AI, not a script, so piping it to bash would do nothing useful. Installing the package directly with pipx instead."
have pipx || brew install pipx
if have pipx; then
  pipx ensurepath >/dev/null
  if pipx install https://github.com/Panniantong/agent-reach/archive/main.zip; then
    ok "agent-reach installed"
    export PATH="$HOME/.local/bin:$PATH"
    agent-reach install --env=auto && ok "agent-reach install --env=auto" || bad "agent-reach install"
    agent-reach doctor && ok "agent-reach doctor" || bad "agent-reach doctor (see output above)"
  else
    bad "pipx install agent-reach"
  fi
else
  bad "pipx unavailable"
fi
echo "Note: this uses the project's moving 'main' branch. Social logins/cookies are NOT set up; do that yourself later with a throwaway account."

# ------------------------------------------------- 5. Headroom + Netdata
say "5. Headroom + Netdata" "Headroom shrinks big tool outputs before they reach Claude. Netdata is a live system monitor."
if [ -x "$VENV/bin/pip" ] && "$VENV/bin/pip" install "headroom-ai[mcp]"; then
  ok "headroom-ai[mcp] installed"
else
  bad "headroom-ai install"
fi
if brew list netdata >/dev/null 2>&1 || brew install netdata; then
  ok "Netdata installed (start with: brew services start netdata, view at http://localhost:19999)"
else
  bad "brew install netdata"
fi

# ------------------------------------------------- 6. Paperclip + LobeHub
say "6. Paperclip + LobeHub" "Paperclip needs Node.js. LobeHub needs Docker Desktop. This step only prepares them; you start them yourself."
have node || brew install node
if have node && [ "$(node -p 'process.versions.node.split(".")[0]')" -ge 20 ]; then
  ok "Node.js $(node -v) ready for Paperclip. Start it later with: npx paperclipai onboard --yes  (opens http://localhost:3100)"
else
  bad "Node 20+ needed for Paperclip"
fi
if have docker; then
  ok "Docker present. LobeHub: follow https://lobehub.com/docs/self-hosting/start (needs several containers)"
else
  skip "Docker Desktop not installed. For LobeHub run: brew install --cask docker  then open Docker once"
fi

# ---------------------------------------------------------------- 7. MCP wiring
say "7. Connect to Claude" "Registers MCP servers with the 'claude' command. Only tools that really speak MCP are wired."
if have claude; then
  cp -n "$HOME/.claude.json" "$HOME/.claude.json.backup-before-setup" 2>/dev/null
  claude mcp add --scope user browser-use -- uvx --from "browser-use[cli]" browser-use --mcp \
    && ok "MCP: browser-use" || bad "MCP: browser-use"
  "$VENV/bin/headroom" mcp install && ok "MCP: headroom" || bad "MCP: headroom"
  claude mcp list
else
  skip "'claude' command not found; install Claude Code, then re-run this script"
fi

# ---------------------------------------------------------------- Summary
say "SUMMARY" "Log saved to $LOG"
printf 'OK (%d):\n' "${#PASS[@]}";   printf '  - %s\n' "${PASS[@]:-none}"
printf 'SKIPPED (%d):\n' "${#SKIP[@]}"; printf '  - %s\n' "${SKIP[@]:-none}"
printf 'FAILED (%d):\n' "${#FAIL[@]}"; printf '  - %s\n' "${FAIL[@]:-none}"
cat <<EOF

Three quick tests:
  1. $VENV/bin/python -c "import crawl4ai; print('crawl4ai ok')"
  2. agent-reach doctor
  3. open http://localhost:19999   (after: brew services start netdata)
If anything FAILED, paste the summary above to Claude.
EOF
