FROM ubuntu:18.04
MAINTAINER chenqi <chenqi@easycorp.ltd>

ARG ARTIFACTORY_USER
ARG ARTIFACTORY_PASSWORD

RUN echo "account = $ARTIFACTORY_USER:$ARTIFACTORY_PASSWORD"
ENV ARTIFACTORY_USER=$ARTIFACTORY_USER
ENV ARTIFACTORY_PASSWORD=$ARTIFACTORY_PASSWORD
ENV DEBIAN_FRONTEND=noninteractive
ENV Z_HOME /z
ENV PATH $Z_HOME:$PATH

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
COPY sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get install --assume-yes apt-utils curl zip cconv
RUN apt-get install --assume-yes git make php7.2 openjdk-8-jdk

COPY tool/yuicompressor.jar /root/bin/yuicompressor/build/yuicompressor.jar
COPY docker_init.sh $Z_HOME/docker_init.sh
#COPY zentaopms $Z_HOME/zentaopms

RUN chmod a+x $Z_HOME/docker_init.sh

ENTRYPOINT ["/z/docker_init.sh"]
