FROM registry.cn-shanghai.aliyuncs.com/ngtesting/zenops-base:1.0
VOLUME ["/tmp","/z"]

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install --assume-yes apt-utils
RUN apt-get install apache2 php7.2 php7.2-mysql php7.2-curl php7.2-mbstring -y

RUN a2enmod rewrite

# ADD res/wait-for.sh /z/scripts/
# RUN chmod +x /z/scripts/wait-for.sh

ADD res/launch-pms.sh /z/scripts/
RUN chmod +x /z/scripts/launch-pms.sh

ADD software/zentaopms /z/htdocs/zentaopms
ADD res/my.php /z/htdocs/zentaopms/config

ADD software/ioncube_loader_lin_7.2.so /usr/lib/php/20170718/ioncube_loader_lin_7.2.so
RUN echo "zend_extension = /usr/lib/php/20170718/ioncube_loader_lin_7.2.so" > /etc/php/7.2/apache2/conf.d/00-ioncube.ini

ENV APACHE_DOCUMENT_ROOT /z/htdocs/zentaopms/www
RUN sed -ri -e 's!/var/www/html!'"${APACHE_DOCUMENT_ROOT}"'!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!'"${APACHE_DOCUMENT_ROOT}"'!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
RUN sed -ri -e 's!AllowOverride None!AllowOverride All!g' /etc/apache2/apache2.conf

CMD ["sh", "/z/scripts/launch-pms.sh"]
