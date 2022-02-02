# Set default git credentials.
if command -v git > /dev/null
        git config --global user.name "Nick Corin"
        git config --global user.email "nickcorin@gmail.com"
end

# Use exa if it's available, but keep usage consistent either way.
if command -v exa > /dev/null
	abbr -a l 'exa'
	abbr -a ls 'exa'
	abbr -a ll 'exa -l'
	abbr -a lll 'exa -la'
else
	abbr -a l 'ls'
	abbr -a ll 'ls -l'
	abbr -a lll 'ls -la'
end

# You may need to manually set your language environment
set -g -x LANG en_US.UTF-8
set -g -x LC_ALL en_US.UTF-8

# Environment variables
set -g -x EDITOR "nvim"
set -g -x GO111MODULE on
set -g -x GOPATH "$HOME/dev/go"
set -g -x XDG_CONFIG_HOME "$HOME/.config"

# Setting up PATH
set -g -x PATH "$PATH:/opt/homebrew/bin"
set -g -x PATH "$PATH:$GOPATH/bin"
set -g -x PATH "$PATH:$HOME/.cargo/bin"

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3

function fish_prompt
	set_color brblack
	echo -n "["(date "+%H:%M")"] "
	set_color blue
	echo -n (hostname -s)
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color yellow
		echo -n (basename $PWD)
	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color red
	echo -n '| '
	set_color normal
end

function fish_greeting
end

# Start tmux when the shell opens.
if status is-interactive
    # Commands to run in interactive sessions can go here
	# builtin source ~/.config/fish/conf.d/base16.fish
	
	set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"

	# Always start tmux on start, but attach to the old session if it's still active.
	if ! set -q TMUX
		exec tmux new-session -As (hostname -s)
	end
end

# Exit tmux when the shell closes to prevent infinite tmux sessions from being started.
function on_exit --on-process-exit $fish_pid
	exec echo $fish_pid > ~/exited_session.txt
	exec tmux kill-session -t $fish_pid
end
