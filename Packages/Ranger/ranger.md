### Automatically grap inode/directory and open it in ranger
You should do some tricks :) let's get startd:
1. First you have to install some dependencies: __wmctrl__, __xdotool__ and __xdg-util__.(first for jump between windwos and second to emulate keyboard shortcuts and third for set defalut applications)
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
4. You see in the __Exec__ part, you have to specify a shell script(all magic function come in this file!)
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

### Encrypt and Decrypt files
1. First add these functions into your __.bashrc__:
```
enc(){
if [ -z "$1" ]; then
    (>&2 echo "ERROR: No file provided!")
else
    gpg --cipher-algo AES256 -o $1.gpg -c $1 && rm $1 && echo "File encrypted and original File Deleted!";
    gpg -e -r $USER $1 && rm -rf $1 || echo "Error, $1 did not encrypt!";
fi
}
export -f enc

dec(){
if [ -z "$1" ];then
    (>&2 echo "ERROR: No file provided!")
else
    gpg $1 && rm -rf $1 || echo "Error, $1 did not decrypt!";
fi
}
export -f dec
```
2. Open your __rc.conf__ file and this these lines into it:
```
map be  eval fm.open_console('shell enc ' + fm.thisfile.relative_path.replace("%", "%%"))
map bd  eval fm.open_console('shell dec ' + fm.thisfile.relative_path.replace("%", "%%"))
```

### Mount Android Device:
Add these lines into __rc.confi__ file:
```
map bm  shell aft-mtp-mount ~/myDevice/
map bu  shell sudo umount ~/myDevice/
```

### More informations
1. [how-to-specify-default-applications](https://linuxcommando.blogspot.com/2014/03/how-to-specify-default-applications-for.html)
