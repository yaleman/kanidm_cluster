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

docker run --rm -it \
    --volume "kanidm_cluster_${SERVER}_data:/var/lib/kanidm" \
    --mount "type=bind,source=./config_${SERVER}.toml,target=/data/server.toml" \
    --name "shell_$SERVER" \
    --workdir /var/lib/kanidm \
    kanidm/server:devel \
    "$RUNCMD"
