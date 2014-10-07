#!/bin/bash

EXT_DIR="../ext"
PROJECT_NAME="caliopen"

cd ${EXT_DIR}

cd es

pid=`ps aux |grep elasticsearch|grep Elastic|awk '{print $2}'`
echo "ES stop pid: $pid"
kill $pid

rm -rf data

echo "Restart ES"
./bin/elasticsearch -d

cd ..

cd cassandra
echo "Drop keyspace ${PROJECT_NAME}"
./bin/cqlsh << EOT
drop keyspace ${PROJECT_NAME};

EOT

cd ..


