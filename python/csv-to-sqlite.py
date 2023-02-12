import pandas
import sqlite3

from datetime import datetime
from pathlib import Path
from subprocess import call

project_root = Path(__file__).parent.parent

### Schema for Populating Database ###
# Data <- (CSV Column, SQLite Column)
# Script will generate keys
# NB. Since all tables use `url_id` as a primary key it is not listed
data_column_map = {
    "title": "data_titles",
    "citation_title": "data_titles",
    "author": "data_authors",
    "date": "data_dates",
    "access_date": "data_dates",
    "default_mass": "data_default_masses",
    "url": "data_urls",
    "ingredient": "data_ingredients",
    "bakers_percentage": "data_ratios",
}

# "link"
###

### Create SQLite Database ###
# Rename conflicting database file, if one exists
db_name = f"{datetime.now().strftime('%Y-%m-%d')}_bp_recipes.db"
db_path = project_root / db_name
if Path.exists(db_path):
    db_path.rename(project_root / f"{datetime.now().strftime('%s')}-{db_name}.bak")

# Connect to database, which implicitly creates a new database
# due to the renaming instructions above
connection = sqlite3.connect(db_path)

# Bootstrap database schema
call(["sh", "bash/bootstrap_db.sh", db_name])
###

### Load Data from CSVs ###
ingredients = pandas.read_csv(project_root / "data" / "ingredient_lists.csv")
recipes = pandas.read_csv(project_root / "data" / "recipes.csv")
###

### Transform data columns ###
indexed_tuples = {}
# Push values from CSV columns into an array
for df in [ingredients, recipes]:
    for col in df.drop("recipe_id", axis=1):
        if data_column_map[col] in indexed_tuples:
            indexed_tuples[data_column_map[col]].extend(df[col].unique())
        else:
            indexed_tuples[data_column_map[col]] = [*df[col].unique()]

# Transform arrays into enumerated sets of unique values
for (k, v) in indexed_tuples.items():
    indexed_tuples[k] = [(i + 1, v) for (i, v) in enumerate(set(v))]

# Map data values to keys to use for creating relation tables
data_value_map = {}

for (tbl, vals) in indexed_tuples.items():
    data_value_map[tbl] = {k: v for (v, k) in vals}
###

### Populate SQLite database ###
cursor = connection.cursor()

# Data Tables
for (tbl, vals) in indexed_tuples.items():
    cursor.executemany(f"INSERT INTO {tbl} VALUES (?,?)", vals)
    connection.commit()

# Relation Tables

print(data_value_map)
###

# install views (and such)...

# validate (TODO design)
### Validate Database Tables ###
###

# Close database connection
cursor.close()
connection.close()
# DONE
