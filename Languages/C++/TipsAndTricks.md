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
