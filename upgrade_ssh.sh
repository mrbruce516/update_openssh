#!/usr/bin/bash

#关闭selinux，避免屏蔽ssh
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
setenforce 0

#环境依赖
rpm -i zlib-devel-1.2.3-29.el6.x86_64.rpm
yum -y install gcc
yum -y install openssl-devel

#openssh软件包
tar zxvf openssh-7.9p1.tar.gz
cd openssh-7.9p1

#制作备份
mkdir /back
mv  /etc/ssh/ /back/ssh.back

#编译安装
./configure --prefix=/usr --sysconfdir=/etc/ssh
make && make install

\cp /openssh-7.9p1/contrib/redhat/sshd.init /etc/init.d/sshd

chkconfig --add sshd

#解决root用户无法登陆
echo "Port 22" >> /etc/ssh/sshd_config
echo "PermitRootLogin yes"  >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

service sshd restart
service sshd start
