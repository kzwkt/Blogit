<h1 align="center">
	<img width="200" src="Vim.svg" alt="Vim">
	<br>
	<br>
</h1>

## Index
- [Installation](#Installation)
- [Migration](#Migration)
- [Update Vim-Plug Configuration](#UpdateVimPlugConfiguration)
- [Backward Compatibility](#BackwardCompatibility)
- [Loading vim addons](#LoadingVimAddons)


### <a name="Installation">Installation</a>
`sudo pacman -S neovim`

then you can uninstall vim:
`sudo pacman -Rnsu vim`

### <a name="Migration">Migration</a>
1. Neovim uses $XDG_CONFIG_HOME/nvim instead of ~/.vim as its main configuration directory and $XDG_CONFIG_HOME/nvim/init.vim instead of ~/.vimrc as its main configuration file.($XDG_CONFIG_HOME==~/.confi)

### <a name="UpdateVimPlugConfiguration">Update Vim-Plug Configuration</a>
udpate vim-plug path from:

`call plug#begin('~/.vim/plugged')`

to:

`call plug#begin('~/.config/nvim/plugged')`


### <a name="Backward Compatibility">BackwardCompatibility</a>
If you want some lines to specific to each version, you can use an if block in your .vimrc file:

```
if has('nvim')
    " Neovim specific commands
else
    " Standard vim specific commands
endif
```

### <a name="Loading Vim Addons">LoadingVimAddons</a>
If you would like to use plugins, syntax definitions, or other addons that are installed for vim, you can add the default vim runtime path to neovim by adding it to the rtp. For example, you could run the following within nvim or add it to your neovim config:

`set rtp^=/usr/share/vim/vimfiles/`


Resources
---
1. https://wiki.archlinux.org/index.php/Neovim



