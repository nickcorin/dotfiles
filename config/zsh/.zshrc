# Load utility functions.
. "$DOTFILES_PATH/config/shell/scripts/utils.sh"

# Initialize zsh completion system.
autoload -Uz compinit
compinit -C

# Init tools.
. "$DOTFILES_PATH/config/git/init.sh"
. "$DOTFILES_PATH/config/homebrew/init.sh"
. "$DOTFILES_PATH/config/fzf/init.sh"
. "$DOTFILES_PATH/config/zoxide/init.sh"
. "$DOTFILES_PATH/config/private/context-manager.sh"
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
alias vd="nvim $DOTFILES_PATH"
alias vo="vim $OBSIDIAN_VAULT_DIR"
alias refresh-context='. $DOTFILES_PATH/config/private/refresh-context.sh'
alias context-status='show_context_status'
alias refresh-contexts='refresh_context_config'

if is_installed eza; then
    alias ls="eza"
    alias ll="eza -a -l --git-repos  --no-permissions --no-user -o"
fi

# Interactive shell configuration
if is_interactive_shell; then
    # Autostart tmux.
    . "$DOTFILES_PATH/config/tmux/tmux_autostart.sh"
    # Enable starship.
    . "$DOTFILES_PATH/config/starship/init.sh"
fi

# bun completions
[ -s "/Users/nick/.bun/_bun" ] && source "/Users/nick/.bun/_bun"
