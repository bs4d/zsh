alias g='git'
alias gs='git status'
alias gss='git show'
alias gb='git branch'
alias gba='git branch --all'
alias gl='git log'
alias gll='git log --oneline'
alias gd='git diff'
alias gp='git pull'
alias gpp='git push'
alias gppf='git push --force'
function gppa {
  for remote in $(git remote); do
    echo "pushing to $remote..."
    git push "$remote" $(git branch --show-current) $@
  done
}
alias gppfa='gppa --force'
alias gane='git commit --all --amend --no-edit'
function gpr {
  if [ "$#" -eq 0 ]; then
    local remote='upstream'
    local branch="$(git branch --show-current)"
  else
    local remote=$1
    local branch=$2
  fi
  git pull --rebase $remote $branch
}

function get_git_url {
  if [ "$#" -eq 0 ]; then
    local remote='origin'
  else
    local remote=$1
  fi
  ssh_url=$(git remote --verbose | grep $remote | tr -s '[:space:]' ' ' | cut -d ' ' -f 2 | uniq | sed 's/\.git$//')
  echo $ssh_url | sed 's/git@//' | sed 's/:/\//'
}

function gh {
  local url=$(get_git_url $@)
  local branch=$(git branch --show-current)
  [ -n "$url" ] && open_url "https://$url/tree/$branch"
}

function ghpr {
  if [ "$#" -eq 0 ]; then
    local src='origin'
    local target='upstream'
  else
    local src=$1
    local target=$2
  fi
  local base_url=$(get_git_url $src)
  local target_url=$(get_git_url $target)
  local branch=$(git branch --show-current)
  local head="$(echo $base_url | cut -d '/' -f 2):$branch"
  [ -n "$target_url" ] && open_url "https://$target_url/compare/$branch...$head?expand=1"
}
