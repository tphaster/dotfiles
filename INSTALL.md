# New system setup

## Install packages
	$ sudo apt install \
		aptitude btop curl git gitg htop mc most net-tools tmux tree vim
	$ sudo apt install \
		cowsay fortunes sl
	$ sudo apt install \
		automake build-essential ca-certificates cmake cmake-qt-gui libtool ninja-build pkg-config
	$ sudo apt install \
		python3-dev python3-pip python3-setuptools python3-venv
	$ sudo apt install \
		clang clang-format clang-tidy cppcheck doxygen lcov universal-ctags valgrind
	$ pip install black compiledb scons

## Install packages for Neovim and LazyVim
	$ sudo apt install \
    fd-find ripgrep xsel python3-neovim

	$ LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
	$ curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	$ tar xf lazygit.tar.gz lazygit
	$ install lazygit ~/.local/bin

	$ wget - https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
	$ install nvim.appimage ~/.local/bin/nvim

## Install packages for GNOME/Ubuntu
	$ sudo apt install \
		dconf-editor gnome-icon-theme gnome-shell-extension-manager gnome-tweaks papirus-icon-theme ubuntu-restricted-extras

## Install terminal fonts
	$ wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/DejaVuSansMono.zip
	$ unzip -d DejaVuSansMono DejaVuSansMono.zip
	$ mkdir ~/.local/share/fonts
	$ cp DejaVuSansMono/*Mono.ttf ~/.local/share/fonts
	$ fc-cache -vf ~/.local/share/fonts

## Install Tmux Plugin Manager:
	$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
