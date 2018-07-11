<h1 align="center">
	<img width="200" src="Qt.svg" alt="qt">
	<br>
	<br>
</h1>

### Tips and Tricks
1. Font: __Source Code Pro 11__
2. for read help about any function or qml variables : __F1__
3. Always open help pages in Seperate Help Mode : **Tools-->Options-->Helps-->StartUp-->ONcontextHelp-->Always Show In Help Mode**
4. Display Line Number And Highlight Current Line : __Tools-->Options-->TextEditor-->Display__
5. Enable Auto Indent When Press BackSpace: __Tools-->Options-->TextEditor-->Behaivour-->Typing-->Enable AutomaticIndention-->Follow Previous Indents__
6. Show QtQuick Toolbar : __Tools-->Options-->QtQuick-->Qml/Js Editing-->QtQuit Toolbar-->Always Show QtQuitToolbar__
7. Auto Indent After Save(Qml) : __Tools-->Options-->QtQuick-->Qml/Js Editing-->Enable Auto Foramt On File Save__
8. Auto Indent After Save : __Tools > Options > Text Editor > Behavior-->cleanups upon saving section__

### Create appimage for all linux distro's

```
E:\Qt\5.10.1\mingw53_32\bin\qtenv2.bat
```
#### Install prerequisites
```
packer -S linuxdeployqt appimage-git
```
### put all .dll or .so files beside binary executable file

#### linuxdeployqt
```
 linuxdeployqt /mnt/D/Document/WorkSpace/Qt/Project/build-Taghvim-Desktop-Release/Taghvim -qmldir='/mnt/D/Document/WorkSpace/Qt/Project/Taghvim' -bundle-non-qt-libs
```
or
```
linuxdeployqt /mnt/D/Document/WorkSpace/Qt/Project/build-Taghvim-Desktop-Release/Taghvim -qmldir='/mnt/D/Document/WorkSpace/Qt/Project/Taghvim' -appimage
```
or
```
linuxdeployqt ./usr/share/applications/Taghvim.desktop -qmldir='/mnt/D/Document/WorkSpace/Qt/Project/Taghvim' -qmake=/usr/bin/qmake -appimage -verbose=3 &> output.txt
```

#### windeployqt
```
 windeployqt --qmldir D:\Document\WorkSpace\Qt\Project\Taghvim D:\Document\WorkSpace\Qt\Project\build-Taghvim-Desktop_Qt_5_10_1_MinGW_32bit-Release\release\Taghvim.exe
````

### binarycreator

#### windows
```
 binarycreator.exe --offline-only -c config\config.xml -p packages\ TaghvimInstaller(1.0.0).exe
```

#### linux
```
binarycreator --offline-only -c config/config.xml -p packages/ TaghvimInstaller.run  
```

## TroubleShooting
If you encounter a crash when opening the help tab, delete qt-config files located in:
```
~/.config/QtProject/
```
and reOpen the QtCreator.

## Install toolchains on arch
1. download qt-creator-online-installer and download what you want.
2. install android-ndk, android-sdk, android-sdk-build-tools, android-sdk-platform-tools, android-platforms from AUR(Archlinuxcn)
3. Install android toolchain(arm-linux-gnueabihf-gcc or arm-linux-gnueabihf-gcc-stage1), and xcode toolchain(x-tools-armv6-bin), windows-toolchain(mingw-w64-gcc) and crosstool-ng-git.

<img alt="مجوز کریتیو کامنز" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png">
