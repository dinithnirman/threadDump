#!/bin/bash
# Generate N number of dumps of process PID with an INTERVAL between each dump

if [ $# -ne 3 ]; then
        echo Generates java thred dump using jstack command.
        echo
        echo usage: "$0" process_id repetition interval
        exit 1
fi

PID=$1
N=$2
INTERVAL=$3

for ((i=1; i<=$N; i++))
do
        date=$(date +%Y%m%d-%H%M%S)
        dump="ThreadDump-$PID-$date.txt"
        echo "$i" of "$N": "$dump"
        jstack -l $PID > $dump
        sleep $INTERVAL
done
