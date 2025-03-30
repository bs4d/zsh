[ "$OS" = 'arch' ] || return

function bootwin {
  id=$(efibootmgr | grep 'Windows' | cut --delimiter='*' --fields=1 | sed 's/^Boot//')
  doas efibootmgr --bootnext $id && doas reboot
}
