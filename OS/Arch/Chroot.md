## mount the root partition
`mount /dev/sda8 /mnt`

## chroot
`arch-chroot /mnt`

## install the grub
`grub-install --recheck /dev/sda`

## create grub.cfg
`grub-mkconfig -o /boot/grub/grub.cfg`

Tips
---
If you see 
>Warning: Failed to connect to lvmetad. Falling back to device scanning.
You have to reinstall linux package again to rebuild linux image and bootloader again.