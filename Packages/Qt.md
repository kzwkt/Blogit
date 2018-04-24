### Tips and Tricks
Font: Source Code Pro 11

for read help about any function or qml variables : F1
Always open help pages in Seperate Help Mode      : Tools-->Options-->Helps-->StartUp-->ONcontextHelp-->Always Show In Help Mode
Display Line Number And Highlight Current Line    : Tools-->Options-->TextEditor-->Display
Enable Auto Indent When Press BackSpace           : Tools-->Options-->TextEditor-->Behaivour-->Typing-->Enable Automatic Indention-->Follow Previous Indents
Show QtQuick Toolbar        : Tools-->Options-->QtQuick-->Qml/Js Editing-->QtQuit Toolbar-->Always Show QtQuitToolbar
Auto Indent After Save(Qml) : Tools-->Options-->QtQuick-->Qml/Js Editing-->Enable Auto Foramt On File Save
Auto Indent After Save      : Tools > Options > Text Editor > Behavior-->cleanups upon saving section

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
