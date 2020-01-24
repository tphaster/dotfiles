##
# .bash_aliases -- bash aliases file
#
#  Author: Tomasz Pieczerak <tphaster AT gmail.com>
##

# Enable color support of ls and grep
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --group-directories-first -F -h'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Other programs
alias bc='bc -l -q'
alias screen='screen -U'
alias gitg='gitg 2>/dev/null'

# vim: set ft=sh :
