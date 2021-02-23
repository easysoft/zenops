FROM jenkins/inbound-agent
VOLUME ["/tmp","/z"]

ARG maven_version=3.6.3

COPY --chown=jenkins:jenkins ./start.sh /z/start.sh
ADD --chown=jenkins:jenkins software/zmanager /z/dev/tool/zmanager/
ADD --chown=jenkins:jenkins software/apache-maven-3.6.3-bin.tar /z/dev/tool/

USER root
ENV M3_HOME /z/dev/tool/apache-maven-$maven_version
ENV Z_HOME /z
ENV ZMANAGER_HOME /z/dev/tool/zmanager
ENV ZTF_HOME /root/zmanager/ztf/latest/ztf/
ENV ZD_HOME /root/zmanager/zd/latest/zd/
ENV PATH $M3_HOME/bin:$Z_HOME:$ZMANAGER_HOME:$ZTF_HOME:$ZD_HOME:$PATH

RUN zmanager -a install -l zh

ENTRYPOINT ["/z/start.sh"]
