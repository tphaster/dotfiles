##
# .bashrc -- bash startup file
#
# Author:       Tomasz Pieczerak (tphaster)
# Last Change:  Sat, 26 Mar 2011 19:41:26 CET
##

export PATH=$PATH:$HOME/.bin
export EDITOR=vim
export VISUAL=gvim

export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=777
export HISTFILESIZE=777

export LESS="-rX"
export LS_OPTIONS='-a -b -F -h --group-directories-first --color=always'

alias bc='bc -l -q'
alias halt='/sbin/halt'
alias reboot='/sbin/reboot'
alias xterm='xterm -bg black -fg grey -ls -geometry 110x35'
alias xpdf='xpdf 1>/dev/null 2>&1'

if [[ $- = *i* ]]; then
    echo
    fortune fortunes fortunes2 linuxcookie
    echo
fi

