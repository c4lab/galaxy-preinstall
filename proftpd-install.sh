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
chkconfig --add proftpd
