### Packages
1. mpd
2. mpc

### FrontEnds
1. ncmpcpp

### Tips

#### Media player controls
You have to use mpc to control the musics. Add these lines to ~/.config/i3/config:
```
bindsym XF86AudioPause exec mpc toggle                                                                                             bindsym XF86AudioNext exec mpc next                                                                                                bindsym XF86AudioPrev exec mpc prev                                                                                                bindsym Alt+= exec mpc seek +10
bindsym Control+Alt+= exec mpc seek -10
```
and alse this line:
`exec_always ncmpcpp`
For Other DE's or WM's find it out yourself:)


### Is database Full?
`mpc -h hostname -p port ls`

### SoundCloud
mpd install by default supporting soundcloud plugin, to ensure:
```
mpd --version
```
And see the output. now you can load plalylists/tracks like this:
```
mpc load soundcloud://url/soundcloud.com/yoann-minkoff/sets/yoann-minkoff-ep
mpc play
```
A client_id is mentionned in the soundcloud API and in forums, but I did not add any of those in the config file, and it works like a charm.

### Podcasts

### Links
1. [Music_Player_Daemon](https://wiki.archlinux.org/index.php/Music_Player_Daemon)
2. [how-to-configure-mpd-and-ncmpcpp-on-linux](https://computingforgeeks.com/how-to-configure-mpd-and-ncmpcpp-on-linux/)
3. [Ncmpcpp](https://wiki.archlinux.org/index.php/Ncmpcpp)
4. [after-login-ncmpcpp-shows-empty-library-have-to-restart-mpd-service-manually](https://unix.stackexchange.com/questions/254960/after-login-ncmpcpp-shows-empty-library-have-to-restart-mpd-service-manually)
5. [mpd-soundcloud-support](http://www.runeaudio.com/forum/mpd-soundcloud-support-t944.html)
