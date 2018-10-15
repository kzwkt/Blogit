1- Open up terminal and type:

`cd ~/.local/share/nemo/actions/.`

2- Create a new file/action for Compress by typing: 

`nano compress.nemo_action`

3- Paste this contents into newly created file.

```
[Nemo Action]
Active=true
Name=Compress...
Comment=compress %N
Exec=file-roller -d %F
Icon-Name=gnome-mime-application-x-compress
Selection=Any
Extensions=any;
```

4- Save the file and exit (CTRL+X, and just Enter)

5- Create a new file/action for "Extract here" by typing nano extracthere.nemo_action.

6- Paste this contents into newly created file:

`[Nemo Action]
Active=true
Name=Extract here
Comment=Extract here
Exec=file-roller -h %F
Icon-Name=gnome-mime-application-x-compress
 #Stock-Id=gtk-cdrom
Selection=Any
Extensions=zip;7z;ar;cbz;cpio;exe;iso;jar;tar;tar;7z;tar.Z;tar.bz2;tar.gz;tar.lz;tar.lzma;tar.xz;`

7- Save the file and exit (CTRL+X, and just Enter).

8- You're done. If you still don't have Compress/Extract here options in Nemo, just restart or log out/in.

for more info: https://askubuntu.com/questions/532714/missing-nemo-right-click-extract-compress-files
