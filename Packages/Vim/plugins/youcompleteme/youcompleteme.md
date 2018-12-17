### Instalation
0. Install prerequities packages first:
```
sudo pacman -S neovim
sudo pacman -S python-pip

pip2 install --user --upgrade neovim
sudo pip2 install --user --upgrade neovim

pip install --user --upgrade neovim
sudo pip3 install --upgrade neovim

sudo pip install jedi
sudo pip install yapf

```

1. Add these line to end of __init.vim__ file:
```
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" AutoCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.config/nvim/.ycm_extra_conf.py"
```
2. Add this file to __~/.config/nvim__ directory:
`/.ycm_extra_conf.py`

3. Download plugin with vim-plug is easy. just put these lines in installation area:
`Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }`

4. After a while, it download the source code of __YouCompleteMe__ Plugin. then switch to it's directory in plugin directory:
```
cd ~/.config/nvim/plugged/YouCompleteMe
./install.py --clang-completer
```

Tip: you can pass many options to install.py script, like:
- `--cs-completer` for c# support
- `--go-completer` for go language and so on. Read the documentations for more details.


