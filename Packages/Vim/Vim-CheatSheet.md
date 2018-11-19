<h1 align="center">
	<img width="200" src="Vim.svg" alt="Vim">
	<br>
	<br>
</h1>

## Index
- [Vertical Selection](#VerticalSelection)
- [Append Characters](#AppendCharacters)
- [Close All Buffers](#CloseAllBuffers)
- [Close All Buffers](#ShowTrailingWhiteSpaces)

### <a name="VerticalSelection">Vertical Selection</a>
first type:
`<Ctrl> + <Shift> + v`

For replace characters in this mode:
`R + "what you want"`

For replace multi characters in this mode:
`C + "what you want + <ESC>"`

For select to entiry each line:
`<Ctrl> + <Shift> + v +3j$`

### <a name="AppendCharacters">Append Characters</a>
To append __,__ to end of 
`:%s/$/,/`
Where
> : - enter command mode
> 
> % - for every line
> 
> s/ - substitute
> 
>$ - the end of the line
>
>/ - and change it to
>
>, - a comma

### <a name="Close All Buffers">CloseAllBuffers</a>
install [BufOnly](https://github.com/vim-scripts/BufOnly.vim) plugin and then:
`:BufOnly`

### <a name="ShowTrailingWhiteSpaces"<>ShowTrailingWhiteSpaces</a>
Show trailing whitespaces
`/\s\+$`

Show all tabs:
`/\t`

" Show trailing whitespace:
/\s\+$

" Show trailing whitespace only after some text (ignores blank lines):
/\S\zs\s\+$

" Show spaces before a tab:
/ \+\ze\t

### <a name="Close All Windows<"<>CloseAllWindows</a>
Shortest/simplest/fastest way would be:

`:qa`

To save work in all tabs and quit:

`:wqa`


Resources
---
1. https://stackoverflow.com/questions/4545275/vim-close-all-buffers-but-this-one/
