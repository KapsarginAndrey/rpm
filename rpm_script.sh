#!/bin/bash
sudo su
yum groupinstall -y "Development Tools" 
yum install -y wget createrepo yum-utils gnutls-devel openssl-devel pcre-devel rpmdevtools
cd /root
mkdir -p /opt/lib
wget https://nginx.org/packages/centos/7/SRPMS/nginx-1.20.0-1.el7.ngx.src.rpm
wget https://www.openssl.org/source/openssl-1.1.1k.tar.gz
tar -zxvf openssl-1.1.1k.tar.gz -C /opt/lib
rpm -ivh nginx-1.20.0-1.el7.ngx.src.rpm
sed -i "s|--with-http_ssl_module|--with-http_ssl_module --with-openssl=/opt/lib/openssl-1.1.1k|g" /root/rpmbuild/SPECS/nginx.spec
rpmbuild -ba /root/rpmbuild/SPECS/nginx.spec
yum install localinstall -y /root/rpmbuild/RPMS/x86_64/nginx-1.20.0-1.el7.ngx.x86_64.rpm

#Создание репозитория
yum install -y epel-release createrepo yum-utils
systemctl enable nginx
systemctl start nginx
mkdir -p /usr/share/nginx/html/repos/7/centos/nginx/x86_64/
cp /root/rpmbuild/RPMS/x86_64/nginx-1.20.0-1.el7.ngx.x86_64.rpm /usr/share/nginx/html/repos/7/centos/nginx/x86_64/
createrepo /usr/share/nginx/html/repo
touch /etc/yum.repos.d/otus.repo
echo -e "[otus]\nname=otus\nbaseurl=http://localhost/repo\ngpgcheck=0\nenabled=1" | sudo tee -a /etc/yum.repos.d/otus.repo
systemctl restart nginx
