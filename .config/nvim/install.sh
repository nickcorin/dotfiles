#!/bin/bash

# Default dotfiles directory.
DOTFILES_DIR=${DOTFILES_DIR-"$HOME/dotfiles"}

clone_dotfiles() { 
	if [[ ! -d "$DOTFILES_DIR" ]]
	[ ! -d $HOME/dotfiles ] || 
		\ printf "\"$HOME/dotfiles\" already exists. Remove it and try again." &&
		\ exit 1;

	git clone https://github.com/nickcorin/dotfiles.git $HOME/dotfiles
}

install_brew() { 
	printf "Installing brew.."
}

install_neovim() { 
	printf "Installing neovim.."
}

install_pip() { 
	printf "Installing pip3.."
}

install_pynvim() {
	printf "Installing pynvim.."
}

install_node() {
	printf "Installing node.."
}

function install() {
	shopt -s nocasematch
	case "$(uname -s)" in
		darwin) install_darwin $1 ;;
		linux) 	install_linux  $1 ;;
		*) 		printf "No idea what OS you're on.. exiting."; exit 1
	esac
}

function install_darwin() {
	brew install $1
}

function install_linux() {
	sudo apt install $1
}


printf "Installing NVIM++"

if [[ "$(uname)" == "Darwin" ]] ; then
	if [[ $(which brew) > /dev/null ]] ; then
		printf "brew is installed, moving on.."
	fi
fi

# Check that Neovim is installed.
which nvim > /dev/null && printf "neovim is installed, moving on.." ||
	\ install_neovim()

# Check that pip3 is installed.
which pip3 > /dev/null && printf "pip3 is installed, moving on.." ||
	\ install_neovim()

# Check that node is installed.
which node > /dev/null && printf "node is installed, moving on.." ||
	\ install_node()

# Check that pynvim is installed.
pip3 list | grep pynvim > /dev/null && printf "pynvim is installed, moving on.."
	\ || install_pynvim()


