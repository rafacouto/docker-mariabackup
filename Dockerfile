FROM docker.io/library/rclone/rclone AS rclone
FROM docker.io/library/mariadb

COPY --from=rclone /usr/local/bin/rclone /usr/local/bin/rclone
COPY docker-entrypoint.sh /

ENTRYPOINT [ "/docker-entrypoint.sh" ]

