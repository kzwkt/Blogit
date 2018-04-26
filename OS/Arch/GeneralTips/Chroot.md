For some reasons like:
- system maintainance
- fix grub
- reinstall kernel
you must enter chroot and fix the system.

### Create an arch bootable iso
with rufus in window and unetbootin in gnu/linux distributions.

### Mount the root partition
`mount /dev/sda8 /mnt`

### Chroot
`arch-chroot /mnt`

in this phase you have acces to all operations like update pacman, fix grub, reinstall kernel and more. for example we show you how fix grub and reinstall kernel.

#### Install the grub
`grub-install --recheck /dev/sda`

#### Create grub.cfg
`grub-mkconfig -o /boot/grub/grub.cfg`


#### Reinstall kernel
`sudo pacman -S linux-lts`

after doing something in chroot mode, you have to exit from it:
`exit`
and release the mounted partition:
`umount -R /mnt`
reboot and go to main os:
`reboot`

Tips
---
If you see 
>Warning: Failed to connect to lvmetad. Falling back to device scanning.
You have to reinstall linux package again to rebuild linux image and bootloader again.