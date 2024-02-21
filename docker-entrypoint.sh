#!/bin/bash

require_env_var() {
	if [ -z "${!1}" ] ; then
		echo "Missing env var $1"
		exit 1
	fi
}

expect_rc() {
	if [ $code -eq $1 ] ; then
		echo "$3 OK"
	else
		echo "$3 expected return with $1 but $2: abort"
		exit 1
	fi
}

DUMP_ARCHIVE=/tmp/dump-$(date +%s).sql.zst
require_env_var MARIADB_USERNAME
require_env_var MARIADB_PASSWORD
require_env_var MARIADB_HOSTNAME

EXTRA_ARGS=${MARIADB_DUMP_ARGS:---single-transaction}
DB_ARG=$([ -s $MARIADB_DATABASES ] && echo "--databases ${MARIADB_DATABASES}" || echo '--all-databases')

/usr/bin/mariadb-dump \
	--user=${MARIADB_USERNAME} --password=${MARIADB_PASSWORD} \
	--host=${MARIADB_HOSTNAME} --port=${MARIADB_PORT:-3306} \
	${EXTRA_ARGS} ${DB_ARG} \
	| zstd > $DUMP_ARCHIVE

expect_rc 0 $? 'mariadb-dump'

exit 0
