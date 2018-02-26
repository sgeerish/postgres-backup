### Docker image for PostgreSQL backup
---
Based on [official postgres images](https://hub.docker.com/_/postgres/) from docker hub.

For uploads to Dropbox it uses [Dropbox-Uploader](https://github.com/andreafabrizi/Dropbox-Uploader) script.

### Supported tags
---

* latest

### How to use this image
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

#### PG_HOST 
Hostname or IP of PostgreSQL server.

#### PG_PORT
Port of the PostgreQL server (5432 by default).

#### PG_DATABASE
Database name, which needed to backup.
#### PG_USERNAME
Username to connect to Database.
#### PG_PASSWORD
Password for Username.
#### PG_SSL_MODE
SSL mode (prefer by default).
#### ENCRYPTION_KEY
[7zip](http://www.7-zip.org/) encryption key.

>[7zip](http://www.7-zip.org/) is used for encryption and compression.

#### DROPBOX_API_KEY
API KEY for Dropbox uloads.
