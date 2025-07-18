#!/bin/bash

set -e

# Setup zathura plugins
# This script links zathura plugins after installation

if command -v zathura >/dev/null 2>&1; then
    echo "🔗 Setting up zathura plugins..."
    
    # Create plugin directory
    mkdir -p "$(brew --prefix zathura)/lib/zathura"
    
    # Link PDF plugin if available
    if brew list zathura-pdf-mupdf >/dev/null 2>&1; then
        ln -sf "$(brew --prefix zathura-pdf-mupdf)/libpdf-mupdf.dylib" "$(brew --prefix zathura)/lib/zathura/libpdf-mupdf.dylib"
        echo "✅ Linked PDF plugin"
    fi
    
    # Link DjVu plugin if available
    if brew list zathura-djvu >/dev/null 2>&1; then
        ln -sf "$(brew --prefix zathura-djvu)/libdjvu.dylib" "$(brew --prefix zathura)/lib/zathura/libdjvu.dylib"
        echo "✅ Linked DjVu plugin"
    fi
    
    echo "🎉 Zathura plugins setup complete!"
else
    echo "⚠️  Zathura not found, skipping plugin setup"
fi