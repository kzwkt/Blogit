## Install the virtualbox package
`sudo pacman -S virtualbox`

## Install virtualbox-host* packages
* for linux kernel choose `virtualbox-host-modules-arch`
* for other kernels choose `virtualbox-host-dkms`
* It is also necessary to install the appropriate headers package(s) for your installed kernel(s): linux-headers or linux-lts-headers. 
* When either VirtualBox or the kernel is updated, the kernel modules will be automatically recompiled thanks to the DKMS Pacman hook.
               
## Start and enable service
```
sudo systemctl start systemd-modules-load.service
sudo systemctl enable systemd-modules-load.service
```

if some module does not load properly create this file:
`sudo vim /etc/modules-load.d/virtualbox.conf`
and paste these moduels on them:

```
vboxdrv
vboxnetadp
vboxnetflt
vboxpci
```
or:
```
sudo su
echo -e "vboxdrv\nvboxnetflt\nvboxnetadp\nvboxpcic" > /etc/modules-load.d/virtualbox.conf
```
## Reload vboxreload
vboxreload
## Add your user to vboxgroup
`sudo gpasswd -a $USER vboxusers`

TroubleShooting
------
If see below error:
> VBoxClient: the virtualbox kernel service is not running

it might be some module that don't load properly. they are reside in either two files:
به این دلیل ممکنه پیش بیاد که ماژول های virtualbox که در یکی از دو فایل زیر وجود داره در سیستم شما لود نشده باشن:

```
vim /usr/lib/modules-load.d/virtualbox-guest-dkms.conf
vim /etc/modules-load.d/virtualbox.conf 
```
Fix those files and try again. and finally reload the service:

`sudo systemctl restart systemd-modules-load.service`

## TroubleShooting
if you see some errors like:
```
[\u@\h \W]$ sudo systemctl status systemd-modules-load.service
[sudo] password for liveaseman: 
● systemd-modules-load.service - Load Kernel Modules
   Loaded: loaded (/usr/lib/systemd/system/systemd-modules-load.service; static; vendor preset: disabled)
   Active: failed (Result: exit-code) since Wed 2018-07-11 13:21:39 +0430; 3min 4s ago
     Docs: man:systemd-modules-load.service(8)
           man:modules-load.d(5)
  Process: 28681 ExecStart=/usr/lib/systemd/systemd-modules-load (code=exited, status=1/FAILURE)
 Main PID: 28681 (code=exited, status=1/FAILURE)

Jul 11 13:21:39 Aseman systemd-modules-load[28681]: Failed to lookup alias 'vboxpci': Function not implemented
Jul 11 13:21:39 Aseman systemd-modules-load[28681]: Failed to lookup alias 'vboxnetadp': Function not implemented
Jul 11 13:21:39 Aseman systemd-modules-load[28681]: Failed to lookup alias 'vboxnetflt': Function not implemented
Jul 11 13:21:39 Aseman systemd-modules-load[28681]: Failed to lookup alias 'vboxdrv': Function not implemented
Jul 11 13:21:39 Aseman systemd-modules-load[28681]: Failed to lookup alias 'vboxnetflt': Function not implemented
Jul 11 13:21:39 Aseman systemd-modules-load[28681]: Failed to lookup alias 'vboxnetadp': Function not implemented
Jul 11 13:21:39 Aseman systemd-modules-load[28681]: Failed to lookup alias 'vboxpcic': Function not implemented
Jul 11 13:21:39 Aseman systemd[1]: systemd-modules-load.service: Main process exited, code=exited, status=1/FAILURE
Jul 11 13:21:39 Aseman systemd[1]: systemd-modules-load.service: Failed with result 'exit-code'.
Jul 11 13:21:39 Aseman systemd[1]: Failed to start Load Kernel Modules.
[\u@\h \W]$ 
```
be sure to install only one kernel(linux or linux-ltr). then re-install virtualbox, virtualbox-host-dkms, reboot the system and restart the service.
