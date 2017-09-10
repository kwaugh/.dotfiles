# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/keivaunwaugh/.zshrc'
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
export ZSH=/Users/keivaunwaugh/.oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"
plugins=(git)
export DEFAULT_USER=keivaunwaugh
source $ZSH/oh-my-zsh.sh

export PATH="/Users/keivaunwaugh/Library/Haskell/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin:$PATH"

unamestr=$(uname)

alias plant='ssh kwaugh@planthopper.cs.utexas.edu'
alias planty='ssh -Y kwaugh@planthopper.cs.utexas.edu'
alias orion='ssh kwaugh@orion.cs.utexas.edu'
alias oriony='ssh -Y kwaugh@orion.cs.utexas.edu'
alias bumblebee='ssh kwaugh@bumblebee.cs.utexas.edu'
alias bumblebeey='ssh -Y kwaugh@bumblebee.cs.utexas.edu'
alias gilligan='ssh kwaugh@gilligan.cs.utexas.edu'
alias gilligany='ssh -Y kwaugh@gilligan.cs.utexas.edu'

alias homeserver='ssh keivaun@70.114.241.139'
alias apartmentserver='ssh kwaugh@70.114.210.103'
alias digitalocean='ssh root@192.241.244.206'

alias fall='cd ~/Dropbox/School/senior/fall'
alias gitspa='git stash; git pull; git stash apply'

eval "$(thefuck --alias)"
# enable pyenv which allow you to switch between different python versions
export PYTHON_CONFIGURE_OPTS="--enable-framework"
# check installed versions:
#   pyenv versions
# switch between global versions:
#   pyenv global 3.3.1
# set the python version for the current directory
#   pyenv local 3.5.2
# install a new version:
#   pyenv install 2.7.5
eval "$(pyenv init -)"

if [[ $unamestr == 'Darwin' ]]; then
    alias vim='mvim -v'
    alias fixdigitalocean='sudo ifconfig en0 down;sudo route -n flush;sudo ifconfig en0 up'
    alias ls='ls -G'
    alias ll='ls -G -l -a'
    export PATH="/Applications/MATLAB_R2016b.app/bin/:$PATH"
elif [[ $unamestr == 'Linux' ]]; then
    alias open='xdg-open'
    alias ls='ls --color'
    alias ll='ls -l --color -a'
    export TERM=screen-256color
    export PATH="/usr/local/MATLAB/R2017a/bin:$PATH"
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

space() {
    du -sk ~/* ~/.??* | sort -n
}
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
