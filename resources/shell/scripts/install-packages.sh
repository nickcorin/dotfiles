#!/bin/bash

# Generic package installer script
# Usage: install-packages.sh <installer_type> <package_count> [packages...]
#
# installer_type: homebrew, npm, direct
# package_count: number of packages to install
# packages: list of packages or commands to execute

set -e

INSTALLER_TYPE="$1"
PACKAGE_COUNT="$2"
shift 2
PACKAGES=("$@")

if [ -z "$INSTALLER_TYPE" ] || [ -z "$PACKAGE_COUNT" ]; then
    echo "Usage: $0 <installer_type> <package_count> [packages...]"
    exit 1
fi

# Set installer-specific variables
case "$INSTALLER_TYPE" in
    "homebrew")
        INSTALLER_NAME="Homebrew packages"
        INSTALLER_EMOJI="🍺"
        ;;
    "npm")
        INSTALLER_NAME="npm packages"
        INSTALLER_EMOJI="📦"
        ;;
    "direct")
        INSTALLER_NAME="direct install tools"
        INSTALLER_EMOJI="🔧"
        ;;
    *)
        echo "Unknown installer type: $INSTALLER_TYPE"
        exit 1
        ;;
esac

echo "$INSTALLER_EMOJI Found $PACKAGE_COUNT $INSTALLER_NAME to install"

# Check if we're in an interactive terminal
if [ -t 0 ]; then
    echo ""
    read -p "Install all $INSTALLER_NAME? [y/N] " -n 1 -r
    echo ""
    
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Skipping $INSTALLER_NAME installation"
        exit 0
    fi
else
    echo "$INSTALLER_EMOJI Running in non-interactive mode, installing $INSTALLER_NAME..."
fi

echo "$INSTALLER_EMOJI Installing $INSTALLER_NAME..."

# Execute installer-specific logic
case "$INSTALLER_TYPE" in
    "homebrew")
        # For Homebrew, we expect the packages to be passed as a single Brewfile content
        echo "${PACKAGES[0]}" | brew bundle --file=/dev/stdin
        ;;
    "npm")
        # Check if npm is available
        if ! command -v npm &> /dev/null; then
            echo "❌ npm not found. Please install Node.js first."
            exit 1
        fi
        
        # Install each package globally
        for package in "${PACKAGES[@]}"; do
            echo "Installing $package..."
            npm install -g "$package"
        done
        ;;
    "direct")
        # Execute each command directly
        for command in "${PACKAGES[@]}"; do
            echo "Executing: $command"
            eval "$command"
        done
        ;;
esac

echo "✅ $INSTALLER_NAME installation complete!"