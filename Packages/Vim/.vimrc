""**********  General Configuration  **********"
:filetype plugin on " This line enables loading the plugin files for specific file types
:set ls=2 " This makes Vim show a status line even when only one window is shown
:set number " Display line numbers on the left side
:set nowrap " Don't Wrap lines!
:set t_Co=256 " makes Vim use 256 colors
:set tabstop=4 " Set tabstop to tell vim how many columns a tab counts for. Linux kernel code expects each tab to be eight columns wide.
:set expandtab " When expandtab is set, hitting Tab in insert mode will produce the appropriate number of spaces.
:set shiftwidth=4 " Set shiftwidth to control how many columns text is indented with the reindent operations (<< and >>) and automatic C-style indentation. 
:set softtabstop=4 " Set softtabstop to control how many columns vim uses when you hit Tab in insert mode. If softtabstop is less than tabstop and expandtab is not set, vim will use a combination of tabs and spaces to make up the desired spacing. If softtabstop equals tabstop and expandtab is not set, vim will always use tabs. When expandtab is set, vim will always use the appropriate number of spaces.
:setlocal foldmethod=indent " Set folding method
:set si " Smart indent
:set nocp " This changes the values of a LOT of options, enabling features which are not Vi compatible but really really nice
:set cindent " This turns on C style indentation
:set mouse=a " Mouse Integration
:set hlsearch " Highlight in search
:set autowrite
:set showmatch " Show matching brackets
:set noswapfile " Avoid swap files
:set clipboard=unnamed
:set clipboard=unnamedplus
:set autoindent " Automatic indentation
:syntax enable " syntax highlighting
":set ignorecase " Ignore case in search
":colorscheme 'plugged/molokai/colors/molokai' "Set colorScheme

" Auto-Complete for ( , " , ' , [ , { 
:inoremap        (  ()<Left>
:inoremap        "  ""<Left>
:inoremap        `  ``<Left>
:inoremap        '  ''<Left>
:inoremap        [  []<Left>
:inoremap      {  {}<Left>

"**********  unicode symbol **********"
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'

" Auto-Comment and uncooment with F6 and F7 key
:set pastetoggle=<F3> " Paste mode toggle with F2 Pastemode disable auto-indent and bracket auto-compelation and it helps you to paste code fro elsewhere .

:autocmd FileType c,cpp,java,go let b:comment_leader = '// '
:autocmd FileType sh,ruby,python   let b:comment_leader = '# '

:noremap <silent> #4 :tabnext<CR> " switch to next tab with F2
:noremap <silent> #3 :tabprevious<CR> " switch to previous tab with F3

:map <F8> :setlocal spell! spelllang=en_us<CR> " check spelling with F8

:noremap <silent> #6 :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR> " commenting line with F6
:noremap <silent> #7 :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR> " uncommenting line with F7

""**********  plugins  **********"
"indentLine 
:let g:indentLine_char = '.'
" autocomplpop setting
:set omnifunc=syntaxcomplete " This is necessary for acp plugin
:let g:acp_behaviorKeywordLength = 1 "  Length of keyword characters before the cursor, which are needed to attempt keyword completion

" Airline plugin setting
:let g:airline_theme='wombat' " set airline plugin theme
:let g:airline#extensions#tabline#enabled = 1 " showing tabs 
:let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

"**********  NERDTree plugin setting **********"
 "toggle showing NERDTree with F9
:map <F9> :NERDTreeToggle<CR> 
"open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Open file in new tab with ctrl + t
:let NERDTreeMapOpenInTab='<c-t>'

"**********  Go  **********"
" switch between errors and quickfix list
map <C-n> :cnext<CR> 
map <C-m> :cprevious<CR>
" close quickfix list
nnoremap <leader>a :cclose<CR>
" build and run
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
let g:go_list_type = "quickfix"

"**********  Python  **********"
" :noremap <silent> #5 :!xterm -hold -e './%' <CR> <CR>" execute bash & python script with F5
" :noremap <silent> #5 :!konsole --hold -e 'python ./%' <CR> <CR>" execute python script with F5

"**********  VIM-Plug  **********"
call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/L9'
Plug 'vim-scripts/AutoComplPop'

Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-syntastic/syntastic'

Plug 'tomasr/molokai'
Plug 'Yggdroot/duoduo'
Plug 'beigebrucewayne/Turtles'

" Languages
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

call plug#end()
color molokai 
