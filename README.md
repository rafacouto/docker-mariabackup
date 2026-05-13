# MariaBackup

Do MariaDB backups with mariadb-dump and upload with rclone to a blob storage or anywhere.

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
| `RCLONE_REMOTE_PATH` | 'mariabackup-dumps' | Remote path where the dump is put (directory) |


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

Please, review/open issues at [issue tracker][ISS01].

[ISS01]: https://github.com/rafacouto/docker-mariabackup/issues

## License

AGPL. See [LICENSE](LICENSE) file.

## Contributors

- Rafa Couto <caligari@treboada.net>

