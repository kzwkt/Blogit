export EDITOR=nvim

###### Shell History #######
HISTSIZE=1000
HISTFILESIZE=2000

##### Alias #####
alias ls='ls --color=auto'
alias pc='python -ic "from __future__ import division; from math import *"'

########## Other ###########
plugins=(git)
plugins=(zsh-syntax-highlighting)

export PATH="$HOME/.cargo/bin:$PATH"

########### Tmux ###########
#if which tmux >/dev/null 2>&1; then
    # if not inside a tmux session, and if no session is started, start a new session
#    test -z "$TMUX" && (tmux attach || tmux new-session)
#        xdotool key CTRL+a CTRL+r
    #    xdotool key CTRL+l CTRL+u
    # if there is tmux session, just do magic jobs :)
    #test -n "$TMUX"
    #    wmctrl -a Konsole; sleep 1 && xdotool key CTRL+a 0; sleep 1 && xdotool type ranger; sleep 1 && xdotool key Return
#fi

#wmctrl -a Konsole; sleep 1 && xdotool type ranger; sleep 1 && xdotool key Return
#eval "$(fasd --init auto)"
####### Garbage #############
# PS1='[\u@\h \W]\$ '
#PROMPT_COMMAND='echo -en "\033]0;terminal\a"'
#sh -c "wmctrl -a urxvt; sleep 1 && xdotool key CTRL+a 0; sleep 1 && xdotool type \"$(mpc load Khareji)\""

##### Startup commands #####
#sh -c "xdotool key CTRL+l && CTRL+u"
#sh -c "wmctrl -a Konsole; sleep 1 && xdotool key CTRL+a 0; sleep 1 && xdotool type \"$(echo ranger)\"; sleep 1 && xdotool key Return"

########### Env ############
#export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/Other/bin
#export ANDROID_NDK_PLATFORM=android-18


