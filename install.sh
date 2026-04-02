#!/usr/bin/env bash
set -euo pipefail

# Book Genesis V4 — Installer for macOS/Linux
# Installs 14 active skills + 5 deprecated + 1 agent + knowledge base to ~/.claude/

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
echo -e "${BLUE}  ____              _      ____                      _     ${NC}"
echo -e "${BLUE} | __ )  ___   ___ | | __ / ___| ___ _ __   ___  ___(_)___ ${NC}"
echo -e "${BLUE} |  _ \\ / _ \\ / _ \\| |/ /| |  _ / _ \\ '_ \\ / _ \\/ __| / __|${NC}"
echo -e "${BLUE} | |_) | (_) | (_) |   < | |_| |  __/ | | |  __/\\__ \\ \\__ \\${NC}"
echo -e "${BLUE} |____/ \\___/ \\___/|_|\\_\\ \\____|\\___|_| |_|\\___||___/_|___/${NC}"
echo -e "${YELLOW}                          V4 — Genesis Score V3.7${NC}"
echo ""
echo -e "${YELLOW}Installing 14 active skills + 5 deprecated + 1 agent + knowledge base${NC}"
echo ""

# Check that skills directory exists
if [ ! -d "$SKILLS_DIR" ]; then
  echo -e "${RED}Error: skills/ directory not found. Run this script from the book-genesis repository root.${NC}"
  exit 1
fi

# Create target directories
mkdir -p "$TARGET_SKILLS"
mkdir -p "$TARGET_KNOWLEDGE"
mkdir -p "$TARGET_AGENTS"

# Copy each skill
count=0
for skill_dir in "$SKILLS_DIR"/*/; do
  skill_name=$(basename "$skill_dir")
  if [ -f "$skill_dir/SKILL.md" ]; then
    mkdir -p "$TARGET_SKILLS/$skill_name"
    cp "$skill_dir/SKILL.md" "$TARGET_SKILLS/$skill_name/SKILL.md"
    echo -e "  ${GREEN}+${NC} $skill_name"
    count=$((count + 1))
  fi
done

echo ""

# Copy knowledge base
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

# Copy agents
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
echo -e "${GREEN}Done!${NC} $count skills + $agent_count agents + $kb_count knowledge files installed"
echo ""
echo -e "Skills:    ${BLUE}$TARGET_SKILLS${NC}"
echo -e "Agents:    ${BLUE}$TARGET_AGENTS${NC}"
echo -e "Knowledge: ${BLUE}$TARGET_KNOWLEDGE${NC}"
echo ""
echo "Open Claude Code and type /book-genesis to start writing."
echo ""
