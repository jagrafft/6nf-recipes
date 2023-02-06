#!/bin/sh
if [[ $# -ne 1 ]]
then
	echo "Requires a single argument, e.g. ./bootstrap_db.sh <DATABASE_NAME>"
	exit
fi

DATABASE="${1}.db"

# Create Tables #
sqlite3 ${DATABASE} < "sql/schema.sql"

# Populate Tables #
# Tables with no dependencies
# echo "authors" | xargs -I% sqlite3 ${DATABASE} ".mode csv" ".import --skip 1 data/%.csv %" ".exit"
# echo "citation_access_dates" | xargs -I% sqlite3 ${DATABASE} ".mode csv" ".import --skip 1 data/%.csv %" ".exit"
# echo "citation_dates" | xargs -I% sqlite3 ${DATABASE} ".mode csv" ".import --skip 1 data/%.csv %" ".exit"
# echo "ingredients" | xargs -I% sqlite3 ${DATABASE} ".mode csv" ".import --skip 1 data/%.csv %" ".exit"
# echo "masses" | xargs -I% sqlite3 ${DATABASE} ".mode csv" ".import --skip 1 data/%.csv %" ".exit"
# echo "recipes" | xargs -I% sqlite3 ${DATABASE} ".mode csv" ".import --skip 1 data/%.csv %" ".exit"

# Tables with dependencies
# echo "bakers_percentages" | xargs -I% sqlite3 ${DATABASE} ".mode csv" ".import --skip 1 data/%.csv %" ".exit"
# echo "citation_titles" | xargs -I% sqlite3 ${DATABASE} ".mode csv" ".import --skip 1 data/%.csv %" ".exit"
# echo "citation_urls" | xargs -I% sqlite3 ${DATABASE} ".mode csv" ".import --skip 1 data/%.csv %" ".exit"
# echo "recipe_access_date_ids" | xargs -I% sqlite3 ${DATABASE} ".mode csv" ".import --skip 1 data/%.csv %" ".exit"
# echo "recipe_author_ids" | xargs -I% sqlite3 ${DATABASE} ".mode csv" ".import --skip 1 data/%.csv %" ".exit"
# echo "recipe_citation_date_ids" | xargs -I% sqlite3 ${DATABASE} ".mode csv" ".import --skip 1 data/%.csv %" ".exit"
# echo "recipe_mass_ids" | xargs -I% sqlite3 ${DATABASE} ".mode csv" ".import --skip 1 data/%.csv %" ".exit"

# Create Views
# sqlite3 ${DATABASE} < views/citations.sql
