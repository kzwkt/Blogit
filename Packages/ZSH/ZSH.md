## Install zsh
`sudo pacman -S zsh`

## Install prezto
`packer -S prezto-git`

## Change shell to zsh
`chsh -s /bin/zsh`

## Findout current shell
`echo $SHELL`

## Create .zshrc and .zpreztorc in home directory

paste these lines to ~/.zpreztorc:
`zstyle ':prezto:module:prompt' theme 'paradox'`

## Show list of Theme in zpreztro
`prompt -l`

## Preview Themes in zpreztro
`prompt -p THEME_NAME`

## work with tmux
to corporate tmux and zsh you have to set zsh as default shell in ~/.tmux.conf:
`set-option -g default-shell /bin/zsh`

## Copy tmux configurations from .bashrc to .zshrc
copy these lines in .zshrc for tmux functionality:
```
######## Tmux #######
if which tmux >/dev/null 2>&1; then
    #if not inside a tmux session, and if no session is started, start a new session
    test -z "$TMUX" && (tmux attach || tmux new-session)
    xdotool key CTRL+a CTRL+r
fi
#########
```

