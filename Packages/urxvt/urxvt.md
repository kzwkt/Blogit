### installation
1. rxvt-unicode
2. urxvt-perls
3. urxvtconfig-git(Optional)

### config files
You can put all settings in either:
1. .Xdefaults
2. .Xresources
files. and put all perl scripts in:
`~/.urxvt/ext`

### configs
Font: Bitstream Vera Sans Mono


### Change transparency on-the-fly
Add these line to ~/.Xdefaults file:
```
URxvt.depth: 32                                                                                                                                                      
URxvt.background: [100]#000000
 ```
 This line set the initial transparancy to 1(100) by default. to change it, you have to use __transset-df__ package. after install it, add these lines to i3.config file:
 ```
bindsym Control+space exec transset-df --inc 0.1 --name urxvt --no-regex                                                                                             
bindsym Control+Shift+space exec transset-df --dec 0.1 --name urxvt --no-regex  
 ```
 Tip: in other DE's or WM's, find the solution to bind hotkeys.
