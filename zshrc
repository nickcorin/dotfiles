# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR="vim"
export GO111MODULE=on
export GOPATH="$HOME/dev/go"
export KITTY_CONFIG_DIRECTORY="$XDG_CONFIG_HOME/kitty"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export XDG_CONFIG_HOME="$HOME/.config"

# You may need to manually set your language environment
 export LANG=en_US.UTF-8
 export LC_ALL=en_US.UTF-8

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias code="open -a ~/Applications/Visual\ Studio\ Code.app"

# Use exa if its available, but keep usage consistent either way.
if command -v exa > /dev/null; then
	alias l="exa"
	alias ls="exa"
	alias ll="exa -l"
	alias lll="exa -la"
	alias please="sudo"
else
	alias l="ls"
	alias ll="ls -l"
	alias lll="ls -la"
fi

# Configure PROMPT.
export PROMPT="%F{grey}[$(date +%H:%M)] %F{blue}%m%F{black}:%F{yellow}%1~%F{red} | %f"

# Check if there is a private zshrc to souce. Private zshrc files contain
# environment specific variables and functions that shouldn't be added to
# Git.
[ -f ~/.zshrc.private ] && source ~/.zshrc.private

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/opt/llvm/bin:$PATH"
