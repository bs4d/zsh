export EDITOR='nvim'
export DISTRO=$(cat /etc/os-release | grep '^ID=' | cut --delimiter='=' --fields=2)
[ "$DISTRO" = 'arch' ] && export PATH="$PATH:$HOME/.spicetify"
