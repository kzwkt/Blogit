## edit build.sh
open it and change __iso_name__ and __iso_label__ to whatever name you want.

## edit pacman.conf
to add any repo(including: custom_reop, archlinuxcn, multilib, etc..) you have to edit this file and add the appropriate mirror list.

## edit packages.both
open pkgbrowser, sort packages according to: __Repository__ and __status__ to see all installed package. copy all of them(or whatever you want) and paste them in __packages.both__ file.

## edit mkinitcpio.conf
remove **pxe** and __pcmcia__.

### tip 1
every time you change list of packages or add some config files you have to remove two directories and then rebuild the iso:
1. work directory
2. out direcotory

## Create skel direcotory 
for placing your custom home .config files from host OS to be copy to you archiso you have to make this directory in:
__airootfs/etc/skel/__