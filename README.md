# Laravel PHP Backend

[![Build Status](https://jenkins.epicfail.dev/buildStatus/icon?job=Docker+-+Laravel+PHP+Backend)](https://jenkins.epicfail.dev/job/Docker%20-%20Laravel%20PHP%20Backend/)

This is a docker PHP package used for the production environments with pre-setup packages and production PHP config.
Image is located on Docker Hub under `epicfailstudio/laravel-php-backend`

## Core image
Based on `php:8.1-fpm` docker image

### PHP extensions:
* Database connection: `mysql, pgsql`
* Mail connection: `imap`
* Image files: `gd, imagick with ghostscript`
* Structured files: `soap, xml, dom, json`
* Work with files: `zip, fileinfo, iconv, exif`

... and other useful stuff

### php.ini:
```ini
short_open_tag = Off
max_execution_time = 60
max_input_time = 60
max_input_vars = 20000
file_uploads = On
upload_max_filesize = 48M
max_file_uploads = 20
```
