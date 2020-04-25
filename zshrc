#=====================================================
#===================== ZSH ===========================

export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="robbyrussell"

export ZSH_SYNTAX_DIR="/share/zsh-syntax-highlighting"
if [[ $(uname -s) == "Darwin" ]]; then
	export ZSH_SYNTAX_DIR="$(brew --prefix)$ZSH_SYNTAX_DIR"
elif [[ $(uname -s) == "Linux" ]]; then
	if [[ -d "/usr$ZSH_SYNTAX_DIR" ]]; then
		export ZSH_SYNTAX_DIR="/usr/$ZSH_SYNTAX_DIR"
	else
		export ZSH_SYNTAX_DIR="/usr/share/zsh/plugins/zsh-syntax-highlighting"
	fi
fi

plugins=(git)

export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=$ZSH_SYNTAX_DIR/highlighters
source $ZSH/oh-my-zsh.sh
source $ZSH_SYNTAX_DIR/zsh-syntax-highlighting.zsh

#=====================================================
#===================== Path ==========================

export PATH="/usr/local/opt:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"

#=====================================================
#===================== Go ============================

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export GO111MODULE=on

#=====================================================
#===================== Rust ==========================

export PATH="$HOME/.cargo/bin:$PATH"

#=====================================================
#===================== Fzf ===========================

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS="--no-mouse --height 50% -1 --reverse --multi --inline-info --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300' --preview-window='right:hidden:wrap' --bind='ctrl-o:execute(bat --style=numbers {} || less -f {}),ctrl-p:toggle-preview,ctrl-y:execute-silent(echo {+} | pbcopy)'"

#=====================================================
#===================== Aliases =======================

# Git
alias b="git branch"
alias co="git checkout"
alias com="git checkout master" 
alias pm="git pull origin master && git submodule update"
alias ll="ls -lG"
alias please="sudo"
alias code="open -a /Applications/Visual\ Studio\ Code.app"
alias mvim="open -a /Applications/Macvim.app"
alias vim="nvim"
alias tmux="tmux -f ~/.config/tmux/tmux.conf"

#=====================================================
#===================== Misc ==========================

export XDG_CONFIG_HOME=~/.config
export EDITOR=nvim
export KITTY_ENABLE_WAYLAND=1
export TERM=xterm

# This is needed for platform independent configuration files. Currently,
# only Kitty uses it, but it could be used more in the future.
export PLATFORM=$(uname -s | tr '[:upper:]' '[:lower:]')

# Terminal autocomplete.
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault

# Set locales to keep VIM happy.
export LC_ALL=en_US.UTF-8

[ -f ~/.zshrc.private ] && source ~/.zshrc.private
