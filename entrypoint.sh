#!/bin/bash

if [[ ! -z "$DROPBOX_API_KEY" ]]
then
    echo "OAUTH_ACCESS_TOKEN=$DROPBOX_API_KEY" > /root/.dropbox_uploader
fi

exec "$@"
