for file in "$ZDOTDIR"/zshrc/*; do
	source "$file"
done

HISTFILE="$ZDOTDIR/.histfile"
HISTSIZE=1000000000
SAVEHIST=$HISTSIZE

# Lines configured by zsh-newuser-install
unsetopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _match _correct
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original false
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' substitute 0
zstyle ':completion:*' verbose true
zstyle :compinstall filename "$ZDOTDIR/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall
