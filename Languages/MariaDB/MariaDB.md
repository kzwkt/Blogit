<h1 align="center">
	<img width="200" src="MariaDB.svg" alt="MariaDB">
	<br>
	<br>
</h1>

### Create new database
```
CREATE DATABASE new_database;
```

### Delete database
```
DROP DATABASE new_database;
```

### Grant privilages to specific user
```
GRANT ALL PRIVILEGES ON * . * TO 'linarcx'@'localhost';
```

### create new user
```
CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';
```

### Show all databases:
```
show databases;
```

### Show all users
```
SELECT User FROM mysql.user;
```
or
```
SELECT host, user, password FROM mysql.user;
```

### show info about specific db
```
desc mysql.db
```

<img alt="مجوز کریتیو کامنز" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png">
</p>