#!${PREFIX}/bin/node

HERE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
config=${HERE}../etc/logstash.d/logstash.conf

java -jar logstash-1.3.3-flatjar.jar agent -f $config -- web

