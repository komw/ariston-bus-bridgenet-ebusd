#!/bin/bash
set -e
ebusd --configpath=./configuration -f --enablehex --loglevel=debug --checkconfig

if [[ ! -f "./secrets.sh" ]]; then
    echo "./secrets doesnt exist"
    echo " Put into ./secrets.sh ->"
    echo "mqtttopic=topic to send"
    echo "mqttport=mqtt port"
    echo "mqtthost=mqtt server host"
    echo "mqttuser=mqtt user"
    echo "mqttpass=mqtt password"
    echo "ebusport=ebus serialport or wemos host"
    exit 1
fi
source secrets.sh

ebusd -d $ebusport --configpath=./configuration -f \
--enabledefine  --enablehex --mqtttopic=$mqtttopic --mqttport=$mqttport --mqttlog --mqtthost=$mqtthost --mqttuser=$mqttuser --mqttpass=$mqttpass \
--loglevel="debug" \
--pollinterval=7 \
--sendretries=2 \
--mqttjson 
#--acquireretries=2 \
#--latency=50000 \
#--lograwdata=bytes \
#--lograwdatafile=dump.log \
#--lograwdatasize=100000