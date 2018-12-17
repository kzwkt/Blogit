" File browsing with netrw
let g:netrw_banner=0		" disable annoyoing banner
let g:netrw_become_split=4	" open in prior window
let g:netrw_altv=1		" open splits to right
let g:netrw_liststyle=3		" tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s|\s)\zs\.\S\+'
