EMAIL="me@domain.com"
DOMAIN="domain.com"

docker-compose run --rm letsencrypt \
  letsencrypt certonly --webroot \
  --email ${EMAIL} --agree-tos \
  -w /var/www/letsencrypt -d ${DOMAIN}
