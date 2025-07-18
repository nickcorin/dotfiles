#!/bin/bash

# Compile AGENTS.md from numbered instruction files
# Run this script manually when you update the numbered files

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_FILE="$SCRIPT_DIR/AGENTS.md"

echo "📝 Compiling AGENTS.md from numbered instruction files..."

cd "$SCRIPT_DIR"

# Create temporary file
temp_file=$(mktemp)

# Find all numbered .md files and sort them
numbered_files=$(find . -name "[0-9][0-9][0-9][0-9]-*.md" | sort)

if [ -z "$numbered_files" ]; then
    echo "⚠️  No numbered instruction files found (####-*.md)"
    exit 0
fi

# Combine all numbered files
for file in $numbered_files; do
    echo "📄 Including: $file"
    cat "$file" >> "$temp_file"
    echo "" >> "$temp_file"  # Add blank line between files
    echo "" >> "$temp_file"
done

# Move processed file to final location
mv "$temp_file" "$OUTPUT_FILE"

echo "✅ Generated $OUTPUT_FILE from numbered instruction files"
echo "📌 Remember to commit the updated AGENTS.md file!"