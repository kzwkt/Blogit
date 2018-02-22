######## Tmux #######
if which tmux >/dev/null 2>&1; then
    #if not inside a tmux session, and if no session is started, start a new session
    test -z "$TMUX" && (tmux attach || tmux new-session)
    xdotool key CTRL+a CTRL+r
fi
#########

# alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '

plugins=(git)
plugins=(zsh-syntax-highlighting)

export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/Other/bin