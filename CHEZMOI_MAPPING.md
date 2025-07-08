# Chezmoi Structure Mapping

This shows how your current files map to chezmoi's naming convention:

## Current → Chezmoi

```
config/git/                    → dot_config/git/
config/nvim/                   → dot_config/nvim/
config/starship/               → dot_config/starship/
config/tmux/tmux.conf          → dot_tmux.conf
config/zsh/.zshrc              → dot_zshrc
config/zsh/.zshenv             → dot_zshenv
config/alacritty/              → dot_config/alacritty/
config/ghostty/                → dot_config/ghostty/
```

## SSH Config (with 1Password)

```
# Create: private_dot_ssh/private_config
Host *
    IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
```

## Git Config Template (if you want machine-specific values)

```
# dot_config/git/config.tmpl
[user]
    name = {{ .name }}
    email = {{ .email }}
# ... rest of your git config
```

## Using 1Password in Templates

```
# Example: dot_config/some-app/config.tmpl
api_key = {{ onepassword "op://Personal/SomeApp/api_key" }}
```

## Commands to migrate

```bash
# Initialize chezmoi with your repo
chezmoi init https://github.com/nickcorin/dotfiles.git

# See what would change
chezmoi diff

# Apply changes
chezmoi apply

# Daily workflow
chezmoi update  # pull and apply latest changes
```