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

## Support

Please, open issues at [issue tracker](#)

## License

AGPL

## Contributors

- Rafa Couto <caligari@treboada.net>

