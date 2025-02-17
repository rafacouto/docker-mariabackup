FROM docker.io/rclone/rclone:1.69.0 AS rclone
FROM docker.io/library/mariadb:11.6.2

COPY --from=rclone /usr/local/bin/rclone /usr/local/bin/rclone

WORKDIR /opt/mariadb-backup

ENV RCLONE_REMOTE_PATH=mariabackup-dumps

COPY docker-entrypoint.sh ./
ENTRYPOINT [ "/opt/mariadb-backup/docker-entrypoint.sh" ]

USER mysql

RUN touch ~/.rclone.conf

