#!/usr/bin/env bash
set -e
export Z_HOME=/z

# compile
sed -i '145,148s/^/#&/' $Z_HOME/zentaopms/Makefile
cd $Z_HOME/zentaopms
make pms
cd $Z_HOME

touch /tmp/daemon.log
tail -f /tmp/daemon.log

