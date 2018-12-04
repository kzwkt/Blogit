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

### AutoLoda playlist in startup
put this command in your .bashrc or .zshrc file:
`sh -c "wmctrl -a urxvt; sleep 1 && xdotool key CTRL+a 0; sleep 1 && xdotool type \"$(mpc load Favorites)\"" `

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
A  client_id is mentionned in the soundcloud API and in forums, but I did not add any of those in the config file, and it works like a charm.

Then you can stream from soundcloud using calls like:

```
mpc load soundcloud://track/
mpc load soundcloud://playlist/
mpc load soundcloud://url/http://soundcloud.com/some/track/or/playlist
```

Tip: For the last case, you can leave off the http:// or http://soundcloud.com/.

### Podcasts

### Links
1. [Music_Player_Daemon](https://wiki.archlinux.org/index.php/Music_Player_Daemon)
2. [how-to-configure-mpd-and-ncmpcpp-on-linux](https://computingforgeeks.com/how-to-configure-mpd-and-ncmpcpp-on-linux/)
3. [Ncmpcpp](https://wiki.archlinux.org/index.php/Ncmpcpp)
4. [after-login-ncmpcpp-shows-empty-library-have-to-restart-mpd-service-manually](https://unix.stackexchange.com/questions/254960/after-login-ncmpcpp-shows-empty-library-have-to-restart-mpd-service-manually)
5. [mpd-soundcloud-support](http://www.runeaudio.com/forum/mpd-soundcloud-support-t944.html)
6. [pyscmd](https://www.kaltpost.de/?page_id=1588)
7. [mpd-soudncloud](http://comments.gmane.org/gmane.comp.audio.musicpd.devel/2218)
8. [soudncloud-support](https://volumio.org/forum/soundcloud-support-t3059.html)
9. [download podcasts with castget](https://raspberryblog.de/?p=663)
