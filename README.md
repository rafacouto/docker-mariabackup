# MariaBackup

Run MariaDB backups using mariadb-dump and upload them with rclone to blob storage or any other destination.

## Usage

### Environment variables

| var name | default | description |
|----------|---------|-------------|
| `MARIADB_DATABASES` | '' | Database names to dump, or leave empty to dump all databases. | 
| `MARIADB_HOSTNAME` | '' | (required) Host to connect to. | 
| `MARIADB_PORT` | '3306' | Port number to use for the connection. | 
| `MARIADB_USERNAME` | '' | (required) Username for authentication. | 
| `MARIADB_PASSWORD` | '' | (required) Password for authentication. | 
| `MARIADB_DUMP_ARGS` | '--single-transaction' | Extra arguments to pass to the mariadb-dump command. | 
| `RCLONE_REMOTE_PATH` | 'mariabackup-dumps' | Remote path (directory) where the dump file is stored. |


To configure rclone, use the [environment variables for your storage backend](https://rclone.org/docs/).  
Variable names must start with `RCLONE_CONFIG_RMT_` (the remote name used internally is `rmt`).

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

Please review or open issues in the [issue tracker][ISS01].

[ISS01]: https://github.com/rafacouto/docker-mariabackup/issues

## License

AGPL. See [LICENSE](LICENSE) file.

## Contributors

- Rafa Couto <caligari@treboada.net>

