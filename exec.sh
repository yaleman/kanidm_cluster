#!/bin/bash

if [ -z "$1" ]; then
    echo "Specify a server, either left or right"
    exit 1
else
    SERVER="$1"
fi

if [ -z "$2" ]; then
    RUNCMD="bash"
else
    shift
    RUNCMD="$*"
fi

#shellcheck disable=SC2086
docker exec -it "kanidm_${SERVER}" ${RUNCMD}