
1. Install linux-lts package:
`sudo pacman -S linux-lts`

1.1 (optional)
`check if kernel, ramdisk and fallback are available in ls -lsha /boot`

2. Remove the standard kernel:
`pacman -Rnsu linux`

3. Update the grub config:
`grub-mkconfig -o /boot/grub/grub.cfg`

4. `reboot`
