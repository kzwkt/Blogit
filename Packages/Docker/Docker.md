<h1 align="center">
	<img width="200" src="AndroidStudio.svg" alt="androidStudio">
	<br>
	<br>
</h1>

## Index
- [Introduction](#Introduction)
- [Install JDK](#installDocker)
    - [Confirm installation](#confirmInstallation)
- [Start Service](#startService)
- [Change owner to docker group](#changeOwnerToDocker)
- [Set Dns](#setDns)


<a name="Introduction">Introduction</a>
------------

In this tutorial we want to install and configure docker in arch linux.

### <a name="installDocker">Install</a>
```
sudo pacman -S docker
```

#### <a name="confirmInstallation">Confirm installation</a>
```
docker --version
```

### <a name="startService">Enable/Start the service</a>
```
sudo systemctl enable docker.service
sudo systemctl start docker.service
```

### <a name="changeOwnerToDocker">Change owner to docker group</a>

```
sudo su
usermod -a -G docker linarcx
```


### <a name="setDns">Set DNS</a>
Docker is filtered in Iran. so you have to use this dns.(set it through you model settings):
```
178.22.122.100
```
1. https://shecan.ir/

<img alt="مجوز کریتیو کامنز" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png">
</p>