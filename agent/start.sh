#!/usr/bin/env bash

echo "install and start zmanager ..."
zmanager -a start -l zh

echo "start jenkins-agent ..."
jenkins-agent -url $1 $2 $3 # jenkins url, token and agent name

su - oracle -c "ulimit -aHS"
