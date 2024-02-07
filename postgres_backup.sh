#!/bin/bash
#
# PostgreSQL backup script

WARIABLES_MISSING=0
BACKUP_PATH=/backups

[ -z $PG_HOST ] && echo "PG_HOST not set" && WARIABLES_MISSING=1
[ -z $PG_PORT ] && PG_PORT=5432
[ -z $PG_DATABASE ] && echo "PG_DATABASE not set" && WARIABLES_MISSING=1
[ -z $PG_USERNAME ] && echo "PG_USERNAME not set" && WARIABLES_MISSING=1
[ -z $PG_PASSWORD ] && echo "PG_PASSWORD not set" && WARIABLES_MISSING=1
[ -z $PG_SSL_MODE ] && PG_SSL_MODE=prefer

export PGHOST=$PG_HOST
export PGPORT=$PG_PORT
export PGUSER=$PG_USERNAME
export PGPASSWORD=$PG_PASSWORD
export PGSSLMODE=$PG_SSL_MODE

FILE_NAME=$BACKUP_PATH/${PG_DATABASE}_`date "+%d-%m-%Y_%H-%M-%S"`.backup

if [[ $WARIABLES_MISSING == 1 ]]
then
   echo "Can't proceed, exiting."
   exit 1
fi

echo "Creating backup ..."
pg_dump -F c -f ${FILE_NAME} -U $PG_USERNAME  $PG_DATABASE
echo "Done."

if [[ -f $FILE_NAME && ! -z $ENCRYPTION_KEY && ! -z $DROPBOX_API_KEY ]]
then
    echo "Encrypting backup and sending to Dropbox ..."
    7za a -mhe=on -p$ENCRYPTION_KEY $FILE_NAME.7z $FILE_NAME \
    && dropbox_uploader upload $FILE_NAME.7z / \
    && rm -f $FILE_NAME.7z \
    && echo "Done."
fi
