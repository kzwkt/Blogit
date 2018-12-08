### libtorrent
A library to work with torrents.

#### android
1. first clone the repo: `git clone https://github.com/arvidn/libtorrent.git`
2. to generate the build system: `./autotool.sh`
3. create a debug build: `./configure --enable-debug=yes`
4. create a release build: `./configure --enable-debug=no`
5. build: `./configure --disable-debug && make clean && make`
6. build for android arm: ```./configure --host=aarch64-linux-android --prefix=/opt/android-ndk/toolchains/arm-linux-androideabi-4.9 --enable-static --disable-shared --disable-pool-allocators --disable-deprecated-functions && make V=1 && make instal```

#### Tips:
1. To building for android, you must install android-ndk on your system and setup toolchain for it.
2. You can change the prefix to install the library in whatever you like.(for example: `--prefix=~/libs`)
3. To see other option when building, type: `./configure --help`

#### See more
1. [build libtorrent](https://www.libtorrent.org/building.html)