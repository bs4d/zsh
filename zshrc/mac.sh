[ "$OS" = 'mac' ] || return

function find {
  if [ "$#" -eq 0 ]; then
    command find .
  else
    command find "$@"
  fi
}
