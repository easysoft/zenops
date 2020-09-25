FROM mysql:5.7

# RUN apt-get update
# RUN apt-get install telnet vim

ENV MYSQL_DATABASE zentao
ENV MYSQL_ALLOW_EMPTY_PASSWORD true
EXPOSE 3306
VOLUME ["/var/lib/mysql", "/tmp","/z"]

ADD db/utf8mb4.cnf /etc/mysql/conf.d

ADD db/data.sql /docker-entrypoint-initdb.d/3-data.sql
ADD db/test.sql /docker-entrypoint-initdb.d/4-test.sql

ADD software/zentaopms/db/zentao.sql /docker-entrypoint-initdb.d/1-zentao.sql
ADD software/zentaopms/db/demo.sql /docker-entrypoint-initdb.d/2-demo.sql
