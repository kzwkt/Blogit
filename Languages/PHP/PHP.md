<h1 align="center">
	<img width="200" src="PHP.svg" alt="php">
	<br>
	<br>
</h1>

### Apache
First install __apache__ package:
```
sudo pacman -S apache
```
Then enable it's service and start:
```
sudo systemctl start httpd.service
sudo systemctl enable httpd.service
```
check the service status after above instructions.

tip: if you get some errors when get status of the service like this:
```
httpd[15353]: AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using fe80::b1e7:b49e:a1a>
```
then you must set the server name in __/etc/httpd/conf/httpd.conf__ file:
```
sudo vim /etc/httpd/conf/httpd.conf  
```

Find ServerName and uncomment it to :
```
ServerName localhost
```
#### Edit httpd.conf
```
sudo vim /etc/httpd/conf/httpd.conf  
```
Change DocumentRoot from : **"/srv/http"** to __"/mnt/D/Document/WorkSpace/PHP"__
and __<Directory>__ to top value.


### MySql(MariaDB implementation)
```
sudo pacman -S mariadb
```

#### pre-configure mariaDB
```
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
```

#### Start and enable it's service
```
sudo systemctl start mariadb.service
sudo systemctl enable mariadb.service
```

#### Secure MariaDB
```
mysql_secure_installation
```

#### Login to root
```
mysql -u root -p
```

#### add new user
```
CREATE USER 'USER'@'localhost' IDENTIFIED BY 'PASSWORD';
GRANT ALL PRIVILEGES ON mydb.* TO 'monty'@'localhost';
FLUSH PRIVILEGES;
quit
```

### Php and Extensions

```
sudo pacman -S php php-apache phpmyadmin
```

#### edit httpd.conf
first comment this line:
```
LoadModule mpm_event_module modules/mod_mpm_event.so
```
then add these lines:
```
# Supplemental configuration
# PHP 7
Include conf/extra/php7_module.conf

LoadModule mpm_prefork_module modules/mod_mpm_prefork.so
LoadModule php7_module modules/libphp7.so

AddHandler php7-script php
```
then restart httpd service:
```
systemctl restart httpd
```

#### Phpmyadmin
edit this file:
```
sudo vim /etc/php/php.ini
```

and uncomment these lines:
```
extension=bz2.so
extension=mysqli.so
```
save and exit and create another config file called phpmyadmin.conf:
```
sudo vim /etc/httpd/conf/extra/phpmyadmin.conf
```
and paste these lines to it:
```
Alias /phpmyadmin "/usr/share/webapps/phpMyAdmin"
 <Directory "/usr/share/webapps/phpMyAdmin">
  DirectoryIndex index.php
  AllowOverride All
  Options FollowSymlinks
  Require all granted
 </Directory>
 ```
 save and exit and open apache conf file:
 ```
 sudo vim /etc/httpd/conf/httpd.conf
 ```
add the following line:
```
Include conf/extra/phpmyadmin.conf
```
restart httpd.service:
```
sudo systemctl restart httpd
```
go to: __http://IP-Address/phpmyadmin__

### Config vscode for php
install these extensions first:
1. PHP IntelliSense
2. PHP Debug
3. Code Runner
4. HTML CSS Support

#### Debuggin
XDebug allows you to easily debug php code using modified var_dump() function. Install xdebug and uncomment the lines at /etc/php/conf.d/xdebug.ini:
```
zend_extension=xdebug.so
xdebug.remote_enable=on
xdebug.remote_host=127.0.0.1
xdebug.remote_port=9000
xdebug.remote_handler=dbgp
```
and add below line to end of the file:
```
xdebug.remote_autostart=on
```
restart the httpd.service. go to debug tab in vscode, click on __Open Luanch.json__ and create a launcher for php. press f5 and refresh your page.


<a name="references">References</a>
-----
1. [Install Lamp on Arch](https://www.linode.com/docs/web-servers/lamp/how-to-install-a-lamp-stack-on-arch-linux/)
2. [Wiki Apache](https://wiki.archlinux.org/index.php/Apache_HTTP_Server)
3. [Wiki MySql](https://wiki.archlinux.org/index.php/MySQL)
4. [Wiki Php](https://wiki.archlinux.org/index.php/PHP)
5. [Wiki PhpMyAdmin](https://wiki.archlinux.org/index.php/phpMyAdmin)
6. [Lamp Stack On Arch](https://www.ostechnix.com/install-apache-mariadb-php-lamp-stack-on-arch-linux-2016/)
7. [phpmyadmin on arch](http://fos.cmb.ac.lk/blog/lamp-phpmyadmin-arch-linux-installation-guide/)
8. [Wiki Persian Lamp](http://wiki.archusers.ir/index.php/LAMP)
9. [Php Debugging](https://code.visualstudio.com/docs/languages/php)


<img alt="مجوز کریتیو کامنز" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png">