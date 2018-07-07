### add external libraries to current project
1. if the library packaged and ready to install, first install it via your package manager, then go to terminal and search for its existence:
```
pkg-config --list-all | grep Magick++  
```
if everything is ok, go to qt-creator and right click on the project name, add library and choose system package, enter the package name and finally something this may add to your qmake file:
```
unix: CONFIG += link_pkgconfig
unix: PKGCONFIG += Magick++
```

2. if the library not present in your repository, you muse compile it by hand. for most cases:
```
./configure
make 
sudo make install
```
and it create .h, .a, .so, .pc, .. files and locate them in oppropirate locations in your system. for example after compile libcalendars it will put the output files in these directories:
```
 ❯ locate libcalendar                                                                                                               

/usr/local/include/libcalendars
/usr/local/include/libcalendars/cl-calendars.h
/usr/local/include/libcalendars/cl-export.h
/usr/local/include/libcalendars/cl-gregorian.h
/usr/local/include/libcalendars/cl-islamic-civil.h
/usr/local/include/libcalendars/cl-jewish.h
/usr/local/include/libcalendars/cl-julian.h
/usr/local/include/libcalendars/cl-milankovic.h
/usr/local/include/libcalendars/cl-solar-hijri.h
/usr/local/lib/libcalendars.a
/usr/local/lib/libcalendars.la
/usr/local/lib/libcalendars.so
/usr/local/lib/libcalendars.so.1
/usr/local/lib/libcalendars.so.1.0.0
/usr/local/lib/pkgconfig/libcalendars.pc

```
as you can see, a .pc file present in /usr/local/lib/pkgconfig/ directory and according to pkg-config man page these locations alwayes search for those files:
>  pkg-config retrieves information about packages from special metadata files. These files are named after the package, and has a  .pc  exten‐
       sion.   On most systems, pkg-config looks in /usr/lib/pkgconfig, /usr/share/pkgconfig, /usr/local/lib/pkgconfig and /usr/local/share/pkgconfig for these files.  It will additionally look in the colon-separated (on Windows, semicolon-separated) list of  directories  specified  by
       the PKG_CONFIG_PATH environment variable.

Tips: in some distro's like arch pkg-config only see __/usr/lib/pkgconfig__ and __/usr/share/pkgconfig__. for see other two locations you must add them manually in __/etc/environment__ :
```
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig"
```

## Missing Separator Error in Makefile
I am working on Qt 4.7.2 on Windows. I have generated Makefile, Makefile.Debug and Makefile.Release. However, when I try to use mingw32-make to build an executable, I get the following error:

```
mingw32-make -f Makefile.Debug all
mingw32-make[1]: Entering directory `C:/Qt/4.7.2/src/plugins/sqldrivers/mysql'
Makefile.Debug:61: *** missing separator.  Stop.
mingw32-make[1]: Leaving directory `C:/Qt/4.7.2/src/plugins/sqldrivers/mysql'
mingw32-make: *** [debug-all] Error 2
```

Answer:
Not sure how you generated the makefiles, but they're probably nmake makefiles, not mingw makefiles. You can tell by looking at the top of Makefile.Debug. If you see "CXX = cl", not "CXX = g++", then that's your problem.

In my case, I hit this error when trying to compile the Qt SDK itself. Long story short: I needed to specify "-platform win32-g++" on the configure command line (it defaulted to win32-msvc).or:
```
qmake -spec E:\Software\Installed\Qt\5.11.1\msvc2017_64\mkspecs\win32-g++
```
https://stackoverflow.com/questions/5303634/qmake-qmakespec-has-not-been-set

## Comile libraries with cmake
```
mkdir Release
cd Release
cmake -DCMAKE_BUILD_TYPE=Release ..
make
````
And for Debug (again from the root of your project):
```
mkdir Debug
cd Debug
cmake -DCMAKE_BUILD_TYPE=Debug ..
make
```

## Compile libraries
```
qmake.exe E:\Libraries\qx\QxOrm\QxOrm.pro -spec win32-msvc CONFIG+=debug CONFIG+=qml_debug
jom.exe qmake_all
```

## Compile libraries with msbuild from terminal
```
MSBuild foo.sln /t:Build,Compile /p:Configuration=Release /p:Platform=x64  /property:WarningLevel=2;OutDir=debug\ /m
```
if you make them with vs compiler, the .sln files will create. you can open visual studio and build the soulotion.
https://stackoverflow.com/questions/7724569/debug-vs-release-in-cmake

## Conan
```
conan install -s compiler="gcc" -s os="Windows" -s os_build="Windows" -s os_target="Android" -s arch_target="armv7" -s compiler.libcxx="libstdc++" -s compiler.version="5.3" --build zlib ..
```
