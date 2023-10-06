#!/bin/bash

docker run --rm -it --env-file .env --entrypoint /bin/sh certbot/dns-cloudflare
