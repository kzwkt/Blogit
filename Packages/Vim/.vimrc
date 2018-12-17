""***** Basic *****""
" Enter the current millenium
set nocompatible

" Enabl syntax and plugins(for netrw)
syntax enable " syntax highlighting
filetype plugin on " This line enables loading the plugin files for specific file types

""***** Finding Files *****""
" Search down into subfolders
" Provide Tab-Completion for all file-related tasks
" For clever completion with the :find command
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Create the tag files
command! MakeTags !ctags -R .

" File browsing with netrw
let g:netrw_banner=0		" disable annoyoing banner
let g:netrw_become_split=4	" open in prior window
let g:netrw_altv=1		" open splits to right
let g:netrw_liststyle=3		" tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s|\s)\zs\.\S\+'

""**********  General Configuration  **********"
:let mapleader = "," " change \ to ,
:setlocal foldmethod=indent " Set folding method

set si " Smart indent
set ls=2 " This makes Vim show a status line even when only one window is shown
set nocp " This changes the values of a LOT of options, enabling features which are not Vi compatible but really really nice
set number " Display line numbers on the left side
set nowrap " Don't Wrap lines!
set mouse=a " Mouse Integration
set cindent " This turns on C style indentation
set t_Co=256 " makes Vim use 256 colors
set hlsearch " Highlight in search
set autowrite
set showmatch " Show matching brackets
set expandtab " When expandtab is set, hitting Tab in insert mode will produce the appropriate number of spaces.
set tabstop=4 " Set tabstop to tell vim how many columns a tab counts for. Linux kernel code expects each tab to be eight columns wide.
set noswapfile " Avoid swap files
set shiftwidth=4 " Set shiftwidth to control how many columns text is indented with the reindent operations (<< and >>) and automatic C-style indentation.
set softtabstop=4 " Set softtabstop to control how many columns vim uses when you hit Tab in insert mode. If softtabstop is less than tabstop and expandtab is not set, vim will use a combination of tabs and spaces to make up the desired spacing. If softtabstop equals tabstop and expandtab is not set, vim will always use tabs. When expandtab is set, vim will always use the appropriate number of spaces.
"set clipboard=unnamed
set clipboard=unnamedplus
"let @+=@"
"let @*=@"
set autoindent " Automatic indentation

"**********  Unicode Symbol **********"
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'

"**********  KeyBoard Hotkeys **********"
set pastetoggle=<F3> " Paste mode toggle with F3 Pastemode disable auto-indent and bracket auto-compelation and it helps you to paste code fro elsewhere .
noremap <silent> #3 :tabprevious<CR>  " switch to previous tab with F3
noremap <silent> #4 :tabnext<CR> " switch to next tab with F4

" Auto-Comment and uncooment with F6 and F7 key
autocmd FileType c,cpp,java,go let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType vim let b:comment_leader = '" '
map <F1> :NERDTreeToggle<CR>
noremap <silent> #7 :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR> " commenting line with F10
noremap <silent> #8 :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR> " uncommenting line with F11
map <F12> :setlocal spell! spelllang=en_us<CR> " check spelling with F12

"**********  plugins  **********"
"" indentLine
let g:indentLine_char = '|'
let g:indentLine_color_term = 239
"let g:indentLine_setColors = 0

"" autocomplpop setting
let g:acp_behaviorKeywordLength = 1 "  Length of keyword characters before the cursor, which are needed to attempt keyword completion
set omnifunc=syntaxcomplete " This is necessary for acp plugin

"" Airline plugin setting
let g:airline_theme='wombat' " set airline plugin theme
let g:airline#extensions#tabline#enabled = 1 " showing tabs
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

"" NERDTree
"toggle showing NERDTree with F9
"open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"open file in new tab with ctrl + t
let NERDTreeMapOpenInTab='<c-t>'

" AutoCompleteMe
let g:python_host_prog = '/usr/bin/python' "AutoComplPop reqire python to work
let g:python3_host_prog = '/usr/bin/python3'
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_global_ycm_extra_conf = "~/.config/nvim/.ycm_extra_conf.py"
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR> " close quickfix list
map <C-n> :cnext<CR> " switch between errors and quickfix list
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

" Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.

"**********  Languages  **********"
" GoLang
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
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

"**********  vim functions  **********"
"exec ":echomsg 'a'"
" Initial Actions
autocmd BufRead * :call LoadingFunc()
function! LoadingFunc()
endfunction

" Extract Funciton
vmap <leader>em :call ExtractMethod()<CR>
function! ExtractMethod() range
  let name = inputdialog("Name of new method:")
  '<
  exe "normal! O\<BS>func " . name ."()\<CR>{\<Esc>"
  '>
  exe "normal! oreturn ;\<CR>}\<Esc>k"
  s/return/\/\/ return/ge
  normal! j%
  normal! kf(
  exe "normal! yyPi// = \<Esc>wdwA;\<Esc>"
  normal! ==
  normal! j0w
endfunction

" Delete Trailing White Spaces(after save the file)
autocmd BufWrite * :call DeleteTrailingWS()
function! DeleteTrailingWS()
  execute "normal! mz"
  %s/\s\+$//ge
  exe "normal! 'z"
endfunction

"vmap \ml :call Mylog()<CR>
"function! Mylog(message, file)
"  new
"  setlocal buftype=nofile bufhidden=hide noswapfile nobuflisted
"  put=a:message
"  execute 'w >>' a:file
"  q
"endfun

"************************** Garbage section **************************
":set ignorecase " Ignore case in search
":colorscheme 'plugged/molokai/colors/molokai' "Set colorScheme

" Auto-Complete for ( , " , ' , [ , {
":inoremap        (  ()<Left>
":inoremap        "  ""<Left>
":inoremap        `  ``<Left>
":inoremap        '  ''<Left>
":inoremap        [  []<Left>
":inoremap      {  {}<Left>
":

" Python
" :noremap <silent> #5 :!xterm -hold -e './%' <CR> <CR>" execute bash & python script with F5
" :noremap <silent> #5 :!konsole --hold -e 'python ./%' <CR> <CR>" execute python script with F5
