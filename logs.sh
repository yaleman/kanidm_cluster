#!/bin/bash

if [ -z "$1" ]; then
    echo "Specify a server, either left or right"
    exit 1
else
    SERVER="$1"
fi

docker-compose logs -f "$SERVER"
