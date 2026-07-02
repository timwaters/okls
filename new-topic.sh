#!/bin/bash
# Usage: ./new-topic.sh "options trading"
# Creates a new topic directory from the template and substitutes the topic name.

set -e

if [ -z "$1" ]; then
  echo "Usage: ./new-topic.sh \"topic name\""
  exit 1
fi

TOPIC="$1"
SLUG=$(echo "$TOPIC" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd 'a-z0-9-')
DEST="./topics/$SLUG"
TEMPLATE="./_template"

if [ -d "$DEST" ]; then
  echo "✗ Topic '$SLUG' already exists at $DEST"
  exit 1
fi

mkdir -p "$DEST/sessions"

# Copy template files
for f in AGENTS.md TOOLS.md gaps.md learning-plan.md context.md; do
  cp "$TEMPLATE/$f" "$DEST/$f"
  sed -i "s/{{TOPIC}}/$TOPIC/g" "$DEST/$f"
done

# Copy skills structure and substitute topic
cp -r "$TEMPLATE/.opencode" "$DEST/"
cp "$TEMPLATE/.opencode/agent/admin.md" "$DEST/.opencode/agent/admin.md"
find "$DEST/.opencode" -name 'SKILL.md' -exec sed -i "s/{{TOPIC}}/$TOPIC/g" {} +

# Append to index
echo "- [$TOPIC](./$SLUG/) — started $(date +%Y-%m-%d)" >> ./topics/index.md

echo ""
echo "✓ Created: $DEST"
echo ""
echo "  Next steps:"
  echo "  cd $DEST && opencode"
echo ""
