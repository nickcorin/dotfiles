#!/bin/bash

# Default options.
OVERWRITE=0

# Defaults environment variables.
DOTFILES_DIR=${DOTFILES_DIR-"$HOME/dotfiles"}
XDG_CONFIG_HOME=${XDG_CONFIG_HOME-"$HOME/.config"}

# parse_flags sets the appropriate variables according to the flags provided.
function parse_flags {
	opts=$(getopt -o o --long overwrite: -- "$@")
	[ $? -eq 0 ] || {
		printf "Incorrect flag provided."
		exit 1
	}

	eval set -- "$opts"
	while true; do
		case "$1" in
		-o)
			OVERWRITE=1
			;;
		--overwrite)
			OVERWRITE=1
			;;
		--)
			shift
			break
			;;
		esac
		shift
	done
}


# install tries to detect the OS and calls the OS specific install script.
function install {
	# Use case insensitive matching.
	shopt -s nocasematch
	case "$(uname -s)" in 
		darwin) 	install_darwin ;; 
		linux)		install_linux ;; 
		*)		printf "Non-supported OS.\nExiting.."; exit 1	
	esac
}

# ensure_dir checks whether the directory tree exist, otherwise creates it.
function ensure_dir {
	[ -d $1 ] || {
		printf "Creating directory %s\n" $1
		mkdir -p $1
	}
}

# symlink creates a symlink between $1 and $2. By default, if the file exists
# then it not be overwritten. If the overwrite flag is set, then existing files
# will be renamed with the ".old" extension and a new file will be symlinked.
function symlink {
	ensure_dir $(dirname $2)
	if [ -e $2 ] && [ OVERWRITE == 1 ] ; then
		printf "%s exists, overwriting." $2
		mv $2 "$2.old"
	fi
	[ -e $2 ] || {
		printf "Creating symlink %s -> %s" $2 $1
		ln -s $1 $2
	}
}

function install_darwin {
	printf "Darwin detected.\n"
	
	# Install Homebrew, if required.
	command -v brew >/dev/null 2>&1 || {
		printf "Homebrew not installed, installing..\n";
			/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	}

	# Install git, if required.
	command -v git >/dev/null 2>&1 || {
		printf "git not installed, installing..\n";
		brew install git
	}
	
	# Clone the dotfiles repository. 
	ensure_dir $XDG_CONFIG_HOME	
	[ -d $DOTFILES_DIR ] || {
		ensure_dir $DOTFILES_DIR;
		git clone git@github.com:nickcorin/dotfiles.git $DOTFILES_DIR
	}
	
	# Install vim-plug.
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	# Install Rust.
	curl https://sh.rustup.rs -sSf | sh
	
	# Install brew packages.
	brew bundle --file="$DOTFILES_DIR/Brewfile"
	
	symlink "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
	symlink "$DOTFILES_DIR/.config/nvim/*" "$XDG_CONFIG_HOME/nvim/"
	symlink "$DOTFILES_DIR/.config/tmux/*" "$XDG_CONFIG_HOME/tmux/"
	symlink "$DOTFILES_DIR/.config/kitty/*" "$XDG_CONFIG_HOME/kitty/"
	symlink "$DOTFILES_DIR/.config/alacritty/*" "$XDG_CONFIG_HOME/alacritty/"
	
	exit 0
}

function install_linux {
	printf "Linux detected..\n"
	printf "Detecting distro..\n"

	local INSTALL_CMD=""
	local RELEASE=$(uname -r)
	if [[ "$RELEASE" == *"arch"* ]]; then
		printf "Arch Linux detected..\n"
		INSTALL_CMD="sudo pacman -Sy --noconfirm"
	else
		printf "Unsupported disribution '%s'..\nExiting." $RELEASE
		exit 0
	fi

	# Read in packages from file and install them.	
	readarray -t packages < packages.txt
	for package in ${packages[@]}; do
		eval $INSTALL_CMD $package
	done
	
	symlink "$DOTFILES_DIR/.config/alacritty/*" "$XDG_CONFIG_HOME/alacritty/"
	symlink "$DOTFILES_DIR/.config/i3/*" "$XDG_CONFIG_HOME/i3/"
	symlink "$DOTFILES_DIR/.config/kitty/*" "$XDG_CONFIG_HOME/kitty/"
	symlink "$DOTFILES_DIR/.config/picom/*" "$XDG_CONFIG_HOME/picom/"
	symlink "$DOTFILES_DIR/.config/polybar/*" "$XDG_CONFIG_HOME/polybar/"
	symlink "$DOTFILES_DIR/.config/nvim/*" "$XDG_CONFIG_HOME/nvim/"
	symlink "$DOTFILES_DIR/.config/rofi/*" "$XDG_CONFIG_HOME/rofi/"
	symlink "$DOTFILES_DIR/.config/tmux/*" "$XDG_CONFIG_HOME/tmux/"
	symlink "$DOTFILES_DIR/Xmodmap" "$HOME/.Xmodmap"
	symlink "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"

	exit 0
}

# Grab flags.
parse_flags $0 "$@"

# Call the install function.
install
