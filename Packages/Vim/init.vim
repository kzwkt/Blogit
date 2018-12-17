""***** General ****""
set si                      " Smart indent
set ls=2                    " This makes Vim show a status line even when only one window is shown
set nocp                    " This changes the values of a LOT of options, enabling features which are not Vi compatible but really really nice
set number                  " Display line numbers on the left side
set nowrap                  " Don't Wrap lines!
set mouse=a                 " Mouse Integration
set cindent                 " This turns on C style indentation
set t_Co=256                " makes Vim use 256 colors
set hlsearch                " Highlight in search
set autowrite
set showmatch               " Show matching brackets
set expandtab               " When expandtab is set, hitting Tab in insert mode will produce the appropriate number of spaces.
set tabstop=4               " Set tabstop to tell vim how many columns a tab counts for. Linux kernel code expects each tab to be eight columns wide.
set noswapfile              " Avoid swap files
set autoindent              " Automatic indentation
set nocompatible            " Enter the current millenium
set shiftwidth=4            " Set shiftwidth to control how many columns text is indented with the reindent operations (<< and >>) and automatic C-style indentation.
set softtabstop=4           " Set softtabstop to control how many columns vim uses when you hit Tab in insert mode. If softtabstop is less than tabstop and expandtab is not set, vim will use a combination of tabs and spaces to make up the desired spacing. If softtabstop equals tabstop and expandtab is not set, vim will always use tabs. When expandtab is set, vim will always use the appropriate number of spaces.
set clipboard=unnamedplus
setlocal foldmethod=indent  " Set folding method
syntax enable               " syntax highlighting
filetype plugin on          " This line enables loading the plugin files for specific file types
let mapleader = ","         " change \ to ,

""***** Finding Files *****""
" Search down into subfolders
" Provide Tab-Completion for all file-related tasks
set path+=** " For clever completion with the :find command
set wildmenu " Display all matching files when we tab complete
command! MakeTags !ctags -R . " Create the tag files

""***** Load extra configurations *****""
runtime Languages/java.vim
runtime Languages/c.vim
"runtime plugin/strip_trailing_whitespace.vim

""***** Enable language specific commands *****""
"To enable file type detection"
filetype on
augroup languages
    autocmd FileType go source languages/go.vim

   "the command below execute the script for the specific filetype Java
    autocmd FileType rust source languages/rust.vim
augroup END

"**********  vim functions  **********"
"exec ":echomsg 'a'"
" Initial Actions
autocmd BufRead * :call LoadingFunc()
function! LoadingFunc()
endfunction

"**********  VIM-Plug  **********"
call plug#begin('~/.config/nvim/plugged')
Plug 'tomasr/molokai'
Plug 'vim-scripts/L9'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/AutoComplPop'
Plug 'vim-airline/vim-airline-themes'

" Languages
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" programming tools
Plug 'SirVer/ultisnips' " Track the engine.
Plug 'honza/vim-snippets' " Snippets are separated from the engine. Add this if you want them:
Plug 'vim-syntastic/syntastic'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

Plug 'Yggdroot/duoduo'
Plug 'vim-scripts/BufOnly.vim'
Plug 'beigebrucewayne/Turtles'
"Plug 'vimwiki/vimwiki'

call plug#end()
color molokai
