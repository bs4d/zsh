if [ "$DISTRO" = 'arch' ]; then
	alias sudo='doas'
	alias pkginfo='pacman --sync --info'
	alias lfpkg='pacman --sync --search'
	alias lfitpkg='pacman --query --search'
	alias itpkg='sudo pacman --sync'
	alias rmpkg='sudo pacman --remove --recursive'
	alias uppkgs='sudo pacman --sync --refresh --sysupgrade'
elif [ "$DISTRO" = 'raspbian' ]; then
	alias pkginfo='apt show'
	alias lfpkg='apt search'
	alias lfitpkg='apt list --installed | grep'
	alias itpkg='sudo apt install'
	alias rmpkg='sudo apt remove'
	alias uppkgs='sudo sh -c "apt update && apt upgrade && apt autoremove && apt autoclean"'
fi

alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -l --human-readable'
alias la='ls --all'
alias lla='ll --all'
