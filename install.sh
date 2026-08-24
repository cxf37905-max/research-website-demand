#!/usr/bin/env bash
# Install the research-website-demand Codex skill into the local Codex skills directory.
#
# Default: global install into $CODEX_HOME/skills (CODEX_HOME defaults to ~/.codex).
# Use --dest to point at a different skills root, e.g. a project-local .codex/skills.
#
# Usage:
#   ./install.sh                       # global install
#   ./install.sh --dest .codex/skills  # project-local install
#   ./install.sh --force               # overwrite an existing install
set -euo pipefail

SKILL_NAME="research-website-demand"

# Directory containing this script (the repo/skill root).
SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

DEST_ROOT=""
FORCE=0
while [ $# -gt 0 ]; do
  case "$1" in
    --dest)
      DEST_ROOT="$2"
      shift 2
      ;;
    --force | -f)
      FORCE=1
      shift
      ;;
    -h | --help)
      echo "Usage: $0 [--dest <skills-root>] [--force]"
      echo ""
      echo "Installs the $SKILL_NAME skill."
      echo "  --dest <dir>  Skills root directory (default: \$CODEX_HOME/skills, i.e. ~/.codex/skills)"
      echo "  --force       Overwrite the skill if it already exists"
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      exit 1
      ;;
  esac
done

if [ -z "$DEST_ROOT" ]; then
  CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"
  DEST_ROOT="$CODEX_HOME/skills"
fi

DEST_DIR="$DEST_ROOT/$SKILL_NAME"

if [ -e "$DEST_DIR" ]; then
  if [ "$FORCE" -ne 1 ]; then
    echo "Destination already exists: $DEST_DIR" >&2
    echo "Re-run with --force to overwrite, or remove it first." >&2
    exit 1
  fi
  rm -rf "$DEST_DIR"
fi

mkdir -p "$DEST_DIR"

# Copy only skill content (SKILL.md + agents/ + references/), keeping the installed
# skill directory clean of repo-only files such as README.md, .git, and install.sh.
for item in SKILL.md agents references; do
  if [ -e "$SRC_DIR/$item" ]; then
    cp -R "$SRC_DIR/$item" "$DEST_DIR/"
  fi
done

echo "Installed $SKILL_NAME -> $DEST_DIR"
echo "Codex discovers it automatically on the next turn."
echo "Invoke it with: \$research-website-demand"
