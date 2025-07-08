# Dotfiles

My personal dotfiles managed with [chezmoi](https://chezmoi.io).

## Installation

Run this command on a new machine:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply nickcorin
```

This will:
1. Install chezmoi
2. Clone this repository
3. Apply all dotfiles to your home directory

## Manual Installation

If you prefer to install step by step:

```bash
# Install chezmoi
brew install chezmoi

# Initialize and apply dotfiles
chezmoi init --apply https://github.com/nickcorin/dotfiles.git
```

## Usage

- `cdot` - Edit dotfiles in nvim (applies changes on exit)
- `chezmoi diff` - See what would change
- `chezmoi apply` - Apply changes
- `chezmoi add <file>` - Add a new file to dotfiles