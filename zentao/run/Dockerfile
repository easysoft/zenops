FROM ubuntu:18.04
MAINTAINER chenqi <chenqi@easycorp.ltd>

ARG MYSQL_ROOT_PASSWORD

ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y apache2 mariadb-server php7.2 php7.2-curl php7.2-gd php7.2-ldap \
    php7.2-mbstring php7.2-mysql php7.2-xml php7.2-zip php7.2-cli php7.2-json curl cron \
    vim unzip libapache2-mod-php locales

ENV LANG="en_US.UTF8"
ENV TZ=Asia/Shanghai
RUN echo -e "LANG=\"en_US.UTF-8\"\nLANGUAGE=\"en_US:en\"" > /etc/default/locale && locale-gen en_US.UTF-8 && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone

COPY docker_init.sh /.docker_init.sh
COPY config/vimrc /root/.vimrc
COPY config/ioncube_loader_lin_7.2.so /usr/lib/php/20170718/ioncube_loader_lin_7.2.so
COPY config/00-ioncube.ini /etc/php/7.2/apache2/conf.d/
COPY config/00-ioncube.ini /etc/php/7.2/cli/conf.d/

COPY config/mcrypt.so /usr/lib/php/20170718/
COPY config/20-mcrypt.ini /etc/php/7.2/apache2/conf.d/
COPY config/20-mcrypt.ini /etc/php/7.2/cli/conf.d/
COPY config/libmcrypt.so.4.4.8 /usr/lib/libmcrypt.so.4

#COPY zentao.zip /tmp/
ADD http://192.168.1.161:58082/artifactory/zentaopms/ZenTaoPMS.15.0.beta1.zip /tmp/zentao.zip
RUN ls -l /tmp/
COPY config/apache.conf /etc/apache2/sites-enabled/
RUN mkdir /www
RUN unzip -q /tmp/zentao.zip -d /var/www > /dev/null
RUN rm /etc/apache2/sites-enabled/000-default.conf
RUN rm /tmp/zentao.zip

RUN chmod a+x /.docker_init.sh && a2enmod rewrite && \
    rm -rf /var/lib/mysql/* &&  sed -i '1i ServerName 127.0.0.1' /etc/apache2/apache2.conf && \
    sed -i '/^memory_limit/cmemory_limit = 1024M' /etc/php/7.2/apache2/php.ini

VOLUME /var/lib/mysql
ENTRYPOINT ["/.docker_init.sh"]
