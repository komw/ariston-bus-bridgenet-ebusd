#!/bin/sh

ebusd -d $EBUS_WEMOS_HOST:9999 --configpath=./conf -f \
--mqtttopic=ebus \
--mqttport=1883 --mqttlog --mqtthost=localhost --mqttuser=$MQTT_USER \
--mqttpass=$MQTT_PASSWORD --loglevel=error --pollinterval=2 \
--sendretries=5 \
--mqttjson \
--receivetimeout=100000 \
--latency=20000

