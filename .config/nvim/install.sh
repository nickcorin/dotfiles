#!/bin/bash
#
# An all-in-one install script for my personal development environment. It is
# somewhat OS agnostic but not entirely - it does a quick check for Darwin vs
# Linux but not for any specific distributions for now (Ubuntu-based distros
# are assumed).

# The list of programs to install.
dependencies=(
	"git"
	"nvim"
	"ripgrep"
	"tmux"
)

# Default dotfiles directory.
DOTFILES_DIR=${DOTFILES_DIR-"$HOME/dotfiles"}

###############################################################################
# Installs the missing dependencies.
# Globals:
# 	dependencies
# Arguments:
# 	None
###############################################################################
install_dependencies() {
	missing_deps=()
	for dep in "${dependencies[@]}"; do
		if ! is_installed "$dep"; then
			missing_deps+=("$dep")
		fi
	done

	if [[ "${#missing_deps[@]}" -eq 0 ]]; then
		printf "It looks like you've already got everything installed.\n"
	else
		printf "\nI've detected ${#missing_deps[@]} missing dependencies.\n"
		read -p "Would you like me to install them now? (Y/n): " answer
		case $answer in
			[Nn]* )
				printf "\nOkay, we don't have to do it now.\n"
				printf "Let me know when you're ready. :)\n"
				exit 0
				;;
			*)
				printf "Okay, let's do it.\n"
				for dep in "${missing_deps[@]}"; do
					install "$dep"
				done
				;;
		esac
	fi
}

###############################################################################
# Clone the Git repository containing the necessary configuration files for the
# various programs we will install.
# Globals:
#   DOTFILES_DIR
# Arguments:
#   None
###############################################################################
clone_dotfiles() { 
	if [[ -d "$DOTFILES_DIR" ]]; then
	  err "\"$HOME/dotfiles\" already exists. Remove it and try again."
	  exit 1
	else
	  git clone https://github.com/nickcorin/dotfiles.git $HOME/dotfiles
	fi
}

###############################################################################
# Print an error string to stderr.
# Globals:
# 	None
# Arguments:
# 	The error string.
###############################################################################
err() {
	echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&2
}

###############################################################################
# Check whether a program is installed.
# Globals:
# 	None
# Arguments:
#		Program to check, a command.
# Returns:
# 	0 if the program is installed, 1 if it is not.
###############################################################################
is_installed() {
	printf "checking if $1 is installed.."
	if ! command -v "$1" &> /dev/null; then
		printf "no\n"
		false
	else
		printf "yes\n"
		true
	fi
}

###############################################################################
# Install a program using the default package manager.
# Globals:
# 	None
# Arguments:
# 	Program to install.
###############################################################################
install() {
	printf "Installing $1.."
	shopt -s nocasematch
	case "$(uname -s)" in
		linux)
			install_linux  $1
			;;
		*)
			err "I'm sorry, I can only work with Ubuntu-base linux distributions"
			err "I apologize for the inconvenience."
			exit 1
			;;
	esac
}

###############################################################################
# Install a program using apt.
# Globals:
# 	None
# Arguments:
# 	Program to install.
###############################################################################
install_linux() {
	sudo apt install -y $1
}

printf "Hi there, it's good to have you back.\n"
printf "Let's get your development setup ready for you.\n"
printf "\n"

if ! install_dependencies; then
	exit 1
fi

printf "\nIt looks like we're all done here.\n"
printf "Happy hacking!\n"
