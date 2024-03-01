# MariaBackup

This image contains everything to do MariaDB backups with mariadb-dump and upload to a blob storage rclone.

## Usage

### Environment variables

| var name | default | observations |
|----------|---------|--------------|
| `MARIADB_DATABASES` | '' | DB names to dump or empty to dump all. | 
| `MARIADB_HOSTNAME` | '' | (required) Connect to host. | 
| `MARIADB_PORT` | '3306' | Port number to use for connection. | 
| `MARIADB_USERNAME` | '' | (required) User for login. | 
| `MARIADB_PASSWORD` | '' | (required) Password to use when connecting to server. | 
| `MARIADB_DUMP_ARGS` | '--single-transaction' | Extra arguments to pass to mariadb-dump command. | 

To configure the rclone use the [variables related to your storage](https://rclone.org/docs/).
The variable name has to start with `RCLONE_CONFIG_RMT_` (the remote name internally used by scripts is `rmt`).

S3 example:
```
RCLONE_CONFIG_RMT_TYPE=s3
RCLONE_CONFIG_RMT_ACCESS_KEY_ID=...
RCLONE_CONFIG_RMT_SECRET_ACCESS_KEY=...
RCLONE_CONFIG_RMT_ENDPOINT=...
```

GCS example:
```
RCLONE_CONFIG_RMT_TYPE=gcs
RCLONE_CONFIG_RMT_CLIENT_ID=...
RCLONE_CONFIG_RMT_CLIENT_SECRET=...
RCLONE_CONFIG_RMT_PROJECT_NUMBER=...
```

## Support

Please, review/open issues at [issue tracker](https://gitlab.com/treboada/docker-mariabackup/-/issues)
or email to [the inbox of issue tracker](mailto:incoming+treboada-docker-mariabackup-55160666-9glddzg5nzkz7s7geiescpsc7-issue@incoming.gitlab.com)
(the subject will be used as the title of the new issue, and the message will
be the description. Quick actions and styling with Markdown are supported.)

## License

AGPL. See [LICENSE](LICENSE) file.

## Contributors

- Rafa Couto <caligari@treboada.net>

