#!/bin/bash
#自动安装php脚本

#解压php包
phptar=`ls /tmp/ | grep "php.*gz"`
tar -xf /tmp/$phptar -C /usr/local/src/

#编译安装php
tardir=`ls /usr/local/src/ | grep php`
cd /usr/local/src/$tardir
./configure \
--prefix=/usr/local/php \
--enable-fpm \
--enable-opcache \
--with-config-file-path=/usr/local/php/etc \
--with-mysql=mysqlnd \
--with-mysqli=mysqlnd \
--with-pdo-mysql=mysqlnd \
--enable-static \
--enable-inline-optimization \
--enable-sockets \
--enable-wddx \
--enable-zip \
--enable-calendar \
--enable-bcmath \
--enable-soap \
--with-zlib \
--with-iconv \
--with-gd \
--with-xmlrpc \
--enable-mbstring \
--with-curl \
--enable-ftp \
--disable-ipv6 \
--disable-debug \
--with-openssl \
--disable-maintainer-zts \
--disable-fileinfo \
--with-freetype-dir=/usr/local/ \
--with-jpeg-dir=/usr/local/ \
--with-png-dir=/usr/local/
if [ "$?" == 0 ];then
	make && make install
else
	echo "编译出错"
fi

#配置php文件
cp php.ini-production /usr/local/php/lib/php.ini
cp /usr/local/php/etc/php-fpm.conf{.default,}
