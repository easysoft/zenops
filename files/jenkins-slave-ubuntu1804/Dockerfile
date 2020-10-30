FROM jenkins/inbound-agent
VOLUME ["/tmp","/z"]

# RUN apt-get update
# RUN apt-get install telnet vim

ADD software/apache-maven-3.6.3 /z/dev/tool/apache-maven-3.6.3
ADD software/ztf-linux-2.2 /z/dev/tool/ztf-linux-2.2

ENV MAVEN_HOME /z/dev/tool/apache-maven-3.6.3
ENV ZTF_HOME /z/dev/tool/ztf-linux-2.2
ENV PATH $MAVEN_HOME/bin:$ZTF_HOME:$PATH
CMD ["sh", "-url http://172.16.0.30:9090 ${TOKEN}", "slave-ubuntu18.04"]
