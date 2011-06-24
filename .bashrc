##
# .bashrc -- bash startup file
#
#  Author:       Tomasz Pieczerak <tphaster gmail.com>
#  Last Change:  Fri, 24 Jun 2011 14:24:09 CEST
##

# Environment variables
export PATH=$PATH:$HOME/.bin
export EDITOR=vim
export VISUAL=vim
export LC_MESSAGES=en_US

# Bash history
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=777
export HISTFILESIZE=777

# Program options and aliases
export LESS="-r"
export LS_OPTIONS='-a -b -F -h --group-directories-first --color=always'
alias ls="ls $LS_OPTIONS"

alias halt='/sbin/halt'
alias reboot='/sbin/reboot'
alias ifconfig='/sbin/ifconfig'

alias irc='irssi'
alias bc='bc -l -q'
alias xterm='xterm -bg black -fg grey -ls -geometry 110x35'
alias xpdf='xpdf 1>/dev/null 2>&1'

# Print fortune for interactive shells
if [[ $- = *i* ]]; then
    echo
    fortune fortunes fortunes2 linuxcookie
    echo
fi

