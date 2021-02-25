#!/usr/bin/env bash
set -e
export Z_HOME=/z

# edit makefile
sed -i '145,148s/^/#&/' $Z_HOME/zentaopms/Makefile

echo "start pull codes @ $(date +%T)"
cd $Z_HOME
git clone 'http://root:cFu_yXnsyWjG4f8KX3Vz@192.168.1.161:51080/root/zentaopms.git'
echo "end pull codes @ $(date +%T)"

# make
cd $Z_HOME/zentaopms
make pms

# upload
BUILD_NAME=$(ls -l *.zip | awk '{print $NF}')
curl -v -k -u zenops-user:P2ssw0rd  -T $BUILD_NAME  http://192.168.1.161:58082/artifactory/zentaopms/$BUILD_NAME

cd $Z_HOME

touch /tmp/daemon.log
tail -f /tmp/daemon.log
