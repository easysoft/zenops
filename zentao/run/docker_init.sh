#!/usr/bin/env bash
set -e

echo "ENV_MYSQL_ROOT_PASSWORD=$ENV_MYSQL_ROOT_PASSWORD"

if [ ! -d "/www/zentaopms" ];then
  mkdir -p /www/zentaopms
fi
if [ "`ls -A /www/zentaopms`" = "" ]; then
  cp -a /var/www/zentaopms/* /www/zentaopms
fi
chmod -R 777 /www/zentaopms/www/data
chmod -R 777 /www/zentaopms/tmp
chmod 777 /www/zentaopms/www
chmod 777 /www/zentaopms/config
chmod -R a+rx /www/zentaopms/bin/*
chown -R www-data:www-data /www/zentaopms
rm -rf /var/run/apache2/apache2.pid
chown -R mysql:mysql /var/lib/mysql/
/etc/init.d/cron restart
/etc/init.d/apache2 restart

if [ "`ls -A /var/lib/mysql/`" = "" ]; then
  mysql_install_db --defaults-file=/etc/mysql/my.cnf
  /etc/init.d/mysql restart
  /usr/bin/mysqladmin -uroot password $ENV_MYSQL_ROOT_PASSWORD
else
  /etc/init.d/mysql restart
fi

touch /tmp/daemon.log
tail -f /tmp/daemon.log

