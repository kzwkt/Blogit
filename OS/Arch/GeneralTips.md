### Permanently export a variable

- ~/.bashrc
When you open any terminal window this file will be run. Therefore, if you wish to have a permanent environment variable in all of your terminal windows you have to add the following line at the end of this file:
export DISPLAY=0

- ~/.profile
Same as bashrc you have to put the mentioned command line at the end of this file to have your environment variable in the every log in of your OS.

- /etc/environment
If you want your environment variable in every windows or application ( not just terminal window ) you have to edit this file. Add the following command at the end of this file:
DISPLAY=0
Note that in this file you do not have to write export command

Normally you have to restart your computer to apply this changes. But you can apply changes in bashrc and profile by these commands:

```
source ~/.bashrc
source ~/.profile
```

> Add varialbe this format: `ABC="123";`

### Create xorg.conf
xorg.conf

#### Enable Hybdir Graphics (Prime)
1. see all graphic cards:
     `lspci | grep VGA`
the output is something like this:
```
00:02.0 VGA compatible controller: Intel Corporation 2nd Generation Core Processor Family Integrated Graphics Controller (rev 09)
01:00.0 VGA compatible controller: NVIDIA Corporation GF108M [GeForce GT 540M] (rev a1)
```
2. Install the ‍‍`mesa` package, which provides the DRI driver for 3D acceleration. 
3. Nvidia: For the DDX driver (which provides 2D acceleration in Xorg), install the `xf86-video-nouveau` package.
4. Intel: For the DDX driver (which provides 2D acceleration in Xorg), install the `xf86-video-intel` package.
5. `xrandr --listproviders`

> Providers: number : 2
Provider 0: id: 0x8f cap: 0xb, Source Output, Sink Output, Sink Offload crtcs: 3 outputs: 5 associated providers: 1 name:Intel
Provider 1: id: 0x62 cap: 0x7, Source Output, Sink Output, Source Offload crtcs: 2 outputs: 1 associated providers: 1 name:nouveau

if you see any output except above output create `20-intel.conf` and `20-nouveau.conf` in `/etc/X11/xorg.conf.d/ ` and put these values on them:
20-intel.conf:
```
Section "Device"
        Identifier  "Intel Graphics"
        Driver      "intel"
        Option      "AccelMethod"  "sna"
        Option      "TearFree" "true"
EndSection
```
20-nouveau.conf:
```
Section "Device"
        Identifier "Nvidia card"
        Driver "nouveau"
EndSection
```
restart the computer and go to next step.

6. `xrandr --setprovideroffloadsink nouveau Intel`
7. `DRI_PRIME=1 glxinfo | grep "OpenGL renderer"`
8. Run Your App with: `DRI_PRIME=1 <application_executable>`

Tips: All nouveau kernel modules are here : 
```
usr/lib/modules/4.1.13-1-lts/kernel/drivers/gpu/drm/nouveau/
usr/lib/modules/4.1.13-1-lts/kernel/drivers/gpu/drm/nouveau/nouveau.ko.gz
```

#### Teraing Scree issue
> vsync prevents tearing, not causes it. Tearing happens when your frame rate is higher than the refresh rate of the monitor. the 60.1Hz might be the cause, but I highly doubt that vsync is.

##### Disable Vertical Synchronization (VSYNC)
 Create this .drirc in your home directory:
 ```
 <device screen="0" driver="dri2">
	<application name="Default">
		<option name="vblank_mode" value="0"/>
	</application>
</device>
```
and Generate `20-intel.conf` file to take advantage of some driver options:
`sudo vim /etc/X11/xorg.conf.d/20-intel.conf`:
and put these values in it:
```
Section "Device"
        Identifier  "Intel Graphics"
        Driver      "intel"
        #Option      "DRI" "3"
        Option      "AccelMethod"  "sna" //older method: uxa
        Option      "TearFree" "true"
EndSection
```
Bad manner:
add these lines to /etc/environment:
```
CLUTTER_PAINT=disable-clipped-redraws:disable-culling
CLUTTER_VBLANK=True
```

#### Test Tearing 
https://www.youtube.com/watch?v=5xkNy9gfKOg

#### Modesettings
just install: `sudo pacman -S xf86-video-intel mesa`

Resources
---
1. http://bbs.archusers.ir/viewtopic.php?id=637
2. http://bbs.archusers.ir/viewtopic.php?id=73
3. http://dcprom0.blogspot.com/2012/08/disabling-vsync-on-intel-integrated-hd.html?m=1