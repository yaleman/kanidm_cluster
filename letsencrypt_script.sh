#!/bin/sh

set -e

#shellcheck disable=SC2034
CREATE="certonly -d ${FRONTEND_DOMAIN} "
RENEW="renew"

# shellcheck disable=SC2086
certbot ${RENEW} --non-interactive \
    --dns-cloudflare --dns-cloudflare-propagation-seconds 30 \
    --dns-cloudflare-credentials /etc/cloudflare.ini \
    --agree-tos \
    --email "${CERTBOT_EMAIL}" \
    --server https://acme-v02.api.letsencrypt.org/directory

FRONTEND_CERT_PATH="/etc/letsencrypt/frontend.pem"

echo "updating certs..."
cat "/etc/letsencrypt/live/${FRONTEND_DOMAIN}/fullchain.pem" \
    "/etc/letsencrypt/live/${FRONTEND_DOMAIN}/privkey.pem" \
    > "${FRONTEND_CERT_PATH}"

echo "Fixing permissions"
chmod -R a+r,a+x "${FRONTEND_CERT_PATH}"
echo "Checking cert:"
ls -al "${FRONTEND_CERT_PATH}"

echo "Done!"