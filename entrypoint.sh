#!/usr/bin/env bash

export ARGV="$@"
export ARGC="$#"

cd /app && ./node_modules/.bin/forever start server.js
sleep 1
cd /app && ./node_modules/.bin/forever --fifo logs 0 &
wait
