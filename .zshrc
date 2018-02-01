export TERM="xterm-256color"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

if [[ $unamestr == 'Darwin' ]]; then
    export DEFAULT_USER=keivaunwaugh
    export HOME="/Users/keivaunwaugh"
elif [[ $unamestr == 'Linux' ]]; then
    export DEFAULT_USER=kwaugh
    export HOME="/home/kwaugh"
fi
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"
# Filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o'
# the same for old style completion
fignore=(.o .c~ .old .pro)

autoload -Uz compinit
compinit
# End of lines added by compinstall

setopt PROMPT_SUBST
PROMPT='%{$(pwd|grep --color=always /)%${#PWD}G%} %(!.%F{red}.%F{cyan})%n%f@%F{yellow}%m%f%(!.%F{red}.)%#%f '

# oh-my-zsh settings
export LANG=en_SG.utf8
export ZSH=$HOME/.oh-my-zsh
POWERLEVEL9K_MODE='awesome-fontconfig'
ZSH_THEME="powerlevel9k/powerlevel9k"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export ERLHOME=/usr/local/lib/erlang

if [[ $unamestr == 'Darwin' ]]; then
    export PATH="/Users/keivaunwaugh/Library/Haskell/bin:$PATH"
fi
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin:$PATH"

unamestr=$(uname)

alias plant='ssh kwaugh@planthopper.cs.utexas.edu'
alias planty='ssh -Y kwaugh@planthopper.cs.utexas.edu'
alias orion='ssh kwaugh@orion.cs.utexas.edu'
alias oriony='ssh -Y kwaugh@orion.cs.utexas.edu'
alias bumblebee='ssh kwaugh@bumblebee.cs.utexas.edu'
alias bumblebeey='ssh -Y kwaugh@bumblebee.cs.utexas.edu'
alias gilligan='ssh kwaugh@gilligan.cs.utexas.edu'
alias gilligany='ssh -Y kwaugh@gilligan.cs.utexas.edu'
alias maverick='ssh kwaugh@maverick.tacc.utexas.edu'

alias homeserver='ssh keivaun@70.114.241.139'
alias apartmentserver='ssh kwaugh@70.114.210.103'
alias apartmentservery='ssh -Y kwaugh@70.114.210.103'
alias apartmentserverlocal='ssh kwaugh@192.168.1.215'
alias apartmentserverlocaly='ssh -Y kwaugh@192.168.1.215'

alias digitalocean='ssh root@192.241.244.206'

alias gitspa='git stash; git pull; git stash apply'
alias sl='ls'

eval "$(thefuck --alias)"

if [[ $unamestr == 'Darwin' ]]; then
    alias vim='mvim -v'
    alias fixdigitalocean='sudo ifconfig en0 down;sudo route -n flush;sudo ifconfig en0 up'
    alias ls='ls -G'
    alias ll='ls -G -l -a'
    export PATH="/Applications/MATLAB_R2016b.app/bin:$PATH"
    alias mountbaus='sudo sshfs -o allow_other,defer_permissions,IdentityFile=~/.ssh/id_rsa kwaugh@70.114.210.103:/media/kwaugh/RAID/ ~/RAID/'
    alias unmountbaus='sudo umount ~/RAID'
    export DROPBOX_LOC="~/Dropbox"
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


elif [[ $unamestr == 'Linux' ]]; then
    alias open='xdg-open'
    alias ls='ls --color'
    alias ll='ls -l --color -a'
    export PATH="/usr/local/MATLAB/R2017a/bin:$PATH"
    export DROPBOX_LOC="/media/kwaugh/RAID/Dropbox"
fi

alias fall="cd $DROPBOX_LOC/School/senior/fall"
alias spring="cd $DROPBOX_LOC/School/senior/spring"

set -o vi

bindkey -v
bindkey '^R' history-incremental-search-backward

encrypt() {
    openssl enc -aes-256-cbc -e -in $1 -out $2
}

decrypt() {
    openssl enc -aes-256-cbc -d -in $1 -out $2
}

dgrep() {
    grep -rInH --exclude="*.{out,output}" --exclude-dir="node_modules" $1 $2
}

space() {
    du -sk ~/* ~/.??* | sort -n
}
