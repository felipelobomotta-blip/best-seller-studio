#!/usr/bin/env bash
set -euo pipefail

# Book Genesis installer for macOS/Linux.
# Installs full skill folders, including supporting references, to ~/.claude/.

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_DIR="$REPO_DIR/skills"
KNOWLEDGE_DIR="$REPO_DIR/knowledge"
AGENTS_DIR="$REPO_DIR/agents"
TARGET_SKILLS="$HOME/.claude/skills"
TARGET_KNOWLEDGE="$HOME/.claude/knowledge"
TARGET_AGENTS="$HOME/.claude/agents"

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo ""
echo -e "${BLUE}Book Genesis${NC}"
echo -e "${YELLOW}V4/V5 legacy system + portable Codex edition${NC}"
echo ""
echo -e "${YELLOW}Installing skills, supporting references, agents, and knowledge base${NC}"
echo ""

if [ ! -d "$SKILLS_DIR" ]; then
  echo -e "${RED}Error: skills/ directory not found. Run this script from the repository root.${NC}"
  exit 1
fi

mkdir -p "$TARGET_SKILLS" "$TARGET_KNOWLEDGE" "$TARGET_AGENTS"

count=0
for skill_dir in "$SKILLS_DIR"/*/; do
  skill_name=$(basename "$skill_dir")
  if [ -f "$skill_dir/SKILL.md" ]; then
    rm -rf "$TARGET_SKILLS/$skill_name"
    mkdir -p "$TARGET_SKILLS/$skill_name"
    cp -R "$skill_dir". "$TARGET_SKILLS/$skill_name/"
    echo -e "  ${GREEN}+${NC} $skill_name"
    count=$((count + 1))
  fi
done

kb_count=0
if [ -d "$KNOWLEDGE_DIR" ]; then
  for kb_file in "$KNOWLEDGE_DIR"/*.md; do
    if [ -f "$kb_file" ]; then
      cp "$kb_file" "$TARGET_KNOWLEDGE/"
      echo -e "  ${GREEN}+${NC} knowledge/$(basename "$kb_file")"
      kb_count=$((kb_count + 1))
    fi
  done
fi

agent_count=0
if [ -d "$AGENTS_DIR" ]; then
  for agent_file in "$AGENTS_DIR"/*.md; do
    if [ -f "$agent_file" ]; then
      cp "$agent_file" "$TARGET_AGENTS/"
      echo -e "  ${GREEN}+${NC} agent/$(basename "$agent_file")"
      agent_count=$((agent_count + 1))
    fi
  done
fi

echo ""
echo -e "${GREEN}Done.${NC} $count skills + $agent_count agents + $kb_count knowledge files installed"
echo ""
echo -e "Skills:    ${BLUE}$TARGET_SKILLS${NC}"
echo -e "Agents:    ${BLUE}$TARGET_AGENTS${NC}"
echo -e "Knowledge: ${BLUE}$TARGET_KNOWLEDGE${NC}"
echo ""
echo "Open Claude Code and type /book-genesis or /book-genesis-codex to start writing."
echo ""
