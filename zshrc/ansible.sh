# string encryption and decryption using vault
alias anen='ansible-vault encrypt_string'
function ande {
  echo $@ | tr -d ' ' | ansible-vault decrypt --output -
}
