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
- [Login](#login)
- [Change Image Location](#changeImageLocation)
- [Change Storage Driver](#changeStorageDriver)


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

### <a name="login">Login</a>
```docker login -u username -p password```

it will show something like this:
```
docker login
Authenticating with existing credentials...
WARNING! Your password will be stored unencrypted in /home/linarcx/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store
Login Succeeded
```

### <a name="changeImageLocation">Change Image Location</a>
First Create this file:
```/etc/systemd/system/docker.service.d/docker-storage.conf```

And paste these lines of code into it:
```
[Service]
ExecStart= 
ExecStart=/usr/bin/dockerd --data-root=/path/to/new/location/docker -H fd://
```

### <a name="changeStorageDriver">change Storage Driver</a>

if you see some errors like this:
```
docker run -it ubuntu /bin/bash                                             
docker: Error response from daemon: error creating overlay mount to /mnt/D/Docker/overlay2/ba10e18
03d03c534ee89ed12e0c0b9da967a5ff638f84cf7b9b97bfaf2691bfb-init/merged: invalid argument.          
See 'docker run --help'. 
```
you have to change storage driver to __Storage driver__. for this, edit(or create): __/etc/docker/daemon.json__ and put it:
```
{
  "storage-driver": "overlay2"
}
```

1. https://shecan.ir/
2. https://bbs.archlinux.org/viewtopic.php?id=167845
3. https://github.com/docker/hub-feedback/issues/369
4. https://wiki.archlinux.org/index.php/Docker
5. https://stackoverflow.com/questions/36663742/docker-unauthorized-authentication-required-upon-push-with-successful-login#39624423
6. https://stackoverflow.com/questions/42248571/cannt-run-or-build-docker-images-on-centos-7

<img alt="مجوز کریتیو کامنز" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png">
</p>