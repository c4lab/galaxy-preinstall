#/bin/bash
# http://tecadmin.net/top-5-yum-repositories-for-centos-rhel-systems/

# Extra Packages for Enterprise Linux (EPEL)
# tmux, htop, bash-completion, ...
rpm --upgrade --verbose --hash http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# Auxiliary repositories should be added if, and only if, required package exists just in not-already-added repositories.
# yum-plugin-priorities should also be installed and configured to regulate priorities of packages that exist in multiple repositories.

## RepoForge
#rpm --upgrade --verbose --hash http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
#
## REMI
#rpm --upgrade --verbose --hash http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
#
## CentAlt
#rpm --upgrade --verbose --hash http://centos.alt.ru/repository/centos/6/x86_64/centalt-release-6-1.noarch.rpm
#
## Webtatic
#rpm --upgrade --verbose --hash http://repo.webtatic.com/yum/el6/latest.rpm
