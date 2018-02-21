Install the virtualbox package.

     for linux kernel choose virtualbox-host-modules-arch
    for other kernels choose virtualbox-host-dkms
        It is also necessary to install the appropriate headers package(s) for your installed kernel(s): linux-headers or linux-lts-headers. [1] When either VirtualBox or the kernel is updated, the kernel modules will be automatically recompiled thanks to the DKMS Pacman hook.
        
        
start and enable this service:
sudo systemctl status systemd-modules-load.service
if some module does not load properly create this file:
/etc/modules-load.d/virtualbox.conf
and paste these moduels on them:

vboxdrv
vboxnetadp
vboxnetflt
vboxpci
then reload:
vboxreload
and add your user to vboxgroup:
sudo gpasswd -a $USER vboxusers

خطای:

VBoxClient: the virtualbox kernel service is not running

به این دلیل ممکنه پیش بیاد که ماژول های virtualbox که در یکی از دو فایل زیر وجود داره در سیستم شما لود نشده باشن:

vim /usr/lib/modules-load.d/virtualbox-guest-dkms.conf
vim /etc/modules-load.d/virtualbox.conf 

این فایل ها رو اصلاح و سپس پست های 6# و 7# همین تاپیک رو پیگیری کنید.

then reload the service:
sudo systemctl restart systemd-modules-load.service
