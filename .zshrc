# Created by newuser for 4.3.17
#export TERM=xterm-256color
export TERM=screen-256color
autoload -U promptinit
promptinit
autoload -U colors && colors
PROMPT="%{$fg[green]%}%n%{$reset_color%}@%{$fg[white]%}%m %{$reset_color%}%1~ %{$fg[white]%}- %T %{$reset_color%}%# "
RPROMPT="[%{$fg[yellow]%}%?%{$reset_color%}]"
# export CVS_RSH=ssh
# export CVSROOT=:ext:ist164752@sigma.ist.utl.pt:/afs/ist.utl.pt/groups/leic-co/co13/cvs/011
#alias beepboop='echo "main(i){for(i=0;;i++)putchar(((i*(i>>8|i>>9)&46&i>>8))^(i&i>>13|i>>6));}" | gcc -x c - && ./a.out | aplay'
alias off='sudo poweroff'
alias ls='ls --color=always'
alias vi=vim
alias vimnoplg='vim -u NONE -N'
alias scrshot='xfce4-screenshooter'
alias tmux='tmux -2'
# apt
alias upd='sudo apt-get update'
alias dupg='sudo apt-get dist-upgrade'
alias upg='sudo apt-get upgrade'
alias inst='sudo apt-get install'
alias rem='sudo apt-get autoremove'
alias srcpkg='apt-cache search'
alias srcinst='dpkg --get-selections | grep'

function trash() {
    mv -vf "$1" "$HOME/.trash/"
}
