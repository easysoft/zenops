#!/usr/bin/env bash
set -e
export Z_HOME=/z

USER_ACCOUNT="$ENV_ARTIFACTORY_USER:$ENV_ARTIFACTORY_PASSWORD"
echo "USER_ACCOUNT=$USER_ACCOUNT"

# pull codes
echo "start pull codes @ $(date +%T)"
cd $Z_HOME
git clone http://chenqi:zGx3WjkxphapoG4eeHjP@192.168.1.161:51080/root/zentaopms.git
echo "end pull codes @ $(date +%T)"

# edit makefile
sed -i '145,148s/^/#&/' $Z_HOME/zentaopms/Makefile

# make
cd $Z_HOME/zentaopms
make pms

# upload
BUILD_NAME=$(ls -l *.zip | awk '{print $NF}')
curl -v -k -u "$USER_ACCOUNT"  -T "$BUILD_NAME"  http://192.168.1.161:58082/artifactory/zentaopms/$BUILD_NAME

cd $Z_HOME

touch /tmp/daemon.log
tail -f /tmp/daemon.log
