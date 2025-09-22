[ "$OS" = 'arch' ] && alias sudo='doas'
alias vim='nvim'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias l='ls'
alias ll='ls -lh'
alias la='ls -a'
alias lla='ll -a'

# file search and edition
function ff {
  find $@ -type f
}
function ed {
  find $@ -type f ! -path '*/.*/*' ! -name '.*' -exec "$EDITOR" {} +
}
function fd {
  find $@ -type d
}
function fde {
  find $@ -type d -empty
}

# color diff output
function diff {
  command diff --color=always "$@"
}

# package management
case "$OS" in
  'arch')
    alias pkginfo='pacman --sync --info'
    alias lfpkg='pacman --sync --search'
    alias lfitpkg='pacman --query --search'
    alias itpkg='sudo pacman --sync'
    alias rmpkg='sudo pacman --remove --recursive'
    alias uppkgs='sudo pacman --sync --refresh --sysupgrade'
    ;;
  'raspbian')
    alias pkginfo='apt show'
    alias lfpkg='apt search'
    alias lfitpkg='apt list --installed | grep'
    alias itpkg='sudo apt install'
    alias rmpkg='sudo apt remove'
    alias uppkgs='sudo sh -c "apt update && apt upgrade && apt autoremove && apt autoclean"'
    ;;
  'mac')
    alias pkginfo='pacman --sync --info'
    alias lfpkg='brew search'
    alias lfitpkg='brew list | grep'
    alias itpkg='brew install'
    alias rmpkg='brew uninstall'
    alias uppkgs='brew update && brew upgrade && brew autoremove'
    ;;
esac

# clipboard
if [ "$OS" = 'mac' ]; then
  alias cb='pbcopy'
else
  alias cb='sed --null-data "s/\n$//" | xclip -selection clipboard'
fi

# history
alias lfhist='history 0 | grep'
function gethist {
  local id="$1"
  history 0 | grep "^ *$id" | sed 's/.*  //' | tr -d '\n' | cb
}

# workspace
alias ws='cd -P ~/.ws'
function wsf {
  ws
  vim $(cat ~/.wsf)
}
function cws {
  ln -sfn "$(pwd)" ~/.ws
  echo "$(ff $@)" > ~/.wsf
  [ $# -gt 0 ] && wsf
}

# system independent url opening
function open_url {
  if [ "$OS" = 'mac' ]; then
    open $@
  else
    xdg-open $@
  fi
}
