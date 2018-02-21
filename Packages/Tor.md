## Install tor package
`sudo pacman -S tor`
  
## Start And Enable Tor service
```
sudo systemctl start tor.service 
sudo systemctl enable tor.service
```
 
## See the service status
`systemctl status tor.service`

If tor not connected yet you have to set up bridges for tor.
### Install obfsproxy:
`sudo pacman -S obfsproxy`
  
### Get bridges via:
1. [torproject.org](https://bridges.torproject.org/)

2. Send an email to bridges@bridges.torproject.org with: `get transport obfs3` title.

### Edit torrc config file
Open `etc/tor/torrc/` and paste the bridges:

```
# Bridge
UseBridges 1
ClientTransportPlugin obfs2,obfs3 exec /usr/bin/obfsproxy managed
ClientTransportPlugin obfs4 exec /usr/bin/obfs4proxy managed
```

### Add the bridges:
# Bridge
```
UseBridges 1
ClientTransportPlugin obfs2,obfs3 exec /usr/bin/obfsproxy managed
ClientTransportPlugin obfs4 exec /usr/bin/obfs4proxy managed
bridge obfs4 195.154.49.15:44705 BACD07DACE996093DC7635F33A98C49918D00FDE cert=xc/wtKNWADfJQf232xSXT0WpzsaINw6fgPvZBy5Rkw42VCtDY8an1QO/ypaZPDug9LutLQ iat-mode=0
bridge obfs4 195.154.49.15:44705 BACD07DACE996093DC7635F33A98C49918D00FDE cert=xc/wtKNWADfJQf232xSXT0WpzsaINw6fgPvZBy5Rkw42VCtDY8an1QO/ypaZPDug9LutLQ iat-mode=0
bridge obfs3 52.196.28.216:52194 CC4CA7A19B11F35E3F94418DD2CEDD2140764D01
bridge obfs3 78.46.188.239:37356 5A2D2F4158D0453E00C7C176978D3F41D69C45DB
bridge obfs3 163.172.161.87:34827 70C720468D057BBF9F59081506D660CE87CA4AD0
bridge obfs3 23.252.105.31:3443 CDAE9FD7710761D1914182F62B1B47F2FBF1FDE1
bridge obfs3 104.236.144.217:57836 5DBF6CA06FB41A55AC92F5BF9211B4B5D5FE36B6
bridge obfs3 128.199.231.217:58002 7019DB88965D148C9826725FD2714EF961939219
bridge obfs3 148.251.156.199:48462 3BECEABD174AE41C5CCC17254A40DD24EC5372CD
```

## Restart the service and read the tor status:
```
sudo systemctl restart tor.service
sudo systemctl status tor.service
```

If you still cannot connect to tor, you have to get anothr obfs3 bridge or install obfs4proxy package and get obfs4 bridges.

## Install obfs4proxy package
`sudo pacman -S obfs4proxy`
 
### Restart the service and read the log
```
sudo systemctl restart tor.service
sudo systemctl status tor.service
```

Try and try until you connect successfully :)

## Extenstion:

### Firefox
You can install foxyproxy and set the patterns.
 
## Use tor in http mode
### Install polipo
`sudo pacman -S polipo`
 
### Go to config file
`sudo vim /etc/polipo/config`
 
### Add these lines(or uncomment theme)
```
socksParentProxy = "localhost:9050"
socksProxyType = socks5
```

### Restart the polipo service
`sudo systemctl restart polipo.service`

* you can use polipo on 127.0.0.1:8123

## Use tor in https mode
### Install privoxy
`sudo pacman -S privoxy`

### Edit config file
`sudo vim /etc/privoxy/config`

And add this line :
`forward-socks5t / 127.0.0.1:9050.`

### Restart the polipo service
`sudo systemctl restart polipo.service`

* you can use polipo on 127.0.0.1:8118

## Use tor in terminal
### Unstall torsocks package
`sudo pacman -S torsocks`

### uncomment these lines in /etc/tor/torsocks.conf:
```
TorAddress 127.0.0.1
TorPort 9050
```

### Use it
torsocks foo






