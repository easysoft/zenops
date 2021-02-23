#!/usr/bin/env bash
set -e
export Z_HOME=/z

# compile
sed -i '145,148s/^/#&/' $Z_HOME/zentaopms/Makefile
cd $Z_HOME/zentaopms
make pms

# upload
BUILD_NAME=$(ll *.zip | awk '{print $NF}')
curl -v -k -u zenops-user:P2ssw0rd  -T $BUILD_NAME  http://192.168.1.161:58082/artifactory/zentaopms/$BUILD_NAME

cd $Z_HOME

touch /tmp/daemon.log
tail -f /tmp/daemon.log
