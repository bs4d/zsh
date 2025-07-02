alias g='git'

alias gs='git status'
alias gss='git show'
alias gd='git diff'
alias gdh='git diff HEAD'
alias gdo='git diff "origin/$(git branch --show-current)"'
alias gl='git log'
alias gll='git log --oneline'

alias gb='git branch'
alias gba='git branch --all'

alias ga='git add'

alias gcc='git checkout'

alias gc='git commit'
alias gca='git commit --amend'
alias gcane='git commit --amend --no-edit'

alias gp='git pull'
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

alias gpp='git push'
alias gppf='git push --force'
function gppa {
  for remote in $(git remote); do
    echo "pushing to $remote..."
    git push "$remote" $(git branch --show-current) $@
  done
}
alias gppfa='gppa --force'

alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'

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
  local git_root=$(git rev-parse --show-toplevel)
  local repo_path="${PWD#$git_root}"
  [ -n "$url" ] && open_url "https://$url/tree/$branch$repo_path"
}

function ghd {
  local source_remote='origin'
  local target_remote='upstream'
  local source_branch=$(git branch --show-current)
  if [ "$#" -eq 1 ]; then
    local target_branch=$1
  else
    local target_branch="$source_branch"
  fi
  local source_url=$(get_git_url $source_remote)
  local target_url=$(get_git_url $target_remote)
  local head="$(echo $source_url | cut -d '/' -f 2):$source_branch"
  [ -n "$target_url" ] && open_url "https://$target_url/compare/$target_branch...$head"
}

function ghc {
  local commit_sha=$(git rev-parse $1)
  if [ "$#" -eq 1 ]; then
    local remote=origin
  else
    local remote="$2"
  fi
  local url=$(get_git_url $remote)
  [ -n "$url" ] && open_url "https://$url/commit/$commit_sha"
}
