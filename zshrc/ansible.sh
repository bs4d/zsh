# string encryption and decryption using vault
alias aven='ansible-vault encrypt_string'
function avde {
  echo $@ | tr -d ' ' | ansible-vault decrypt --output -
}

# viewing and editing vault encrypted files
alias avv='ansible-vault view'
alias ave='ansible-vault edit'
