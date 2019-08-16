export TERM="xterm-256color"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v

export LC_ALL=en_US.UTF-8

export DEFAULT_USER=keivaun
if [[ $unamestr == 'Darwin' ]]; then
    export HOME="/Users/$DEFAULT_USER"
elif [[ $unamestr == 'Linux' ]]; then
    export HOME="/home/$DEFAULT_USER"
fi

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
export LANG=en_US.utf8
if [ -f /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme ]; then
    POWERLEVEL9K_MODE='awesome-fontconfig'
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs ssh anaconda)
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs command_execution_time)
    ZSH_THEME="powerlevel9k/powerlevel9k"
    plugins=(git)
    source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme
fi

export ERLHOME=/usr/local/lib/erlang
export EDITOR=nvim
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbi:$PATH"

unamestr=$(uname)

alias baus='ssh kwaugh@70.114.199.247'
alias bausy='ssh -Y kwaugh@70.114.199.247'
alias bauslocal='ssh kwaugh@192.168.1.105'
alias bauslocaly='ssh -Y kwaugh@192.168.1.105'
alias monster='ssh -p 3000 kwaugh@70.114.199.247'
alias monsterlocal='ssh kwaugh@192.168.1.121'
alias raspberry='ssh keivaun@70.114.236.177'
alias raspberrylocal='ssh keivaun@192.168.0.26'

alias gitspa='git stash; git pull; git stash apply'
alias sl='ls'
alias l='ls -al'

if [[ $unamestr == 'Darwin' ]]; then
    alias vim='mvim -v'
    alias fixdigitalocean='sudo ifconfig en0 down;sudo route -n flush;sudo ifconfig en0 up'
    alias ls='ls -G'
    alias ll='ls -G -l -a'
    alias mountbaus='sudo sshfs -o allow_other,defer_permissions,IdentityFile=~/.ssh/id_rsa kwaugh@70.114.210.103:/media/kwaugh/RAID/ ~/RAID/'
    alias unmountbaus='sudo umount ~/RAID'
    export DROPBOX_LOC="~/Dropbox"
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ $unamestr == 'Linux' ]]; then
    [ -d ~/.fonts ] && source ~/.fonts/*.sh
    alias open='xdg-open'
    alias ls='ls --color'
    alias ll='ls -l --color -a'
    export DROPBOX_LOC="/mnt/RAIDUbuntu/Dropbox"
    export LESSOPEN="| $(which source-highlight) %s"
    export LESS=' -R '
fi

# Use vi keybindings in zsh
set -o vi

# Use fzf reverse search if it's installed
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

encrypt() {
    openssl enc -aes-256-cbc -e -in $1 -out $2
}

decrypt() {
    openssl enc -aes-256-cbc -d -in $1 -out $2
}

dgrep() {
    grep -rinH --exclude="*.{out,output,o}" --exclude="tags" --exclude-dir="node_modules" $1 $2
}

space() {
    du -sk ~/* ~/.??* | sort -n
}
