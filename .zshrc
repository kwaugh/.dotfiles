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

export PATH="$HOME/Library/Haskell/bin:$PATH"

unamestr=$(uname)

alias peeps='ssh kwaugh@peeps.cs.utexas.edu'
alias peepsy='ssh -Y kwaugh@peeps.cs.utexas.edu'
alias pez='ssh kwaugh@pez.cs.utexas.edu'
alias bumblebee='ssh kwaugh@bumblebee.cs.utexas.edu'

alias homeserver='ssh keivaun@70.114.241.139'
alias apartmentserver='ssh kwaugh@70.114.210.103'
alias digitalocean='ssh root@192.241.244.206'

alias home='cd ~/Dropbox/School\ Homework/Sophomore/2nd\ Semester'

if [[ $unamestr == 'Darwin' ]]; then
    alias vim='mvim -v'
    alias fixdigitalocean='sudo ifconfig en0 down;sudo route -n flush;sudo ifconfig en0 up'
    alias ls='ls -G'
    alias ll='ls -G -l -a'
    eval "$(thefuck --alias)"
elif [[ $unamestr == 'Linux' ]]; then
    alias open='xdg-open'
    alias ls='ls --color'
    alias ll='ls -l --color -a'
    export TERM=screen-256color
fi

set -o vi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

encrypt() {
    openssl enc -aes-256-cbc -e -in $1 -out $2
}

decrypt() {
    openssl enc -aes-256-cbc -d -in $1 -out $2
}

dgrep() {
    grep -rInH --exclude="*.{out,output}" --exclude-dir="node_modules" $1 $2
}
