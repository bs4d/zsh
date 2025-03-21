case "$OS" in
  'arch')     host_color='cyan' ;;
  'raspbian') host_color='red'  ;;
  'mac')      host_color='green';;
  *)          host_color='white';;
esac

[ "$USER" = 'root' ] && command_prompt='%F{red}#%f' || command_prompt='$'

git_branch() {
	git status &> /dev/null && echo "%F{yellow}(git: $(git branch --show-current))%f "
}

setopt prompt_subst

export PROMPT="%F{$host_color}[%M]%f %~ \$(git_branch)%B$command_prompt%b "
