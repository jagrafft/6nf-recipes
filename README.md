# Sixth Normal Form (6NF) Recipe Ratio Database: `dbml` branch

Bootstrap scripts for the [SQLite][sqlite] databased used by [Baker's Percentage Calculator][bpcalcobs]. Add recipes by editing the CSVs in `data/`. Python script transforms 1st/2nd normal form input data into a 6th normal form SQL database.

## Using
- Install [Poetry][pypoetry]
  - https://python-poetry.org/docs/#installation
- Clone repository
- `cd 6nf-recipes`
- `poetry install`
- `poetry run python3 python/csv-to-sqlite.py`
  - Outputs `[YYYY-mm-dd]_bp_recipes.db`

## Feature List
- [x] [dbml][dbml] for generating SQL (via [dbml-cli][dbmlcli])
  - **NOTE** dbml does not support SQLite output, so `sql/schema.sql` is manually edited after generation
- [x] Populate database by "decomposing" human-readable spreadsheets
  - [x] Refactor dataset
  - [x] Write Python script to
    - [x] Load CSV data
    - [x] Restructure CSV data
    - [x] Create SQLite database
    - [x] Populate SQLite database with
      - [x] Data
      - [x] Schema
      - [x] Relations
      - [x] Views
        - [x] Ingredients list
        - [x] Recipe citations
        - [x] Recipe default mass
        - [x] Recipe list
    - [x] Validate data written to database

## Schema
![database schema](dbml/schema.png)
[[pdf](dbml/schema.pdf) | [dbdiagram.io interactive visualization](https://dbdiagram.io/d/63dfc0d0296d97641d7e8c4f)]

[bpcalcobs]: https://observablehq.com/@jagrafft/bakers-percentage-calculator
[dbml]: https://www.dbml.org/
[dbmlcli]: https://www.dbml.org/cli/
[pypoetry]: https://python-poetry.org
[sqlite]: https://www.sqlite.org/
