#!/bin/bash
#自动安装nginx

#解压nginx包
nginxtar=`ls /tmp/ | grep "nginx.*gz"`
tar -xf /tmp/$nginxtar -C /usr/local/src/

#编译安装nginx
tardir=`ls /usr/local/src/ | grep nginx`
cd /usr/local/src/$tardir
./configure \
--prefix=/usr/local/nginx \
--user=www \
--group=www \
--with-http_ssl_module \
--with-http_sub_module \
--with-http_gzip_static_module \
--with-http_stub_status_module \
--with-pcre
if [ "$?" == 0 ];then
	make && make install
else
	echo "编译出错"
fi
