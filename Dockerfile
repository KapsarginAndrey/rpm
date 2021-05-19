FROM centos:7
RUN yum install -y redhat-lsb-core wget rpmdevtools rpm-build yum-utils openssl-devel zlib-devel pcre-devel gcc libtool perl-core openssl
RUN wget https://nginx.org/packages/centos/7/SRPMS/nginx-1.20.0-1.el7.ngx.src.rpm
RUN rpm -ivh nginx-1.20.0-1.el7.ngx.src.rpm
RUN rpmbuild -ba /root/rpmbuild/SPECS/nginx.spec
RUN yum install localinstall -y /root/rpmbuild/RPMS/x86_64/*.rpm
RUN yum clean all
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN sed -i "0,/nginx/s/nginx/docker-nginx/i" /usr/share/nginx/html/index.html
CMD [ "nginx" ]

