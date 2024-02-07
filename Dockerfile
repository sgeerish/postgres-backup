FROM postgres:alpine

RUN set -xe \
    && apk add --update --no-cache \
        bash \
        ca-certificates \
        curl \
        p7zip \
        sed

RUN curl "https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh" -o /usr/local/bin/dropbox_uploader \
    && chmod +x /usr/local/bin/dropbox_uploader

COPY entrypoint.sh postgres_backup.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh /usr/local/bin/postgres_backup.sh

VOLUME ["/backups"]

WORKDIR /backups

ENTRYPOINT ["entrypoint.sh"]

CMD ["postgres_backup.sh"]
