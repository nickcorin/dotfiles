export EDITOR="vim"
export GOPATH="$HOME/dev/go"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

plugins=(git tmux)

ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_AUTOSTART_ONCE="true"
ZSH_TMUX_AUTOCONNECT="true"

source $ZSH/oh-my-zsh.sh

# User configuration
if command -v bat > /dev/null; then
    export GH_PAGER=bat
else
    export GH_PAGER=cat
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# You may need to manually set your language environment
 export LANG=en_US.UTF-8
 export LC_ALL=en_US.UTF-8

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias code="open -a ~/Applications/Visual\ Studio\ Code.app"

if command -v nvim > /dev/null; then
	alias vim=nvim
fi 

# Use exa if its available, but keep usage consistent either way.
if command -v exa > /dev/null; then
	alias l="exa"
	alias ls="exa"
	alias ll="exa -l"
	alias lll="exa -la"
else
	alias l="ls"
	alias ll="ls -l"
	alias lll="ls -la"
fi

# It's just funny.
alias please="sudo"

# Set default git credentials.
if command -v git > /dev/null; then
	git config --global user.name "Nick Corin"
	git config --global user.email "nickcorin@gmail.com"

    if command -v bat > /dev/null; then
	    git config --global core.pager "bat"
    else
        git config --global core.pager "cat"
    fi
fi

# This is for MacOS ARM architectures.
if command -v brew > /dev/null; then
	alias brew="arch -arm64 brew"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/opt/llvm/bin:$PATH"

# Enable plugins manually because they're installed with brew.
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Source all files in the ~/.zshrc.d directory. These files contain
# environment specific variables and functions that shouldn't be added to
# Git, or at least in a private submodule.
for file in ~/.zshrc.d/*; do
    [ -f "$file" ] && source "$file"
done

