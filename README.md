<div align="center">

# ✨ dotfiles ✨

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply nickcorin
```

### Package Installation Issues?

```bash
# Retry package installation
chezmoi apply

# Force reinstall all packages
chezmoi apply --force

# Manual installation with Brewfile
brew bundle install --file=~/.local/share/chezmoi/.chezmoidata/Brewfile
```

</div>

