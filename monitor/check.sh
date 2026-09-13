#!/bin/sh
while true
do
    if curl -sf http://app:8000 > /dev/null
    then
        echo "$(date): app is UP" >> /logs/monitor.log
    else
        echo "$(date): app is DOWN" >> /logs/monitor.log
    fi
    sleep 10
done