# TPhaster's dotfiles

To download and setup the repository in the home directory:

	$ cd
	$ git clone --no-checkout git@github.com:tphaster/dotfiles.git
	$ mv dotfiles/.git .dotfiles && rmdir dotfiles && cd .dotfiles
	$ git config core.worktree ".."
	$ git config status.showuntrackedfiles no
	$ git reset --hard
