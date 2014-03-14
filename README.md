RHEL


Add extra repositories:

```
$ curl https://raw.github.com/jlhg/galaxy-preinstall/master/add_extra_repo.sh |sudo bash
$ sudo yum update
```

Install packages:

```
$ sudo yum install -y $(curl https://raw.github.com/jlhg/galaxy-preinstall/master/rhel-pkg.txt)
```
