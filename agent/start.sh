#!/usr/bin/env bash

echo "install and start zmanager ..."
zmanager -a start -l zh --ztf --zd

echo "start jenkins-agent ..."
jenkins-agent $1 $2 $3 $4 # '-url', jenkins url, token and agent name
