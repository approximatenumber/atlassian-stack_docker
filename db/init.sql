CREATE USER jirauser PASSWORD 'jirauser';
CREATE DATABASE jiradb;
GRANT ALL PRIVILEGES ON DATABASE jiradb TO jirauser;

CREATE USER confluenceuser PASSWORD 'confluenceuser';
CREATE DATABASE confluencedb;
GRANT ALL PRIVILEGES ON DATABASE confluencedb TO confluenceuser;

CREATE USER bitbucketuser PASSWORD 'bitbucketuser';
CREATE DATABASE bitbucketdb;
GRANT ALL PRIVILEGES ON DATABASE bitbucketdb TO bitbucketuser;
