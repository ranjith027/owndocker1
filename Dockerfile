FROM centos

LABEL "user"="ranjith"

RUN cd /etc/yum.repos.d/ && \
      sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
         sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum -y install httpd unzip

WORKDIR /var/www/html

ADD https://github.com/mdn/beginner-html-site-styled.git ./code.zip

RUN unzip code.zip && mv ./beginner-html-site-styled.git/* .

CMD apachectl-DFOREGROUND
