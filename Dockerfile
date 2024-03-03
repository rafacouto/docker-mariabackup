FROM docker.io/rclone/rclone AS rclone
FROM docker.io/library/mariadb

COPY --from=rclone /usr/local/bin/rclone /usr/local/bin/rclone

WORKDIR /opt/mariadb-backup

COPY docker-entrypoint.sh ./
ENTRYPOINT [ "/opt/mariadb-backup/docker-entrypoint.sh" ]

USER mysql
