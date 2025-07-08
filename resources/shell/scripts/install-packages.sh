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

# Check what actually needs to be installed
NEEDS_INSTALL=()
case "$INSTALLER_TYPE" in
    "homebrew")
        # For Homebrew, use brew bundle check to see what's needed
        echo "$INSTALLER_EMOJI Checking which packages need installation..."
        if echo "${PACKAGES[0]}" | brew bundle check --file=/dev/stdin > /dev/null 2>&1; then
            echo "$INSTALLER_EMOJI All Homebrew packages are already installed!"
            exit 0
        fi
        # Let brew bundle handle the actual checking and installation
        ;;
    "npm")
        # Check which npm packages are not installed
        if command -v npm &> /dev/null; then
            for package in "${PACKAGES[@]}"; do
                if ! npm list -g "$package" &> /dev/null; then
                    NEEDS_INSTALL+=("$package")
                fi
            done
        else
            NEEDS_INSTALL=("${PACKAGES[@]}")
        fi
        PACKAGE_COUNT=${#NEEDS_INSTALL[@]}
        ;;
    "direct")
        # For direct installs, we can't easily check, so assume all are needed
        NEEDS_INSTALL=("${PACKAGES[@]}")
        PACKAGE_COUNT=${#NEEDS_INSTALL[@]}
        ;;
esac

if [ "$PACKAGE_COUNT" -eq 0 ] && [ "$INSTALLER_TYPE" != "homebrew" ]; then
    echo "$INSTALLER_EMOJI All $INSTALLER_NAME are already installed!"
    exit 0
fi

if [ "$INSTALLER_TYPE" = "homebrew" ]; then
    echo "$INSTALLER_EMOJI Some Homebrew packages need installation"
else
    echo "$INSTALLER_EMOJI Found $PACKAGE_COUNT $INSTALLER_NAME to install"
fi

# Check if we're in an interactive terminal
if [ -t 0 ]; then
    echo ""
    read -p "Install $INSTALLER_NAME? [y/N] " -n 1 -r
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
        
        # Install only packages that need installation
        for package in "${NEEDS_INSTALL[@]}"; do
            echo "Installing $package..."
            npm install -g "$package"
        done
        ;;
    "direct")
        # Execute each command directly
        for command in "${NEEDS_INSTALL[@]}"; do
            echo "Executing: $command"
            eval "$command"
        done
        ;;
esac

echo "✅ $INSTALLER_NAME installation complete!"