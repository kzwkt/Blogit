# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#***** Shell History *****#
HISTSIZE=1000
HISTFILESIZE=2000

#***** Alias *****#
alias ls='ls --color=auto'
#ls --human-readable -ltrah
alias pc='python -ic "from __future__ import division; from math import *"'

#***** Environments Variables *****#
export EDITOR=nvim
export PATH="$HOME/.cargo/bin:$PATH"

#***** Prompt *****#
GREEN="\[$(tput setaf 3)\]"
RESET="\[$(tput sgr0)\]"
PS1="${GREEN}\W${RESET}\> "

#***** Functions *****#
enc(){
if [ -z "$1" ]; then
    (>&2 echo "ERROR: No file provided!")
else
    gpg --cipher-algo AES256 -o $1.gpg -c $1 && rm $1 && echo "File encrypted and original File Deleted!";
    gpg -e -r $USER $1 && rm -rf $1 || echo "Error, $1 did not encrypt!";
fi
}
export -f enc

dec(){
if [ -z "$1" ];then
    (>&2 echo "ERROR: No file provided!")
else
    gpg $1 && rm -rf $1 || echo "Error, $1 did not decrypt!";
fi
}
export -f dec

#function enc
#    gpg -e -r $USER $argv; and rm -rf $argv; or echo "Error, $argv did not encrypt!";
#end
#
#function dec
#    gpg $argv; and rm -rf $argv; or echo "Error, $argv did not decrypt!";
#end

#PS1='\W\> '
#PS1='[\u@\h \W]\$ '

#*****  Tmux  *****#
#if which tmux >/dev/null 2>&1; then
#    #if not inside a tmux session, and if no session is started, start a new session
#    test -z "$TMUX" && (tmux attach || tmux new-session)
#    xdotool key CTRL+a CTRL+r
#fi

