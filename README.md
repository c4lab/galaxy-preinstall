RHEL


Add extra repositories:

```
$ curl https://raw.github.com/jlhg/galaxy-preinstall/master/add_extra_repo.sh |sudo bash
$ sudo yum install yum-priorities
```

Set the priorities of CentOS-Base and EPEL repos:

* Add `priority=1` to each section in `/etc/yum.repos.d/CentOS-Base.repo`.

  E.g.

```
[base]
name=CentOS-$releasever - Base
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os
#baseurl=http://mirror.centos.org/centos/$releasever/os/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6
priority=1

#released updates
[updates]
name=CentOS-$releasever - Updates
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates
#baseurl=http://mirror.centos.org/centos/$releasever/updates/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6
priority=1

...

```

* Add `priority=10` to each section in `/etc/yum.repos.d/epel.repo`.

Update packages:

```
$ sudo yum update
```

Install packages:

```
$ sudo yum install -y $(curl https://raw.github.com/jlhg/galaxy-preinstall/master/rhel-pkg.txt)
```
