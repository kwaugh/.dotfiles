export TERM="xterm-256color"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v

if [[ $unamestr == 'Darwin' ]]; then
    export DEFAULT_USER=kwaugh
    export HOME="/Users/kwaugh"
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
# POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs ssh anaconda)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs command_execution_time)
ZSH_THEME="powerlevel9k/powerlevel9k"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export ERLHOME=/usr/local/lib/erlang

export EDITOR=nvim

if [[ $unamestr == 'Darwin' ]]; then
    export PATH="/Users/kwaugh/Library/Haskell/bin:$PATH"
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
alias maverick2='ssh kwaugh@maverick2.tacc.utexas.edu'

alias homeserver='ssh keivaun@70.114.241.139'
alias baus='ssh kwaugh@70.114.199.247'
alias bausy='ssh -Y kwaugh@70.114.199.247'
alias bauslocal='ssh kwaugh@192.168.1.105'
alias bauslocaly='ssh -Y kwaugh@192.168.1.105'
alias monster='ssh -p 3000 kwaugh@70.114.199.247'
alias monsterlocal='ssh kwaugh@192.168.1.121'
alias raspberry='ssh -p 5000 kwaugh@70.114.199.247'
alias raspberrylocal='ssh kwaugh@192.168.1.145'

alias digitalocean='ssh root@192.241.244.206'

alias gitspa='git stash; git pull; git stash apply'
alias sl='ls'
alias l='ls -al'

if [[ $unamestr == 'Darwin' ]]; then
    alias vim='mvim -v'
    alias fixdigitalocean='sudo ifconfig en0 down;sudo route -n flush;sudo ifconfig en0 up'
    alias ls='ls -G'
    alias ll='ls -G -l -a'
    export PATH="/Applications/MATLAB_R2016b.app/bin:$PATH"
    export PATH="/opt/metasploit-framework/bin:$PATH"
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
    export DROPBOX_LOC="/mnt/RAIDUbuntu/Dropbox"
    source ~/.fonts/*.sh
    export LESSOPEN="| $(which source-highlight) %s"
    export LESS=' -R '
fi

alias fall="cd $DROPBOX_LOC/School/graduate/fall"
alias spring="cd $DROPBOX_LOC/School/graduate/spring"

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
    grep -rinH --exclude="*.{out,output}" --exclude-dir="node_modules" $1 $2
}

space() {
    du -sk ~/* ~/.??* | sort -n
}

printfile() {
    file=$1
    username="kwaugh"
    host="planthopper.cs.utexas.edu"
    scp $file "$username@$host:"
    ssh "$username@$host"
}

getpaper() {
    file=$1
    username="kwaugh"
    host="planthopper.cs.utexas.edu"
    ssh "$username@$host" "wget www.cs.utexas.edu/~rossbach/380L/papers/$file; exit"
    scp "$username@$host:~/$file" .
}
#
# added by Anaconda3 installer
export PATH="/home/kwaugh/anaconda3/bin:$PATH"
# added by Anaconda3 5.3.0 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/kwaugh/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
