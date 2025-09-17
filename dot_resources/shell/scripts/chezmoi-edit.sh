#!/bin/sh

# Edit entire chezmoi repository with nvim and apply changes

chezmoi_edit_repo() {
    # Save current directory
    local prev_dir="$(pwd)"
    
    # Get chezmoi source path
    local source_path="$(chezmoi source-path)"
    
    # Change to source directory and open nvim
    cd "$source_path" && nvim .
    
    # Apply changes after exiting nvim
    chezmoi apply
    
    # Return to previous directory
    cd "$prev_dir"
}

# Create alias
alias cdot='chezmoi_edit_repo'