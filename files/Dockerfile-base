FROM ubuntu:18.04
VOLUME /tmp

COPY res/sources.list /etc/apt/sources.list

RUN apt-get update
RUN apt-get install telnet vim

CMD [ "sh", "-c", "echo 'success'" ]
