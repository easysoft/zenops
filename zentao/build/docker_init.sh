#!/usr/bin/env bash
set -e
export Z_HOME=/z

echo "GIT: $ENV_GIT_USER:$ENV_GIT_TOKEN@$GIT_SERVER"
echo "ARTIFACTORY: $ENV_ARTIFACTORY_USER:$ENV_ARTIFACTORY_PASSWORD@$ENV_ARTIFACTORY_OSS_SERVER"

# pull codes
echo "start pull codes @ $(date +%T)"
cd $Z_HOME
git clone "http://$ENV_GIT_USER:$ENV_GIT_TOKEN@$ENV_GIT_SERVER/root/zentaopms.git"
cd zentaopms && git checkout entaopms_12.5.2_20201218 && cd..
echo "end pull codes @ $(date +%T)"

# edit makefile
sed -i '145,148s/^/#&/' $Z_HOME/zentaopms/Makefile

# make
cd $Z_HOME/zentaopms
make pms

# upload
BUILD_NAME=$(ls -l *.zip | awk '{print $NF}')
curl -v -k -u "$ENV_ARTIFACTORY_USER:$ENV_ARTIFACTORY_PASSWORD" -T "$BUILD_NAME"  http://$ENV_ARTIFACTORY_OSS_SERVER/artifactory/zentaopms/$BUILD_NAME

cd $Z_HOME

touch /tmp/daemon.log
tail -f /tmp/daemon.log
