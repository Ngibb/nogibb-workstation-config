#!/bin/bash
if [ $# -lt 2 ]; then
    echo 1>&2 "$0: not enough arguments"
    exit 2
fi

AWS_PROFILE=$1 
ES_ENDPOINT=$2

echo "Kibana URL: http://127.0.0.1:9200/_plugin/kibana"
aws-okta exec $AWS_PROFILE -- ~/bin/aws-es-proxy-linux-amd64 -pretty -endpoint $ES_ENDPOINT
