#/bin/bash
# http://tecadmin.net/top-5-yum-repositories-for-centos-rhel-systems/

# EPEL
rpm -Uvh http://mirror01.idc.hinet.net/EPEL/6/x86_64/epel-release-6-8.noarch.rpm

# RPMForge
rpm -Uvh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm

# REMI
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

# CentAlt
rpm -Uvh http://centos.alt.ru/repository/centos/6/x86_64/centalt-release-6-1.noarch.rpm

# Webtatic
rpm -Uvh http://repo.webtatic.com/yum/el6/latest.rpm
