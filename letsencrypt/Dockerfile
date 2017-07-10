FROM debian:jessie-backports
ARG my_site

RUN apt-get update \
  && apt-get install -y letsencrypt -t jessie-backports \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir -p /etc/letsencrypt/live/${my_site} \
  && openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/letsencrypt/live/${my_site}/privkey.pem \
    -out /etc/letsencrypt/live/${my_site}/fullchain.pem \
    -subj /CN=${my_site}
