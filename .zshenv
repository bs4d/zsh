export ZDOTDIR="$HOME/.config/zsh"

for file in "$ZDOTDIR"/zshenv/*; do
	source "$file"
done
