#!/bin/bash
#
# This script is for RHEL distribution
# This script will remove the installed torque.
#
# Adaptive computing installation guide:
# http://goo.gl/qkW7aQ


if [[ ! -d torque-4.2.7 ]]; then
  curl -o torque-4.2.7.tar.gz -L http://www.adaptivecomputing.com/index.php?wpfb_dl=2420
  tar xf torque-4.2.7.tar.gz
fi

cd torque-4.2.7
./configure
make

# Run as root
sudo su
export PATH=/usr/local/sbin:/usr/local/bin:$PATH
pkill pbs
rm -rf /var/spool/torque/
make install
cp contrib/init.d/trqauthd /etc/init.d/trqauthd
chkconfig --add trqauthd
cp contrib/init.d/pbs_mom /etc/init.d/pbs_mom
chkconfig --add pbs_mom
cp contrib/init.d/pbs_server /etc/init.d/pbs_server
chkconfig --add pbs_server
cp contrib/init.d/pbs_sched /etc/init.d/pbs_sched
chkconfig --add pbs_sched

echo /usr/local/lib >/etc/ld.so.conf.d/torque.conf
ldconfig
service trqauthd start
echo $(hostname) >/var/spool/torque/server_name

yes |./torque.setup root

qmgr -c "create node $(hostname) np=$(nproc)"
qmgr -c 'unset queue batch resources_default.walltime'
qterm
service pbs_server start
service pbs_mom start
service pbs_sched start
