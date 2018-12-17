" AutoCompleteMe
let g:python_host_prog = '/usr/bin/python' "AutoComplPop reqire python to work
let g:python3_host_prog = '/usr/bin/python3'
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_global_ycm_extra_conf = "~/.config/nvim/languages/.ycm_extra_conf.py"
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR> " close quickfix list
map <C-n> :cnext<CR> " switch between errors and quickfix list
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
