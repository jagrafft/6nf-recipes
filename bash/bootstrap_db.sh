#!/bin/sh
if [[ $# -ne 1 ]]
then
	echo "Requires a single argument, e.g. ./bootstrap_db.sh <DATABASE_NAME>"
	exit
fi

DATABASE="${1}"

# Create Tables #
sqlite3 ${DATABASE} < "sql/schema.sql"

# Create Views
# sqlite3 ${DATABASE} < sql/views/...
