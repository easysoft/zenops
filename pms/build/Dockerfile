FROM ubuntu:18.04
MAINTAINER chenqi <chenqi@easycorp.ltd>

ENV DEBIAN_FRONTEND=noninteractive
ENV Z_HOME /z
ENV PATH $Z_HOME:$PATH

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
COPY sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get install --assume-yes apt-utils make php7.2
RUN apt-get install --assume-yes openjdk-8-jdk curl zip cconv

COPY yuicompressor/yuicompressor.jar /root/bin/yuicompressor/build/yuicompressor.jar
COPY docker_init.sh $Z_HOME/docker_init.sh
COPY zentaopms $Z_HOME/zentaopms

RUN chmod a+x $Z_HOME/docker_init.sh

ENTRYPOINT ["/z/docker_init.sh"]
