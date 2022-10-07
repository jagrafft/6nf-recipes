#!/bin/sh
if [[ $# -ne 1 ]]
then
	echo "Requires a single argument, e.g. ./bootstrap_db.sh <DATABASE_NAME>"
	exit
fi

DATABASE="${1}.db"

# Create Tables
for sql in `ls tables/*.sql`
do
	sqlite3 ${DATABASE} < ${sql}
done

# Populate Tables
echo "default_masses" | xargs -I% sqlite3 ${DATABASE} ".mode csv" ".import --skip 1 data/%.csv %" ".exit"
echo "ingredient_list" | xargs -I% sqlite3 ${DATABASE} ".mode csv" ".import --skip 1 data/%.csv %" ".exit"
echo "recipe_citation_author_names" | xargs -I% sqlite3 ${DATABASE} ".mode csv" ".import --skip 1 data/%.csv %" ".exit"
echo "recipe_citation_accessed_dates" | xargs -I% sqlite3 ${DATABASE} ".mode csv" ".import --skip 1 data/%.csv %" ".exit"
echo "recipe_citation_date_values" | xargs -I% sqlite3 ${DATABASE} ".mode csv" ".import --skip 1 data/%.csv %" ".exit"
echo "recipe_list" | xargs -I% sqlite3 ${DATABASE} ".mode csv" ".import --skip 1 data/%.csv %" ".exit"

echo "recipe_citation_authors" | xargs -I% sqlite3 ${DATABASE} ".mode csv" ".import --skip 1 data/%.csv %" ".exit"
echo "ingredient_ratio_lists" | xargs -I% sqlite3 ${DATABASE} ".mode csv" ".import --skip 1 data/%.csv %" ".exit"
echo "recipe_citation_accessed" | xargs -I% sqlite3 ${DATABASE} ".mode csv" ".import --skip 1 data/%.csv %" ".exit"
echo "recipe_citation_dates" | xargs -I% sqlite3 ${DATABASE} ".mode csv" ".import --skip 1 data/%.csv %" ".exit"
echo "recipe_citation_titles" | xargs -I% sqlite3 ${DATABASE} ".mode csv" ".import --skip 1 data/%.csv %" ".exit"
echo "recipe_citation_urls" | xargs -I% sqlite3 ${DATABASE} ".mode csv" ".import --skip 1 data/%.csv %" ".exit"
echo "recipe_default_masses" | xargs -I% sqlite3 ${DATABASE} ".mode csv" ".import --skip 1 data/%.csv %" ".exit"

# Create Views
sqlite3 ${DATABASE} < views/citations.sql
