<div align="center">

# Dotfiles

</div>

### Install.

```bash
BINDIR=~/.local/bin sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply nickcorin
```

### Manually applying changes.

```bash
# Retry package installation.
chezmoi apply

# Force reinstall all packages.
chezmoi apply --force
```
