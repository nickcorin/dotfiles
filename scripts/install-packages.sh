#!/bin/bash
# Manual package installation script
# This reads packages.yaml and installs everything

set -euo pipefail

PACKAGES_FILE="${1:-$HOME/.local/share/chezmoi/.chezmoidata/packages.yaml}"

if [[ ! -f "$PACKAGES_FILE" ]]; then
    echo "Error: packages.yaml not found at $PACKAGES_FILE"
    exit 1
fi

echo "📦 Installing packages from $PACKAGES_FILE"

# Extract and install taps
echo "🚰 Installing taps..."
yq eval '.taps[]' "$PACKAGES_FILE" 2>/dev/null | while read -r tap; do
    if ! brew tap | grep -q "^$tap$"; then
        echo "  → Adding tap $tap"
        brew tap "$tap"
    fi
done

# Extract and install brews
echo "📦 Installing CLI tools..."
yq eval '.brews[]' "$PACKAGES_FILE" 2>/dev/null | while read -r pkg; do
    if ! command -v "$pkg" &>/dev/null && ! brew list "$pkg" &>/dev/null 2>&1; then
        echo "  → Installing $pkg"
        brew install "$pkg"
    fi
done

# Extract and install casks
echo "💻 Installing applications..."
yq eval '.casks[]' "$PACKAGES_FILE" 2>/dev/null | while read -r pkg; do
    if ! brew list --cask "$pkg" &>/dev/null 2>&1; then
        echo "  → Installing $pkg"
        brew install --cask "$pkg"
    fi
done

echo "✅ Package installation complete!"