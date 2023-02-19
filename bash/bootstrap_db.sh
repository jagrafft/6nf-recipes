#!/bin/sh
if [[ $# -ne 1 ]]
then
	echo "Requires a single argument, e.g. ./bootstrap_db.sh <DATABASE_NAME>"
	exit
fi

DATABASE="${1}"

# Populate Tables
sqlite3 ${DATABASE} < "sql/schema.sql"

# Populate Views
for sql in `/bin/ls -1 sql/views/*.sql`
do
    sqlite3 ${DATABASE} < ${sql}
done
