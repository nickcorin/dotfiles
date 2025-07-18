#!/bin/bash
set -e

# Compile AGENTS.md in the deployed location only
OPENCODE_DIR="$HOME/.config/opencode"
OUTPUT_FILE="$OPENCODE_DIR/AGENTS.md"

echo "📝 Compiling AGENTS.md from numbered instruction files..."

cd "$OPENCODE_DIR"

# Create temporary file
temp_file=$(mktemp)

# Find all numbered .md files and sort them
numbered_files=$(find . -name "[0-9][0-9][0-9][0-9]-*.md" | sort)

if [ -z "$numbered_files" ]; then
    echo "⚠️  No numbered instruction files found"
    exit 0
fi

# Combine all numbered files
for file in $numbered_files; do
    echo "📄 Including: $file"
    cat "$file" >> "$temp_file"
    echo -e "\n" >> "$temp_file"
done

# Move to final location
mv "$temp_file" "$OUTPUT_FILE"
echo "✅ Compiled AGENTS.md in deployed location"