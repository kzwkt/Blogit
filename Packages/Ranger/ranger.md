### Open Any directory in ranger
You should do some tricks :) let's get startd:
1. First you have to install these dependencies: __wmctrl__ and __xdotool__.(first for jump between windwos and second to emulate keyboard shortcuts)
2. Create a __.desktop__ file. because inode directory look at this files.and put it in the: __~/.local/share/applications__ directory.(i called it: opener.desktop)
3. Put these lines into that file:
```
[Desktop Entry]

Type=Application
Name=opener
Comment=Open Directory In Ranger
Exec=/usr/bin/opener.sh %U
Icon=utilities-terminal
MimeType=inode/directory;
```
4. You see in the __Exec__ node you have to specify a shell script(all magic function come in this file!)
5. Create opener.sh in __/usr/bin__ directory and set it as executable.(`chmod +x /usr/bin/opener.sh`)
6. Paste These lines into that:
```
#! /bin/bash

wmctrl -a Ranger; sleep 1 && xdotool key Control_L+n && xdotool key Shift+\: && xdotool type cd ${1} && xdotool key Return
```
7. Now you have to update __inode/directory__ value with help of `xdg-mime` application:
`xdg-mime default opener.desktop inode/directory`
8. Sure evertything setup correctly:
`xdg-mime query default inode/directory`
9. Now you can open directories in everywhere exists option like: "Open folder", "Show containg folder", ...
10. Enjoy the automation :)

