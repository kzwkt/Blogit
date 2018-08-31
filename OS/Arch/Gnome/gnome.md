## Minimum installation
1. gnome-shell
2. file-roller
3. gnome-backgrounds
4. gnome-color-manager
5. gnome-control-center
6. gnome-getting-started-docs
7. gnome-keyring
8. gnome-menus
9. gnome-session
10. gnome-settings-daemon
11. gnome-shell-extensions
12. gnome-themes-extra
13. gnome-video-effects

## Gnome-Tweaks
Install `gnome-tweaks` for add minimize,maximize buttons to nemo and change themes and icons.
1. theme: Canta, Cursor: Paper, Icons: Papirous
Install dconf-editor for more customization.

## Show login,logout buttons
Install __indicator-session__ from AUR or: **open up the dconf editor, and navigate to the org > gnome > shell key. Check the option “always-show-log-out”.a restart of the shell or a reboot may be required for this option to start working**
Link: [no-logout-option-in-the-gnome-shell](http://www.ryanlerch.org/blog/no-logout-option-in-the-gnome-shell-user-menu/)

## Restart Gnome
Type:
``
Alt+F2
r
Hit Enter Key
``

## install from cinnamon 
if you are in cinnamon, don't install gnome group. instead install:
```
sudo pacman -S gnome-shell gnome-color-manager gnome-control-center gnome-getting-started-docs gnome-keyring gnome-menus gnome-shell-extensions gnome-video-effects
```

## Extensions
1. gnome-shell-extension-persian-calendar-git
2. gnome-shell-extension-dash-to-dock-git
3. indicator-session
4. gnome-shell-extension-lock  

Tip: Install any extension with pacman or an AUR-Helper(for example: __packer gnome-shell-extensions*__), restart the computer, go to tweak-tools->Extensions and you will see them :)