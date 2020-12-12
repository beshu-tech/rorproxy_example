#!/bin/bash

docker run --rm -d -p 9201:9200 -e "discovery.type=single-node" elasticsearch:7.9.3

export ROR_SUPERUSER_NAME="ror"
export ROR_SUPERUSER_SECRET="ror"

java \
-Dcom.readonlyrest.settings.file.path=proxy/readonlyrest.yml \
-Dlog4j.configurationFile=proxy/log4j2.properties \
-Dcom.readonlyrest.proxy.es.host=localhost \
-Dcom.readonlyrest.proxy.es.port=9201 \
-Dcom.readonlyrest.proxy.port=5000 \
-jar proxy/readonlyrest-proxy-1.26.0-pre2_es7.9.3.jar

