#!/bin/bash

while [ 1 ]; do
    running=$(( ( RANDOM % 2 ) ))
    loops=$(( ( RANDOM % 5 ) + 60 ))
    sleep=$(( ( RANDOM % 2 ) + 1 ))
    if [ "$running" = "1" ]; then
        for i in `seq 1 $loops`; do
            metric="worker.`hostname | tr '.' '_'`.rate $(( ( RANDOM % 5000 )  + 25000 )) `date +%s`"
            active="worker.`hostname | tr '.' '_'`.active 1 `date +%s`"
            echo $metric
            echo $active
            echo $metric | nc graphite 2003 -q 0
            echo $active | nc graphite 2003 -q 0
            sleep $sleep
        done;
    else
        for i in `seq 1 $loops`; do
            active="worker.`hostname | tr '.' '_'`.active 0 `date +%s`"
            metric="worker.`hostname | tr '.' '_'`.rate 0 `date +%s`"
            echo $metric
            echo $active
            echo $metric | nc graphite 2003 -q 0
            echo $active | nc graphite 2003 -q 0
            sleep $sleep
        done;
    fi;
done;
