# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/keivaunwaugh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

setopt PROMPT_SUBST
PROMPT='%{$(pwd|grep --color=always /)%${#PWD}G%} %(!.%F{red}.%F{cyan})%n%f@%F{yellow}%m%f%(!.%F{red}.)%#%f '

alias ls='ls -G'
alias peeps='ssh kwaugh@peeps.cs.utexas.edu'
alias peepsy='ssh -Y kwaugh@peeps.cs.utexas.edu'
alias pez='ssh kwaugh@pez.cs.utexas.edu'
alias bumblebee='ssh kwaugh@bumblebee.cs.utexas.edu'
alias vim='mvim -v'
alias homeserver='ssh keivaun@70.114.241.139'

set -o vi
