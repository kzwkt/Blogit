"**********  KeyBoard Shortkeys **********"
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
