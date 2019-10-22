#!/bin/bash

if [[ ! -f "./secrets.sh" ]]; then
    echo "./secrets doesnt exist"
    echo " Put into ./secrets.sh ->"
    echo "mqtttopic=topic to send"
    echo "mqttport=mqtt port"
    echo "mqtthost=mqtt server host"
    echo "mqttuser=mqtt user"
    echo "mqttpass=mqtt password"
    exit 1
fi
source secrets.sh

ebusd -d 192.168.100.139:9999 --configpath=./configuration -f \
--enabledefine  --enablehex --mqtttopic=$mqtttopic --mqttport=$mqttport --mqttlog --mqtthost=$mqtthost --mqttuser=$mqttuser --mqttpass=$mqttpass \
--loglevel="error" \
--pollinterval=10 \
--sendretries=5 \
--mqttjson \
--acquireretries=10 \
--latency=30000 \
--lograwdata=bytes \
--lograwdatafile=dump.log \
--lograwdatasize=100000