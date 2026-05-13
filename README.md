# MariaBackup

[![Docker image](https://img.shields.io/github/v/tag/rafacouto/docker-mariabackup?label=image&logo=docker)](https://github.com/rafacouto/docker-mariabackup/pkgs/container/docker-mariabackup)

Run MariaDB backups using mariadb-dump and upload them with rclone to blob storage or any other destination.

## Usage

### Docker image

The image version tracks the bundled MariaDB version. You can reference it in three ways:

| Tag | Example | Description |
|-----|---------|-------------|
| `x.y.z` | `12.2.1` | Exact version |
| `x.y` | `12.2` | Latest patch for that minor version *(recommended)* |
| `x` | `12` | Latest minor for that major version |

```
docker pull ghcr.io/rafacouto/docker-mariabackup:12.2
```

Using the minor tag (`x.y`) is recommended: you get patch updates automatically while staying on a stable minor version.

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

#### AWS S3

```
RCLONE_CONFIG_RMT_TYPE=s3
RCLONE_CONFIG_RMT_PROVIDER=AWS
RCLONE_CONFIG_RMT_ACCESS_KEY_ID=...
RCLONE_CONFIG_RMT_SECRET_ACCESS_KEY=...
RCLONE_CONFIG_RMT_REGION=eu-west-1
```

#### Google Cloud Storage (GCS)

```
RCLONE_CONFIG_RMT_TYPE=gcs
RCLONE_CONFIG_RMT_PROJECT_NUMBER=...
RCLONE_CONFIG_RMT_SERVICE_ACCOUNT_CREDENTIALS={ "type": "service_account", ... }
```

#### Azure Blob Storage

```
RCLONE_CONFIG_RMT_TYPE=azureblob
RCLONE_CONFIG_RMT_ACCOUNT=...
RCLONE_CONFIG_RMT_KEY=...
```

#### Cloudflare R2

```
RCLONE_CONFIG_RMT_TYPE=s3
RCLONE_CONFIG_RMT_PROVIDER=Cloudflare
RCLONE_CONFIG_RMT_ACCESS_KEY_ID=...
RCLONE_CONFIG_RMT_SECRET_ACCESS_KEY=...
RCLONE_CONFIG_RMT_ENDPOINT=https://<account_id>.r2.cloudflarestorage.com
```

#### Backblaze B2

```
RCLONE_CONFIG_RMT_TYPE=b2
RCLONE_CONFIG_RMT_ACCOUNT=...
RCLONE_CONFIG_RMT_KEY=...
```

#### MinIO (and other S3-compatible)

```
RCLONE_CONFIG_RMT_TYPE=s3
RCLONE_CONFIG_RMT_PROVIDER=Minio
RCLONE_CONFIG_RMT_ACCESS_KEY_ID=...
RCLONE_CONFIG_RMT_SECRET_ACCESS_KEY=...
RCLONE_CONFIG_RMT_ENDPOINT=https://minio.example.com
```

## Support

Please review or open issues in the [issue tracker][ISS01].

[ISS01]: https://github.com/rafacouto/docker-mariabackup/issues

## License

AGPL. See [LICENSE](LICENSE) file.

## Contributors

- Rafa Couto <caligari@treboada.net>

