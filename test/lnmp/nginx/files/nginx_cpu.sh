#!/bin/bash
#

#修改配置文件
cpunum=`cat /proc/cpuinfo | grep processor | wc -l`
sed -i '/worker_processes/s/1/'"$cpunum"'/g' /usr/local/nginx/conf/nginx.conf
