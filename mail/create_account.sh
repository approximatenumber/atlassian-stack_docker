#!bin/bash

for user in jira confluence bintbucket; do

docker run --rm \
    -e MAIL_USER=$user@domain.com \
    -e MAIL_PASS=password \
    -ti tvial/docker-mailserver:latest \
    /bin/sh -c 'echo "$MAIL_USER|$(doveadm pw -s SHA512-CRYPT -u $MAIL_USER -p $MAIL_PASS)"' >> config/postfix-accounts.cf

done
