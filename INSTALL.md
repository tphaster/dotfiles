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

## Compile YouCompleteMe for Vim:
	$ cd ~/.vim/bundle/YouCompleteMe/
	$ git submodule update --init --recursive
	$ python3 install.py --clang-completer
