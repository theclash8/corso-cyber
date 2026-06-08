#!/bin/bash

while true; do

    DISCO_USATO=$(df /dev/sda1 | grep sda1 | awk {'print $5'} | tr -d '%')
    RAM_USATA=$(free -m | awk '/Mem:/ {print $3}')
    CPU_USATA=$(mpstat 1 1 | grep "Average" | awk '{print 100 - $NF}')

    if [ "$RAM_USATA" -gt 400 ]; then
        wall "BUH!"
    else
        echo "RAM OK!!!!!!"
    fi

    if [ "$CPU_USATA" -gt 90 ]; then
	wall "BAH!"
    else
        echo "CPU OK!!!!"
    fi

    if [ "$DISCO_USATO --gt 80 ]; then
        wall "OUCH!"
    else
        echo "DISCO OK!!!!"
    fi

    sleep 10
done
