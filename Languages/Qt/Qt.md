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
2. install below packages from AUR:
``` sudo pacman -S android-studio android-ndk-r17c android-sdk android-sdk-build-tools android-sdk-platform-tools android-platform```
Tip: note that install only ndk 10e or 17c. other ndk versions have bugs.
3. Install system Images from AUR:
```trizen -S android-google-apis-x86 android-x86-system-image-22 ```
3. Install android toolchain(arm-linux-gnueabihf-gcc or arm-linux-gnueabihf-gcc-stage1), and xcode toolchain(x-tools-armv6-bin), windows-toolchain(mingw-w64-gcc) and crosstool-ng-git.

change ownership of /opt/android-ndk:
```
sudo chmod -R 777 /opt/android-ndk
```
something with android-sdk too.

@Elecdigit
@saeidaalizade
#پاسخ
#کانفیگ_کیوت_برای_اندروید
اول از همه باید کیت اندروید رو دانلود و نصب کنید. ساده ترین راهش اینه از آنلاین اینستالر استفاده کنید و موقع دانلود کامپوننت ها، تیک android arm روبزنید.
تو مرحله بعد باید یه سری پیش نیازها رو دانلود کنید. از قبیل:
JDK(ترجیحا ورژن 8)
android-ndk
android-sdk 
android-sdk-build-tools
android-sdk-platform-tools 
android-platform
اگر در آرچ لینوکس هستید(یا توزیع های مشابه) معمولا هر کدوم از موارد بالا به صورت بسته های مجزا در مخازن اون توزیع ها وجود دارند و فقط کافیه نصبشون کنید. اگر در ویندوز هستید آخرین نسخه های sdk و ndk رو از سایت خود گوگل بگیرید.(دقت کنید آخرین نسخه ها) و سپس از طریق ترمینال (یا اندروید استودیو) اقدام به نصب:
build-tools
platform-tools 
کنید. (روشن کردن فیلتر شکن یادتون نره!)تا اینجای کار پیش نیاز ها رو گرفتید. حالا داخل محیط کیوت کریتور میشید. به بخش:
Tools—>Devices>Android
میشید. اینجا باید آدرس های:
JDK
SDK
NDK
رو ست کنید. در توزیع های لینوکس معمولا این آدرس ها به صورت اتوماتیک ست میشن. در صورتی که این اتفاق نیفتاد، دستی آدرس ها رو ست کنید.
بعدش برید به مسیر:

Tools—>Options—>Kits
میرید. اینجا به صورت خودکار باید کیت اندروید رو شناخته باشه.(باز هم در لینوکس این کار به صورت اتوماتیک رخ میده 😄و در ویندوز اگر اتفاقی نیفتاد مسیرهای ndk , sdk رو به path سیستم باید اضافه کنید)
در نهایت برای اینکه پروژه جاری تونو بتونید ازش خروجی اندروید بگیرید به تب project در سمت چپ کیوت کریتور میرید. کیت اندروید رو اد میکنید و خروجی میگیرید.(تو این مرحله هم فیلترشکن تونو روشن کنید، چون maven میره یه سری فایل دانلود میکنه.) 
برای تست هم(که دیباگ رو هم میتونید داشته باشید در این مرحله) یا گوشی تونو مستقیم با کابل وصل میکنید به سیستم تون یا اینکه باید از ایمولیتور x86 استفاده کنید.(ترجیح خود من گزینه اول هست)
...
و در نهایت برای اینکه بیلدتولزتون متوجه بشه چه کانفیگ هایی رو برای چه معماری هایی اعمال کنه باید اونا رو واسش مشخص کنید. در qmake این کار به سادگی تعریف کردن مشخصه اندروید امکان پذیره:
android {
    message("Android building...")
... # your android specific configs here
}

[system images](https://aur.archlinux.org/packages/?O=0&K=android+system+image)
<img alt="مجوز کریتیو کامنز" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png">
