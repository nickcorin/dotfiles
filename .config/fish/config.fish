
abbr -a please "sudo"
abbr -a code "open -a ~/applications/visual\ studio\ code.app"

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

# Environment variables.
set -x  EDITOR "vim"
set -x  GO111MODULE on
set -x  GOPATH "$HOME/dev/go"
set -x  PATH "$PATH:$GOPATH/bin"
set -x  PATH "$PATH:$HOME/.cargo/bin"
set -x  XDG_CONFIG_HOME "$HOME/.config"

# You may need to manually set your language environment
 set -x  LANG en_US.UTF-8
 set -x  LC_ALL en_US.UTF-8

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3

# Customise prompt.
function fish_prompt
	set_color brblack
	echo -n "["(date "+%H:%M")"] "
	set_color blue
	echo -n (hostname -s)
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color yellow
		printf '%s ' (prompt_pwd)
	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color red
	echo -n '| '
	set_color normal
end

# Check if there is a private zshrc to souce. Private zshrc files contain
# environment specific variables and functions that shouldn't be added to
# Git.
if test -e ~/.private.fish
	source ~/.private.fish
end
