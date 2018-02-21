Introduction
------------

in this tutorial we want to seperately download SDK to use simultansely in linux and windows.

## install jdk
``` markdown
sudo pacman -S jdk8-openjdk 
```
It will install:

- java-environment-common-3-1
- java-runtime-common-3-1
- jre8-openjdk-8.u144-1 
- jre8-openjdk-headless-8.u144-1
- jdk8-openjdk-8.u144-1


### confirm installation
```
archlinux-java status
or
java -version
```

## Install android-studio from [archlinuxcn repository ](http://repo.archlinuxcn.org/):
```
sudo pacman -S android-studio
```

## [Download sdk tools](https://developer.android.com/studio/index.html):

Extract it wherever you want. for example in:
```/mnt/D/Software/IDE/Android-Studio/SDK```

Change directory to sdk path and run sdkmanagere.


## work with sdkmanager
> The sdkmanager is a command line tool that allows you to view, install, update, and uninstall packages for the Android SDK. If you're using Android Studio, then you do not need to use this tool and you can instead manage your SDK packages from the IDE.
The sdkmanager tool is provided in the Android SDK Tools package (25.2.3 and higher) and is located in android_sdk/tools/bin/.
Go to /tools folder. 

to use sdkmanager you have to set-up tor with https feature via privoxy package. see ...
List installed and available packages:
./sdkmanager --list --proxy=http --proxy_host=127.0.0.1 --proxy_port=8118

if you see warnings like this:
Warning: Observed package id 'platforms;android-27' in inconsistent location '/mnt/D/Software/IDE/Android-Studio/Android-SDK/platforms/android-8.1.0' (Expected '/mnt/D/Software/IDE/Android-Studio/Android-SDK/platforms/android-27')
first fix them and continue to next step.

to install packages for example:
extras;android;m2repository                                                              | 47.0.0       | Android Support Repository                                          
and
build-tools;27.0.3                                                                       | 27.0.3       | Android SDK Build-Tools 27.0.3                                      

./sdkmanager "extras;android;m2repository" "build-tools;27.0.3" --proxy=http --proxy_host=127.0.0.1 --proxy_port=8118


luanch android studio and set proxy in http-proxy tab(if use tor you have to convert socks to https via privoxy)
go to android-sdk tab and update another parts of sdk.

download android-sdkA, android-platform, android-sdk-platform-tools, android-sdk-build-tools 
from:https://wiki.archlinux.org/index.php/Android#Manual_SDK_installation
unzip theme and put theme in specific folder in your hardDrive.
follow these instructions:
http://androidcode.ir/post/install-SDK-windows-android-lynda-%D9%86%D8%B5%D8%A8-%D9%88%DB%8C%D9%86%D8%AF%D9%88%D8%B2
https://developer.android.com/studio/command-line/sdkmanager.html
