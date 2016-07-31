#!/bin/bash
#自动分区
fdisk /dev/sdb << EOF
n
p
1
1
+10G
n
p
2
1307
2610
w
EOF
