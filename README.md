<div align="center">

# Dotfiles

## Install.

```bash
BINDIR=/usr/local/bin sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply nickcorin
```

## Manually applying changes.

```bash
# Retry package installation
chezmoi apply

# Force reinstall all packages
chezmoi apply --force
```

</div>
