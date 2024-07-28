---
layout: post
title: Custom WAMMP Setup in Windows (mod_wsgi support)
date: '2023-04-30 22:55:06 +0530'
tags: windows apache php
image: /public/images/0002_cover.webp
---

## Php installation

- Download `php-8.1.*-Win32-vs16-x64.zip` file from [https://windows.php.net/download#php-8.1](https://windows.php.net/download#php-8.1)
- Unzip and rename the folder to `php81` and place it in `C:\Apps`

or

- Set `ChocolateyToolsLocation` to `C:\Apps`
- Install php using choco

  ```bash
  choco install php --version=8.1.22 --package-parameters='"/ThreadSafe"'
  choco install php --version=8.2.15 --package-parameters='"/ThreadSafe"'
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
  extension=xsl
   ```

### Download ca certificate and replace for curl config

- Download the cacert.pem from [https://curl.se/ca/cacert.pem](https://curl.se/ca/cacert.pem).
- Move it to `C:/Apps/php81/extras/ssl` and add uncomment the below line in `php.ini`.

  ```ini
  curl.cainfo = "C:\Apps\php81\extras\ssl\cacert.pem"
  ```

## Apache server installation

- Download `httpd-2.4.*-win64-VS17.zip` from [https://www.apachelounge.com/download/](https://www.apachelounge.com/download/).
- Unzip the above zip file and move `Apache24` to `C:\Apps\Apache24`.

### Go to directory and install as service

- Open the terminal in administrative mode and run the below commands

```bat
cd C:\Apache24\bin\
httpd -k install
```

- httpd server will be installed and `Apache2.4` should be available in Services.

### Configuring in httpd server

- Prepare a `httpd-php.conf` file with following content in `C:\Apps\Apache24\conf\extra`

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

- Include the above file in `C:\Apps\Apache24\conf\httpd.conf`.

  ```apacheconf
  Include conf/extra/httpd-php.conf
  ```

## MySQL installation

- Download .msi file from <https://dev.mysql.com/downloads/installer/> and install

- Set the `root` password

## phpMyAdmin

- Download zip phpmyadmin - <https://files.phpmyadmin.net/phpMyAdmin/5.2.1/phpMyAdmin-5.2.1-all-languages.zip>
- Unzip and copy the `phpmyadmin` folder into `C:/Apache24/htdocs`
- Create a phpmyadmin user `pma`
- Edit config in `C:\Apache24\htdocs\phpmyadmin\config.inc.php` (Copy from `config.sample.inc.php`)

```php
/* Authentication type and info */
$cfg['Servers'][$i]['auth_type'] = 'config';
$cfg['Servers'][$i]['user'] = 'root';
$cfg['Servers'][$i]['password'] = '<mysql_password>';
$cfg['Servers'][$i]['extension'] = 'mysqli';
$cfg['Servers'][$i]['AllowNoPassword'] = false;
$cfg['Lang'] = 'en';

/* User for advanced features */
$cfg['Servers'][$i]['controluser'] = 'pma';
$cfg['Servers'][$i]['controlpass'] = '<control_password>';
```

## Adding Xdebug for code coverage

- Download xdebug file from <https://xdebug.org/files/php_xdebug-3.3.0alpha2-8.1-vs16-x86_64.dll>
- Move it to `Apps\php81\ext` and rename it to `php_xdebug.dll`.
- Update `C:\Apps\php81\php.ini` and add the line:

```apache
zend_extension=xdebug
```

## Configuring Virtual Hosts and Symbolic Links

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

## Hosting Flask Service

- Installing mod-wsgi

```bash
 pip install mod-wsgi
```

- Run the following the command and copy the output

```bash
 mod_wsgi-express module-config
```

Output will look something like this:

```txt
LoadFile "C:/Python311/python311.dll"
LoadModule wsgi_module "C:/Python311/Lib/site-packages/mod_wsgi/server/mod_wsgi.cp311-win_amd64.pyd"
WSGIPythonHome "C:/Python311"
```

- Paste it in `httpd.conf`.

- Add the following config in `httpd-vhosts.conf`.

```apache
<VirtualHost *:80>
    DocumentRoot "${SRVROOT}/htdocs/diybdocs"
    ServerAdmin webmaster@diybaazar.xyz
    ServerName docs.diybaazar.xyz

    WSGIScriptAlias / "${SRVROOT}/htdocs/diybdocs/app.wsgi"
    <Directory "${SRVROOT}/htdocs/diybdocs">
        WSGIApplicationGroup %{GLOBAL}
        WSGIScriptReloading On
        allow from all
        #Options None
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog "logs/docs.diybaazar.xyz-error.log"
    CustomLog "logs/docs.diybaazar.xyz-access.log" common
</VirtualHost>
```
