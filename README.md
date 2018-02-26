# Docker image for PostgreSQL backup
Based on [official postgres images](https://hub.docker.com/_/postgres/) from docker hub.

For uploads to Dropbox it uses [Dropbox-Uploader](https://github.com/andreafabrizi/Dropbox-Uploader) script.

## Supported tags
---

* latest

## How to use this image
---

### start backup 
```
$ docker run --rm \
    -e PG_HOST=<database host> \
    -e PG_DATABASE=<database> \
    -e PG_USERNAME=<database user> \
    -e PG_PASSWORD=<database user password> \
    -v /backups:/backups \
    fomk/postgres-backup
```

### Environment Variables
---
<dl>
<dt>PG_HOST</dt>
<dd>Hostname or IP of PostgreSQL server.</dd>
<dt>PG_PORT</dt>
<dd>Port of the PostgreQL server (5432 by default).</dd>
<dt>PG_DATABASE</dt>
<dd>Database name, which needed to backup.</dd>
<dt>PG_USERNAME</dt>
<dd>Username to connect to Database.</dd>
<dt>PG_PASSWORD</dt>
<dd>Password for Username.</dd>
<dt>PG_SSL_MODE</dt>
<dd>SSL mode (prefer by default).</dd>
<dt>ENCRYPTION_KEY</dt>
<dd>
[7zip](http://www.7-zip.org/) encryption key.

>[7zip](http://www.7-zip.org/) is used for encryption and compression.
</dd>
<dt>DROPBOX_API_KEY</dt>
<dd>API KEY for Dropbox uloads.</dd>
</dl>
