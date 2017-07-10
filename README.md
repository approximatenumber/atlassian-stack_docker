![atlassian stack](http://approximatenumber.github.io/images/atlassian_stack.png)

##### Export your site name and email

`export MY_SITE="domain.com"`

`export MY_EMAIL="my@domain.com"`

##### Build LetsEncrypt with dummy certificate

`docker-compose build letsencrypt`

##### Configure nginx config and index page

`sed -i "s/domain.com/${MY_SITE}/g" nginx/conf.d_dummy/nginx_dummy.conf`

`sed -i "s/domain.com/${MY_SITE}/g" nginx/conf.d/atlassian.conf`

`sed -i "s/domain.com/${MY_SITE}/g" nginx/html/index.html`

##### Start nginx with dummy certificate

`docker-compose -f docker-compose_dummy.yml start`

##### Get your certificate

```bash
docker-compose run --rm letsencrypt \
  letsencrypt certonly --webroot \
  --email ${MY_EMAIL} --agree-tos \
  -w /var/www/letsencrypt -d ${MY_SITE}
```
##### Stop them

`docker-compose -f docker-compose_dummy.yml stop`

##### Build postgres container

(you can configure db data in `db/init.sql`)

`docker-compose build db`

##### Create accounts for SMTP-container

(you can change passwords)

```bash
for service_ in jira confluence bitbucket; do
    docker run --rm \
        -e MAIL_USER=${service_}@${MY_SITE} \
        -e MAIL_PASS=VerySecurePassword \
        -ti tvial/docker-mailserver:latest \
        /bin/sh -c 'echo "$MAIL_USER|$(doveadm pw -s SHA512-CRYPT -u $MAIL_USER -p $MAIL_PASS)"' >> config/postfix-accounts.cf
done
```

##### That\`s all

Let\`s start all services with

`docker-compose up`

and check the log messages!

_Thanks to all container images I used here._
