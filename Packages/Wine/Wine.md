<h1 align="center">
	<img width="200" src="Wine.svg" alt="Vim">
	<br>
	<br>
</h1>

## Index
- [Installation](#Installation)
- [Running Wine under a separate user account](#RunningWineUnderASeparateUserAccount)
- [Rootless Xorg](#RootlessXorg)


### <a name="Installation">Installation</a>
install these packages:
1. wine_staging
2. wine_gecko
3. wine-mono
4. winetricks

### <a name="RunningWineUnderASeparateUserAccount">Running Wine under a separate user account</a>

It may be desirable to run Wine under a specifically created user account in order to reduce concerns about Windows applications having access to your home directory.

First, create a user account for Wine:

`useradd -m -s /bin/bash wineuser`

Now switch to another TTY and start your X WM or DE as you normally would or keep reading...
Note: The following approach only works when enabling root for Xorg. See <a name="RootlessXorg">Rootless Xorg</a> for more information.

Afterwards, in order to open Wine applications using this new user account you need to add the new user to the X server permissions list:

`xhost +SI:localuser:wineuser`

Finally, you can run Wine via the following command, which uses env to launch Wine with the environment variables it expects:

`sudo -u wineuser env HOME=/home/wineuser USER=wineuser USERNAME=wineuser LOGNAME=wineuser wine arguments`

It is possible to automate the process of running Windows applications with Wine via this method by using a shell script as follows:

```
/usr/local/bin/runaswine
----------------------------

#!/bin/bash
xhost +SI:localuser:wineuser
sudo -u wineuser env HOME=/home/wineuser USER=wineuser USERNAME=wineuser LOGNAME=wineuser wine "$@"
```

Wine applications can then be launched via:

`runaswine "C:\path\to\application.exe"`


### <a name="RootlessXorg">Rootless Xorg</a>

Xorg may run with standard user privileges with the help of systemd-logind(8). The requirements for this are:

- Starting X via xinit; display managers are not supported
- Kernel mode setting; implementations in proprietary display drivers fail auto-detection and require manually setting needs_root_rights = no in /etc/X11/Xwrapper.config.

If you do not fit these requirements, re-enable root rights in /etc/X11/Xwrapper.config:

```
/etc/X11/Xwrapper.config
-------------------------

needs_root_rights = yes
````

Resources
---
1. https://wiki.archlinux.org/index.php/Wine
2. https://wiki.archlinux.org/index.php/Xorg#Rootless_Xorg



