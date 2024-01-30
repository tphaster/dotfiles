# fortune.sh: Print fortune for interactive shells

if [ -x /usr/games/fortune ]; then
	echo
	/usr/games/fortune -a
	echo
fi

# vim: set ft=sh :
