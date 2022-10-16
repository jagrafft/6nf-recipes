# Sixth Normal Form (6NF) Recipe Ratio Database

Data and SQLite database setup scripts for the Observable Notebook [Baker's Percentage Calculator](https://observablehq.com/@jagrafft/bakers-percentage-calculator).

## Schema
| Table                            | Type    | Columns                           |
|:---------------------------------|:-------:|:----------------------------------|
| `default_masses`                 | `Data`  | `id, mass`                        |
| `ingredient_list`                | `Data`  | `id, ingredient`                  |
| `recipe_citation_accessed_dates` | `Data`  | `id, date`                        |
| `recipe_citation_author_names`   | `Data`  | `id, author`                      |
| `recipe_citation_date_values`    | `Data`  | `id, date`                        |
| `recipe_list`                    | `Data`  | `id, recipe`                      |
| `recipe_citation_authors`        | `Link`  | `recipe_id, author_id`            |
| `recipe_citation_accessed`       | `Link`  | `recipe_id, accessed_date_id`     |
| `recipe_citation_dates`          | `Link`  | `recipe_id, citation_date_id`     |
| `recipe_default_masses`          | `Link`  | `recipe_id, mass_id`              |
| `ingredient_ratio_lists`         | `Value` | `recipe_id, ingredient_id, ratio` |
| `recipe_citation_titles`         | `Value` | `recipe_id, title`                |
| `recipe_citation_urls`           | `Value` | `recipe_id, url`                  |

### Summaries
| Count | Table Type | Description                                                                  |
|:-----:|:----------:|:-----------------------------------------------------------------------------|
| `6`   | `Data`     | No columns reference other tables                                            |
| `4`   | `Link`     | All columns reference other tables                                           |
| `3`   | `Value`    | Primary Key<sup>\*</sup> is a reference, right-most column holds data values |

<span style="font-size: 10pt;"><sup>\*</sup> - Keys may be of airty `>= 1`.</span>

| Count | Entity             | Entity Type                         | Description                                                              |
|:-----:|:-------------------|:------------------------------------|:-------------------------------------------------------------------------|
| `7`   | `recipe_id`        | `Primary Key, Integer, Foreign Key` | Key of `recipe_list`                                                     |
| `6`   | `id`               | `Primary Key, Integer`              | Integer identifier for data value, referenced by other tables            |
| `2`   | `date`             | `Text, No Null`                     | Date, represented as one of two formats `{ YYYY-MM-DD ; [DD] Mon YYYY }` |
| `1`   | `accessed_date_id` | `Integer, No Null, Foreign Key`     | Key of `recipe_citation_accessed_dates`                                  |
| `1`   | `author`           | `Text, No Null`                     | Full name of author, e.g. "Suzie Quantum, Esq."                          |
| `1`   | `author_id`        | `Integer, Foreign Key`              | Key of `recipe_citation_authors`                                         |
| `1`   | `citation_date_id` | `Integer, Foreign Key`              | Key of `recipe_citation_date_values`                                     |
| `1`   | `ingredient`       | `Text, No Null`                     | Name of ingredient                                                       |
| `1`   | `ingredient_id`    | `Integer, Foreign Key`              | Key of `ingredient_list`                                                 |
| `1`   | `mass`             | `Real, No Null`                     | Default mass for a recipe, in grams (g)                                  |
| `1`   | `mass_id`          | `Integer, Foreign Key`              | Key of `default_masses`                                                  |
| `1`   | `ratio`            | `Real, No Null`                     | Proportion of total flour an ingredient represents in a given recipe     |
| `1`   | `recipe`           | `Text, No Null`                     | Name of recipe                                                           |
| `1`   | `title`            | `Text, No Null`                     | Title of recipe, sometimes diverges from `recipe`                        |
| `1`   | `url`              | `Text, No Null`                     | URL citation may be accessed at                                          |
