# Baker's Percentage Calculator Database Bootstrap Tool

Bootstrap scripts for the [SQLite][sqlite] databased used by [Baker's Percentage Calculator][bpcalcobs]. Add recipes by editing the CSVs in `data/` then run `python/csv-to-sqlite.py` to transform them into a ready-to-deploy 6th Normal Form SQL database.

## Using
1. Install [Poetry][pypoetry]
1. https://python-poetry.org/docs/#installation
1. Clone repository
1. `cd 6nf-recipes`
1. `poetry install`
1. `poetry run python3 python/csv-to-sqlite.py`
1. Outputs `[YYYY-mm-dd]_bp_recipes.db`

## Feature List
- [x] [dbml][dbml] for generating SQL (via [dbml-cli][dbmlcli])
  - **NOTE** dbml does not support SQLite output, so `sql/schema.sql` is manually edited after generation
- [x] Python script to populate database by "decomposing" human-readable spreadsheets
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

### Tables and Views
| Name                        | Type  | Description                                                            | Constraints          |
|-----------------------------|:-----:|------------------------------------------------------------------------|:--------------------:|
| `data_authors`              | Table | Formatted names of recipe authors                                      | `UNIQUE`             |
| `data_dates`                | Table | Formatted recipe publication and access dates                          | `UNIQUE`             |
| `data_ingredients`          | Table | Names of ingredients for all recipes                                   | `UNIQUE`             |
| `data_default_masses`       | Table | Default mass values for all recipes                                    | `UNIQUE`             |
| `data_ratios`               | Table | Default baker's percentages for all recipes                            | `UNIQUE`             |
| `data_titles`               | Table | Formatted titles for recipes and citations                             | `UNIQUE`             |
| `data_urls`                 | Table | URL for each recipe                                                    | `UNIQUE, GLOBAL KEY` |
| `recipe_access_dates`       | Table | `(url_id, date_id)` pairs for citation access dates                    | `UNIQUE TUPLE`       |
| `recipe_authors`            | Table | `(url_id, author_id)` pairs for citation authors                       | `UNIQUE TUPLE`       |
| `recipe_bakers_percentages` | Table | `(url_id, ingredient_id, ratio_id)` pairs for recipe ingredients lists | `UNIQUE TUPLE`       |
| `recipe_citation_titles`    | Table | `(url_id, title_id)` pairs for citation titles                         | `UNIQUE TUPLE`       |
| `recipe_dates`              | Table | `(url_id, date_id)` pairs for recipe publication dates                 | `UNIQUE TUPLE`       |
| `recipe_default_masses`     | Table | `(url_id, grams_id)` pairs for recipe default masses                   | `UNIQUE TUPLE`       |
| `recipe_titles`             | Table | `(url_id,title_id)` pairs for recipe titles                            | `UNIQUE TUPLE`       |
| `citations`                 | View  | Citations for each recipe with formatted strings, keyed by `url_id`    |                      |
| `default_masses`            | View  | `(url_id, grams)` for each recipe                                      |                      |
| `ingredient_list`           | View  | `(url_id, ingredient, ratio)` for each recipe                          |                      |
| `recipe_list`               | View  | `(url_id, title)` for each recipe                                      |                      |

[bpcalcobs]: https://observablehq.com/@jagrafft/bakers-percentage-calculator
[dbml]: https://www.dbml.org/
[dbmlcli]: https://www.dbml.org/cli/
[pypoetry]: https://python-poetry.org
[sqlite]: https://www.sqlite.org/
