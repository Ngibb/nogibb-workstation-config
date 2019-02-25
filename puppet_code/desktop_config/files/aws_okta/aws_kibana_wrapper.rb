#!/usr/bin/ruby

aws_profile = ARGV[0] 
es_endpoint = ARGV[1]

puts "Kibana URL: http://127.0.0.1:9200/_plugin/kibana"
`aws-okta exec #{aws_profile} -- ~/bin/aws-es-proxy-0.9-linux-amd64 -pretty -endpoint #{es_endpoint} `
