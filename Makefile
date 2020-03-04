
OS := $(shell uname -s)

all: install clean sync_config 
	
install:
	@echo "Checking host OS.."
ifeq ("$(OS)","Darwin")
	@echo "MacOs detected.."
	@$(MAKE) install_darwin
else ifeq ($(OS),Linux)
	@echo "Linux detected.."
	DISTRO=$(uname -r)
	if [[ "$(DISTRO)"  == *"arch"* ]]
		then
		@$(MAKE) install_arch
	else
		@$(MAKE) install_linux
	fi
else
	@echo "OS $(OS) not supported."
endif

# Only works with Debian based distos.
# TODO: Add support for other distros - move arch makefile here.
install_linux:
	# TODO: Install minikube.
	# TODO: Install protobuf.
	# TODO: Install etcd.
	# TODO: Install stern.
	sudo apt-get update -y
	sudo apt-get install -y \
		apt-transport-https \
		autoconf \
		automake \
		awscli \
		bat \
		ca-certificates \
		curl \
		docker.io \
		etcd \
		ffmpeg \
		fzf \
		g++ \
		git \
		golang-go \
		htop \
		jq \
		kubectl \
		kubernetes \
		libtool \
		make \
		mysql-server \
		neovim \
		nodejs \
		python \
		software-properties-common \
		tmux \
		tree \
		vim \
		virtualbox \
		virtualbox-ext-pack \
		youtube-dl \
		zsh \
		zsh-autosuggestions \
		zsh-syntax-highlighting

	@echo "Insalling vim-plug.."
	@curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	
	@echo "Intalling Rust.."
	curl https://sh.rustup.rs -sSf | sh

install_darwin:
# Install / update homebrew.
ifeq ($(command -v brew),"") 
	@echo "Installing Homebrew.."
	@ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	@echo "Updating Homebrew.."
	@brew update
endif
	# Install all homebrew formulae.
	@echo "Installing Homebrew formulae.."
	@brew bundle

	# Vim-plug
	@echo "Insalling vim-plug.."
	@curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	@curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	@echo "Intalling Rust.."
	curl https://sh.rustup.rs -sSf | sh

sync_config:
	@echo "Creating configuration symlinks."
	@[ -f $(HOME)/.config/alacritty/alacritty.yml ] || ln -s $(PWD)/alacritty.yml $(HOME)/.config/alacritty/alacritty.yml
	@[ -f $(HOME)/.tmux.conf ] || ln -s $(PWD)/tmux.conf $(HOME)/.tmux.conf
	@[ -f $(HOME)/.vimrc ] || ln -s $(PWD)/vimrc $(HOME)/.vimrc
	@[ -d $(HOME)/.config/nvim ] || mkdir -p $(HOME)/.config/nvim
	@[ -f $(HOME)/.config/nvim/init.vim ] || ln -s $(PWD)/vimrc $(HOME)/.config/nvim/init.vim
	@[ -f $(HOME)/.zshrc ] || ln -s $(PWD)/zshrc $(HOME)/.zshrc

clean:
	@echo "Cleaning current configuration."
	@rm -f $(HOME)/.config/alacritty/alacritty.yml
	@rm -f $(HOME)/.tmux.conf
	@rm -f $(HOME)/.vimrc
	@rm -rf $(HOME)/.config/nvim
	@rm -f $(HOME)/.zshrc

.PHONY: all sync_config clean install install_darwin install_linux
