FROM debian:jessie-backports

RUN apt-get update \
  && apt-get install -y letsencrypt -t jessie-backports \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir -p /etc/letsencrypt/live/${MY_SITE} \
  && openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/letsencrypt/live/${MY_SITE}/privkey.pem \
    -out /etc/letsencrypt/live/${MY_SITE}/fullchain.pem \
    -subj /CN=${MY_SITE}
