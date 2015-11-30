alias f="vim func.S"
alias maker="make; qemu-system-x86_64 -hdc kernel/kernel.img"
alias makerc="make; timeout 10 qemu-system-x86_64 --curses -hdc kernel/kernel.img"
alias ls="ls --color=auto"
alias sl="ls --color=auto"

alias mkae="make"

# Config found online
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m    \]\$ "
export CLICOLOR=1
LS_COLORS=$LS_COLORS:'di=0;35:' ; export LS_COLORS

set -o vi

alias removeSwaps="rm .*.swp && rm kernel/.*.swp && rm user/.*.swp"
alias run="make -s clean test"
alias removeOutput="rm *.diff *.out *.raw"
