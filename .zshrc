# Created by newuser for 4.3.17
#export TERM=xterm-256color
export TERM=screen-256color
export EDITOR=vim
autoload -U promptinit
promptinit
autoload -U colors && colors
PROMPT="%{$fg[green]%}%n%{$reset_color%}@%{$fg[white]%}%m %{$reset_color%}%1~ %{$fg[white]%}- %T %{$reset_color%}%# "
RPROMPT="[%{$fg[yellow]%}%?%{$reset_color%}]"
# export CVS_RSH=ssh
# export CVSROOT=:ext:ist164752@sigma.ist.utl.pt:/afs/ist.utl.pt/groups/leic-co/co13/cvs/011
alias beepboop='echo "main(i){for(i=0;;i++)putchar(((i*(i>>8|i>>9)&46&i>>8))^(i&i>>13|i>>6));}" | gcc -x c - && ./a.out | aplay -f U16 -r 44100'
alias off='sudo poweroff'
alias ls='ls --color=always'
alias ll='ls -lh --color=always'
alias vi=vim
alias vimnoplg='vim -u NONE -N'
alias zt='zathura -c ~/.zathura'
alias scrshot='xfce4-screenshooter'
alias tmu='tmux -2 -f ~/.tmux/conf new -s work'
alias rmv='shred -uz'
alias rst='ristretto'
alias mp='mpv --vo=x11'
alias grep='grep --colour=always'
alias ack= 'ack-grep'
# alias gcc='gcc -fdiagnostics-color=always'
# alias g++='g++ -fdiagnostics-color=always'
# apt (package manager)
alias upd='sudo apt-get update'
alias dupg='sudo apt-get dist-upgrade'
alias upg='sudo apt-get upgrade'
alias inst='sudo apt-get install'
alias rem='sudo apt-get autoremove --purge'
alias aptclean='sudo apt-get autoclean'
#alias srcpkg='apt-cache search'
#alias srcinst='dpkg --get-selections | grep'
# git
alias gst='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
# alias gk='gitk --all&'
# alias gx='gitx --all'
#typo that might happen...
alias got='git '
# para nao ter que estar sempre a escrever a mesma merda
alias ssh='ssh -2'

function tmi() {
    tmuxinator start $1
}
function gmeu() {
    git clone https://github.com/zero808/"$1"
}

function trash() {
    mv -vf "$1" "$HOME/.trash/"
}

srcpkg() {
    #for debian
    apt-cache search $1 | sort
    # for arch
    # pacman -Ss $1
}

srcinst() {
    #for debian
    dpkg --get-selections | grep $1 | sort
}

unpack () {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       rar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *.tar.xz)    tar xJf $1     ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}

funtion updt() {
    sudo apt-get update
    sudo apt-get dist-upgrade -y
    sudo apt-get autoremove --purge -y
    sudo apt-get autoclean
}
