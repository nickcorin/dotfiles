# Load utility functions.
. "$DOTFILES_DIR/config/shell/scripts/utils.sh"

# Initialize zsh completion system.
autoload -Uz compinit
compinit -C

# Init tools.
. "$DOTFILES_DIR/config/git/init.sh"
. "$DOTFILES_DIR/config/homebrew/init.sh"
. "$DOTFILES_DIR/config/fzf/init.sh"
. "$DOTFILES_DIR/config/zoxide/init.sh"
. "$DOTFILES_DIR/config/private/context-manager.sh"
init_context

# Configure zsh.
setopt autocd
setopt auto_pushd
setopt extended_history
setopt histappend
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt long_list_jobs
# setopt no_beep
setopt pushd_ignore_dups
setopt share_history

# Aliases.
alias mommy="git"
alias please="sudo"
alias v="nvim"
alias vim="nvim"
alias vd="nvim $DOTFILES_DIR"
alias vo="vim $OBSIDIAN_VAULT_DIR"
alias refresh-context='. $DOTFILES_DIR/config/private/refresh-context.sh'
alias context-status='show_context_status'
alias refresh-contexts='refresh_context_config'

if is_installed eza; then
    alias ls="eza"
    alias ll="eza -a -l --git-repos  --no-permissions --no-user -o"
fi

# Interactive shell configuration
if is_interactive_shell; then
    # Autostart tmux.
    . "$DOTFILES_DIR/config/tmux/tmux_autostart.sh"
    # Enable starship.
    . "$DOTFILES_DIR/config/starship/init.sh"
fi
