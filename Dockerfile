FROM php:8.2-fpm

RUN echo "deb http://deb.debian.org/debian bookworm-backports main" > /etc/apt/sources.list.d/backport.list

RUN apt-get update

RUN apt-get install -y libmcrypt-dev libc-client-dev libkrb5-dev zlib1g-dev libpq-dev libcurl3-dev \
    default-mysql-client libmagickwand-dev --no-install-recommends

RUN apt-get install -y libzip-dev
RUN apt-get install -y libonig-dev

RUN apt-get install -y curl git unzip less vim

# Install imagick with ghostscript
RUN pecl install imagick
RUN docker-php-ext-enable imagick
RUN apt-get install -y ghostscript

# Install PHP extenstions
RUN docker-php-ext-install zip mbstring pdo_mysql
RUN docker-php-ext-configure imap --with-imap --with-imap-ssl --with-kerberos \
	&& docker-php-ext-install imap
RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pgsql pdo_pgsql
RUN docker-php-ext-install soap xml exif curl dom gd iconv mysqli bcmath fileinfo intl

RUN docker-php-ext-configure ftp --with-openssl-dir=/usr \
	&& docker-php-ext-install ftp

# Install python3
RUN apt-get install -y vim procps
RUN apt-get update && apt-get install -y python3 python3-pip

RUN apt install -t bookworm-backports -y libheif1 libheif-dev

# Use the default production configuration
RUN echo 'short_open_tag = Off' >> $PHP_INI_DIR/php.ini
RUN echo 'max_execution_time = 120' >> $PHP_INI_DIR/php.ini
RUN echo 'max_input_time = 120' >> $PHP_INI_DIR/php.ini
RUN echo 'max_input_vars = 20000' >> $PHP_INI_DIR/php.ini
RUN echo 'file_uploads = On' >> $PHP_INI_DIR/php.ini
RUN echo 'upload_max_filesize = 64M' >> $PHP_INI_DIR/php.ini
RUN echo 'max_file_uploads = 20' >> $PHP_INI_DIR/php.ini

# https://stackoverflow.com/questions/52998331/imagemagick-security-policy-pdf-blocking-conversion
RUN sed -i '/disable ghostscript format types/,+6d' /etc/ImageMagick-6/policy.xml

# set user as www-data because default user sometimes mess with privileges when multiple machines access to the same resource
USER www-data

WORKDIR /var/www
