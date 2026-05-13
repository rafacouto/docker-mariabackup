#!/bin/bash

require_env_var() {
	if [ -z "${!1}" ] ; then
		echo "Missing env var $1"
		exit 1
	fi
}

expect_rc() {
	if [ "$2" == "$1" ] ; then
		echo "$3 OK"
	else
		echo "$3 expected return code $1 but got $2: aborting"
		exit 1
	fi
}

DUMP_ARCHIVE=/tmp/dump.sql.zst
require_env_var MARIADB_USERNAME
require_env_var MARIADB_PASSWORD
require_env_var MARIADB_HOSTNAME
require_env_var RCLONE_REMOTE_PATH

EXTRA_ARGS=${MARIADB_DUMP_ARGS:---single-transaction}
if [ -z $MARIADB_DATABASES ] ; then
	DB_ARG='--all-databases'
else
	DB_ARG="--databases ${MARIADB_DATABASES}"
fi

/usr/bin/mariadb-dump \
	--user=${MARIADB_USERNAME} --password=${MARIADB_PASSWORD} \
	--host=${MARIADB_HOSTNAME} --port=${MARIADB_PORT:-3306} \
	${EXTRA_ARGS} ${DB_ARG} \
	| zstd > $DUMP_ARCHIVE

[ $(zstdcat $DUMP_ARCHIVE | tail | grep -c 'Dump completed on ') -gt 0 ] || exit 2

REMOTE_FILE="dump-$(date +%Y%m%d).sql.zst"
/usr/local/bin/rclone -v copyto "${DUMP_ARCHIVE}" "rmt:${RCLONE_REMOTE_PATH}/${REMOTE_FILE}" 
RC=$?
expect_rc 0 $RC 'rclone'

exit 0
