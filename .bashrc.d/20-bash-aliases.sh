# bash_aliases.sh: Bash alias definitions

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

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Other programs
alias bc='bc -l -q'
alias screen='screen -U'
alias dgit='/usr/bin/git --git-dir=$HOME/.dotfiles/'
alias gitg='GTK_THEME=Adwaita:light gitg 2>/dev/null'
alias tm='tmux new-session mc'
alias tmnv='tmux new-session mc \; new-window nvim \; select-window -t 1'

# vim: set ft=sh :
