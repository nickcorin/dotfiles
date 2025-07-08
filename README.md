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

# Manual installation from packages.yaml
~/.local/share/chezmoi/scripts/install-packages.sh
```

</div>

