#!/usr/bin/env bash

# /z/scripts/wait-for.sh zenops-mysql:3306 -t 10;

echo 'start pms by docker-compose ...';

mv /z/htdocs/zentaopms/www/install.php /z/htdocs/zentaopms/www/install.php.bak
mv /z/htdocs/zentaopms/www/upgrade.php /z/htdocs/zentaopms/www/upgrade.php.bak

exec /usr/sbin/apache2ctl -D FOREGROUND;
