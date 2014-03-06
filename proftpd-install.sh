#!/bin/bash

if [[ ! -d proftpd-1.3.4d.tar.gz ]]; then
  wget ftp://ftp.proftpd.org/distrib/source/proftpd-1.3.4d.tar.gz
  tar xf proftpd-1.3.4d.tar.gz
fi

cd proftpd-1.3.4d/
./configure --disable-auth-file --disable-ncurses --disable-ident \
  --disable-shadow --enable-openssl --with-modules=mod_sql:mod_sql_postgres:mod_sql_passwd:mod_sftp
make

# Run as root
sudo su
make install
mkdir -p /var/log/proftpd
chmod 700 /var/log/proftpd
curl https://raw.github.com/jlhg/galaxy-preinstall/master/proftpd-galaxy.conf -o /etc/init.d/proftpd
chmod 640 /usr/local/etc/proftpd.conf
curl https://raw.github.com/jlhg/galaxy-preinstall/master/proftpd-init -o /etc/init.d/proftpd
chmod 555 /etc/init.d/proftpd
chkconfig --add proftpd
chkconfig proftpd on
