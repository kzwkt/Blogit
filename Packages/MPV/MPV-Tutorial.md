### install mpv
`sudo pacman -S mpv`

### create config file
`mkdir ~/.config/mpv`

### Enable Hardware accelartion
The choice varies depending on your video card vendor:
- For Intel Graphics use VA-API.
- For NVIDIA cards use VDPAU.

There are also two specific types of drivers for VA-API and VDPAU:
- libva-vdpau-driver, which uses VDPAU as a backend for VA-API.
- libvdpau-va-gl, which uses VA-API as a backend for VDPAU.

#### VAAPI
- Intel(You have to install `mesa` before.)
    -`sudo pacman -S libva-intel-driver `

Use `vainfo` to verification(install `libva-utils` before it.)

#### VDPAU
- Intel
`sudo pacman -S libvdpau-va-gl`

Use `vdpauinfo` to verify VDPAU.
`DRI_PRIME=1 vdpauinfo`

* mpv.conf will contain the majority of mpv's settings.
* input.conf will just contain key bindings.