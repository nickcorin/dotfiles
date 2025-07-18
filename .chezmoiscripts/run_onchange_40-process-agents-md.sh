#!/bin/bash

set -e

# Process AGENTS.md from numbered instruction files
# This script compiles all numbered .md files into a single AGENTS.md

DOTFILES_DIR="$(chezmoi source-path)"
OPENCODE_DIR="$DOTFILES_DIR/dot_config/opencode"
OUTPUT_FILE="$OPENCODE_DIR/AGENTS.md"

echo "📝 Compiling AGENTS.md from numbered instruction files..."

# Change to opencode directory
cd "$OPENCODE_DIR"

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