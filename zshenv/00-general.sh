export EDITOR='nvim'
export TERM='xterm-256color'

if [ "$(uname)" = 'Darwin' ]; then
  export OS='mac'
else
  export OS="$(cat /etc/os-release | grep '^ID=' | cut --delimiter='=' --fields=2)"
fi
