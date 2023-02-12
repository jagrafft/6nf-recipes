import pandas
import sqlite3

from datetime import datetime
from pathlib import Path
from subprocess import call

project_root = Path(__file__).parent.parent

### Mapping from CSV columns to SQL tables ###
data_map = {
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

relation_map = {
    "title": "recipe_titles",
    "citation_title": "recipe_citation_titles",
    "author": "recipe_authors",
    "date": "recipe_dates",
    "access_date": "recipe_access_dates",
    "default_mass": "recipe_default_masses",
    "ingredient": "recipe_ingredients",
    "bakers_percentage": "recipe_bakers_percentages",
}
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

# Add schema and views to database
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
        if data_map[col] in indexed_tuples:
            indexed_tuples[data_map[col]].extend(df[col].unique())
        else:
            indexed_tuples[data_map[col]] = [*df[col].unique()]

# Transform arrays into enumerated sets of unique values
for (k, v) in indexed_tuples.items():
    indexed_tuples[k] = [(i + 1, v) for (i, v) in enumerate(set(v))]
###

### Create relationsships between data entites ###
relation_tuples = {}

# Map data values to keys (used for populating relational tables)
data_value_map = {}
for (tbl, vals) in indexed_tuples.items():
    data_value_map[tbl] = {k: v for (v, k) in vals}

# Populate recipe data relations
for row in recipes.drop("recipe_id", axis=1).itertuples(index=False):
    url_id = data_value_map["data_urls"][row.url]

    row_dict = row._asdict()
    del row_dict["url"]

    for (k, v) in row_dict.items():
        relation = relation_map[k]
        if relation in relation_tuples:
            relation_tuples[relation].append((url_id, data_value_map[data_map[k]][v]))
        else:
            relation_tuples[relation] = [(url_id, data_value_map[data_map[k]][v])]

# Ingredients data
# NB. Handled separately due to 2-airty key/3-airty tuple

# Map URL strings to recipe_ids
recipe_id_map = {}

for row in recipes[["url", "recipe_id"]].itertuples(index=False):
    recipe_id_map[row.recipe_id] = data_value_map["data_urls"][row.url]

# Create relation from maps
bp_relation_tuples = []

for (i, row) in enumerate(ingredients.itertuples(index=False)):
    bp_relation_tuples.append(
        (
            recipe_id_map[row.recipe_id],
            data_value_map["data_ingredients"][row.ingredient],
            data_value_map["data_ratios"][row.bakers_percentage],
        )
    )
###

### Populate SQLite database ###
cursor = connection.cursor()

# Data Tables
for dataset in [indexed_tuples, relation_tuples]:
    for (tbl, vals) in dataset.items():
        cursor.executemany(f"INSERT INTO {tbl} VALUES (?,?)", vals)
        connection.commit()

# Handled separately due to 2-airty key/3-airty tuple
cursor.executemany(
    f"INSERT INTO recipe_bakers_percentages VALUES (?,?,?)", bp_relation_tuples
)
connection.commit()
###

# validate (TODO design)
### Validate Database Tables ###
###

# Close database connection
cursor.close()
connection.close()
# DONE
