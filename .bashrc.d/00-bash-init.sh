# bashrc.sh: Basic bash settings

# Print messages in a portable locale (with UTF-8 encoding if available)
if [ -n "$(locale -a | grep -i 'C.UTF-8')" ]; then
	export LC_MESSAGES="C.UTF-8"
else
	export LC_MESSAGES="C"
fi

# Set editor environment variables
export EDITOR=nvim
export VISUAL=nvim

# Don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth:erasedups

# Append to the history file, don't overwrite it
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in bash(5)
HISTSIZE=2048
HISTFILESIZE=4096

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# Set default pager
if [ -x /usr/bin/most ]; then
	export PAGER="most"
  export SYSTEMD_PAGER="most"
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# vim: set ft=sh :
