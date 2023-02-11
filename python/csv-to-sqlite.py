# import pandas
import sqlite3

from datetime import datetime
from pathlib import Path
from subprocess import call

project_root = Path(__file__).parent.parent

### Schema for Populating Database ###
# data
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
db = sqlite3.connect(db_path)

# Bootstrap database schema
call(["sh", "bash/bootstrap_db.sh", db_name])
###

### Load Data from CSVs ###
# ingredients = pandas.read_csv(project_root / "data" / "ingredient_lists.csv")
# recipes = pandas.read_csv(project_root / "data" / "recipes.csv")
###

# iterate dataframes...
#    write to sqlite3 db...

# install views (and such)...

# validate (TODO design)
### Validate Database Tables ###
###

# DONE
