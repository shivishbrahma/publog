---
layout: post
title: Custom WAMMP Setup in Windows
date: '2023-04-30 22:55:06 +0530'
tags: windows apache php
---

## Apache server installation

Download httpd from <https://www.apachelounge.com/download/>
and unzip `httpd-**.zip`

### Go to directory and install as service

```bat
cd C:\Apache24\bin\
httpd -k install
```

Apache2.4 should be available in Services

## Php installation

- Download php file from <https://windows.php.net/download#php-8.1>
- Rename the folder to php81 and place it in C:\Apps

or

- Set `ChocolateyToolsLocation` to `C:\Apps`
- Install php using choco
  
  ```bash
  choco install php --version=8.1.22 --package-parameters='"/ThreadSafe"'
  ```

- Set extension directory
  
   ```apache
  extension_dir = "ext"
   ```

- Copy `C:\Apps\php81\php.ini-production` into `C:\Apps\php81\php.ini`
- Enable the extensions by commenting following lines

   ```apache
  extension=curl
  extension=ftp
  extension=fileinfo
  extension=gd
  extension=gettext
  extension=mbstring
  extension=exif      ; Must be after mbstring as it depends on it
  extension=mysqli
  extension=openssl
  extension=pdo_mysql
  extension=pdo_sqlite
  extension=soap
   ```

### Configuring in httpd server

- Prepare a httpd-php.conf in conf/extra and include in conf/httpd.conf

  ```apache
  Include conf/extra/httpd-php.conf
  ```

   ```apache

  #

  # PHP-Module setup

  #

  LoadFile "C:/Apps/php81/php8ts.dll"
  LoadFile "C:/Apps/php81/libpq.dll"
  LoadFile "C:/Apps/php81/libsqlite3.dll"
  LoadModule php_module "C:/Apps/php81/php8apache2_4.dll"

  <FilesMatch "\.php$">
      SetHandler application/x-httpd-php
  </FilesMatch>
  <FilesMatch "\.phps$">
      SetHandler application/x-httpd-php-source
  </FilesMatch>

  <IfModule php_module>
      PHPINIDir "C:/Apps/php8"
  </IfModule>

  <IfModule mime_module>
      AddType text/html .php .phps
  </IfModule>

  ScriptAlias /php-cgi/ "C:/Apps/php8/"
  <Directory "C:/Apps/php8">
      AllowOverride None
      Options None
      Require all denied
      <Files "php-cgi.exe">
            Require all granted
      </Files>
  </Directory>
   ```

## MySQL installation

Download .msi file from <https://dev.mysql.com/downloads/installer/> and install

set root password

## phpMyAdmin

- Download zip phpmyadmin - <https://files.phpmyadmin.net/phpMyAdmin/5.2.1/phpMyAdmin-5.2.1-all-languages.zip>
- Unzip and copy the `phpmyadmin` folder into `C:/Apache24/htdocs`
- Create a phpmyadmin user `pma`
- Edit config in `C:\Apache24\htdocs\phpmyadmin\config.inc.php` (Copy from `config.sample.inc.php`)

```php
/* Authentication type and info */
$cfg['Servers'][$i]['auth_type'] = 'config';
$cfg['Servers'][$i]['user'] = 'root';
$cfg['Servers'][$i]['password'] = 'Anit@1999';
$cfg['Servers'][$i]['extension'] = 'mysqli';
$cfg['Servers'][$i]['AllowNoPassword'] = false;
$cfg['Lang'] = 'en';

/* User for advanced features */
$cfg['Servers'][$i]['controluser'] = 'pma';
$cfg['Servers'][$i]['controlpass'] = 'Oracle@Delphi2021';
```

## Final steps

- Create a symbolic directory from project directory

```bat
mklink /D C:\Apache24\htdocs\diybaazar C:\Users\purch\Documents\Projects\Github\DIY-Baazar\diybaazar-main

mklink /D C:\Apache24\htdocs\diybaazar-admin C:\Users\purch\Documents\Projects\Github\DIY-Baazar\diybaazar-admin

mklink /D C:\Apache24\htdocs\diybdocs C:\Users\purch\Documents\Projects\Github\DIY-Baazar\diybaazar-docs
```

- Add virtual host config in `httpd-vhosts.conf`

```apache
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
</VirtualHost>

<VirtualHost *:80>
    ServerAdmin webmaster@diybaazar.xyz
    DocumentRoot "${SRVROOT}/htdocs/diybaazar"
    ServerName diybaazar.xyz
    ErrorLog "logs/diybaazar.xyz-error.log"
    CustomLog "logs/diybaazar.xyz-access.log" common
</VirtualHost>
```
