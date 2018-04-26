### Keep all settings in .vimrc file
you can Search in the internet and pick up a .vimrc file and place it in `~/.vimrc`

### Set colorsheme
1. Go to [vimcolors](http://vimcolors.com) and pick up a colorshceme.
2. Create `~/.vim/colors` directory and put the color.vim in it.
3. Or use vim-plug:
` Plug 'tomasr/molokai'`
and add this line after ` call plug#end()`:
`color molokai`

### Vim-Plug
1. Download and install:
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
#### Install Plugin
for add any plugin, you must add it into these two lines:
```
call plug#begin('~/.vim/plugged')

" Insert plugins here...

call plug#end()
```

for example i want to install inte and and . final view is:
```
call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/L9'
Plug 'vim-scripts/AutoComplPop'

Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tomasr/molokai'
Plug 'Yggdroot/duoduo'
Plug 'beigebrucewayne/Turtles'

call plug#end()

```

### Tips and Tricks
1. commet multiple lines:  `66,70s/^/#`
2. uncommet multiple lines: `66,70s/^#/`

Resources
---
1. http://amirsamimi.ir/vimrc/
2. https://vimawesome.com/