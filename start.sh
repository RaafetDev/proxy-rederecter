#!/bin/sh
# start tor
torproxy.sh &
# start privoxy (only on localhost, optionally)
privoxy --no-daemon /etc/privoxy/config &
# wait to keep container running
wait -n
