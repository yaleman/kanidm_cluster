# Kanidm cluster config

This sets up a pair of nodes in mutual-pull mode behind a HAproxy frontend, with TLS end-to-end.

I use Cloudflare for DNS so you need to tweak `letsencrypt_script.sh` if you don't, and you need to put config in `cloudflare/cloudflare.ini` if you do.

Usage:

1. Copy `example.env` to .env
2. Update it with your details
3. Configure certbot
4. Generate the frontend cert `docker-compose up letsencrypt`
5. TODO: `<start the containers and generate replication certs>`
6. Restart the containers to bring them online: `docker-compose up -d left right haproxy`
