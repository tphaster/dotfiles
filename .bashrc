# ~/.bashrc: executed by bash(1) for non-login shells.
#
#  Author: Tomasz Pieczerak <tphaster AT gmail.com>

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Set PATH to include user's private bin/ if it exists
if ! [[ "$PATH" =~ "$HOME/.local/bin:" ]]; then
	if [ -d "$HOME/.local/bin" ]; then
		PATH="$HOME/.local/bin:$PATH"
	fi
fi
export PATH

# Run ~/.bashrc.d scripts
if [ -d ${HOME}/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*.sh; do
		if [ -x "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
