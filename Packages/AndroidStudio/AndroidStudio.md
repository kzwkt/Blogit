<h1 align="center">
	<img width="200" src="AndroidStudio.svg" alt="androidStudio">
	<br>
	<br>
</h1>

## Index
- [Introduction](#Introduction)
- [Install JDK](#installJDK)
    - [Confirm installation](#confirmInstallation)
- [Install android-studio](#installAndroidStudio)
- [Download sdk tools](#downloadSdkTools)
- [sdkmanager](#sdkmanager)
    - [List installed and available packages](#listPackages)
    - [Install packages](#installPackages)
- [Luanch Android-Studio](#luanchAndroidStudio)
- [Update rest of the SDK](#updateSdk)
- [References](#references)


<a name="Introduction">Introduction</a>
------------

In this tutorial we want to separately download SDK to use simultaneously in linux and windows.

### <a name="installJDK">Install JDK</a>
```
sudo pacman -S jdk8-openjdk 
```
It will install:

- java-environment-common-3-1
- java-runtime-common-3-1
- jre8-openjdk-8.u144-1 
- jre8-openjdk-headless-8.u144-1
- jdk8-openjdk-8.u144-1


#### <a name="confirmInstallation">Confirm installation</a>
```
archlinux-java status
or
java -version
```

### <a name="installAndroidStudio">Install android-studio from [archlinuxcn repository ](http://repo.archlinuxcn.org/)</a>
```
sudo pacman -S android-studio
```

### <a name="downloadSdkTools">Download [sdk tools](https://developer.android.com/studio/index.html)</a>

Download SDK-tools from link and Extract it wherever you want. For example in:
```/mnt/D/Software/IDE/Android-Studio/SDK```


### <a name="sdkmanager">sdkmanager</a>
> The sdkmanager is a command line tool that allows you to view, install, update, and uninstall packages for the Android SDK. If you're using Android Studio, then you do not need to use this tool and you can instead manage your SDK packages from the IDE.
The sdkmanager tool is provided in the Android SDK Tools package (25.2.3 and higher) and is located in android_sdk/tools/bin/.
Go to /tools folder. 


Change directory to SDK-Path and run `sdkmanagere`. to use sdkmanager you have to [set-up tor with https feature via privoxy package](https://github.com/LinArcX/Nokat/blob/master/Packages/Tor).

#### <a name="listPackages">List installed and available packages</a>
```
./sdkmanager --list --proxy=http --proxy_host=127.0.0.1 --proxy_port=8118
```

If you see warnings like this:
> Warning: Observed package id 'platforms;android-27' in inconsistent location '/mnt/D/Software/IDE/Android-Studio/Android-SDK/platforms/android-8.1.0' (Expected '/mnt/D/Software/IDE/Android-Studio/Android-SDK/platforms/android-27')

Fix them and go to the next step.

If everything is ok, the output is simillar to:

>extras;android;m2repository                                                              | 47.0.0       | Android Support Repository                                          
and
build-tools;27.0.3                                                                       | 27.0.3       | Android SDK Build-Tools 27.0.3    

#### <a name="installPackages">Install packages</a>
The following packages should be installed:

* android-sdk
* android-platform
* android-sdk-platform-tools
* android-sdk-build-tools                                  

```
./sdkmanager "extras;android;m2repository" "build-tools;27.0.3" --proxy=http --proxy_host=127.0.0.1 --proxy_port=8118
```

### <a name="luanchAndroidStudio">Luanch android studio</a>
and set proxy in http-proxy tab(if you're using tor, you have to convert socks to https via privoxy)

### <a name="updateSdk">Update rest of the SDK</a>
go to android-sdk tab and update another parts of sdk.

<a name="references">References</a>
-----
1. [install-SDK-windows-android](http://androidcode.ir/post/install-SDK-windows-android-lynda-%D9%86%D8%B5%D8%A8-%D9%88%DB%8C%D9%86%D8%AF%D9%88%D8%B2)

2. [sdkmanager](https://developer.android.com/studio/command-line/sdkmanager.html)

<img alt="مجوز کریتیو کامنز" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png">
</p>