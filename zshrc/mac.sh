[ "$OS" = 'mac' ] || return

function diff {
  command diff --color=always "$@"
}

function find {
  if [ "$#" -eq 0 ]; then
    command find .
  else
    command find "$@"
  fi
}
