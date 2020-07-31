#!/bin/bash

docker run -d -p 9201:9200 -e "discovery.type=single-node" elasticsearch:7.8.0

export ROR_SUPERUSER_NAME="ror"
export ROR_SUPERUSER_SECRET="ror"

java \
-Dcom.readonlyrest.settings.file.path=proxy/readonlyrest.yml \
-Dcom.readonlyrest.proxy.es.host=localhost \
-Dcom.readonlyrest.proxy.es.port=9201 \
-Dcom.readonlyrest.proxy.port=5000 \
-jar proxy/readonlyrest-proxy-1.21.0-pre7_es7.6.2.jar

