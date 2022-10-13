# Sixth Normal Form (6NF) Recipe Ratio Database

Data and SQLite database setup scripts for the Observable Notebook [Baker's Percentage Calculator](https://observablehq.com/@jagrafft/bakers-percentage-calculator).

## Schema
| Table                            | Type   | Columns          | Column Properties |
|:---------------------------------|:------:|:-----------------|:------------------|
| `default_masses`                 | `Data` | `id, mass`       |                   |
| `ingredient_list`                | `Data` | `id, ingredient` |                   |
| `recipe_citation_author_names`   | ``     | ``               |                   |
| `recipe_citation_accessed_dates` | ``     | ``               |                   |
| `recipe_citation_date_values`    | ``     | ``               |                   |
| `recipe_list`                    | ``     | ``               |                   |
| `recipe_citation_authors`        | ``     | ``               |                   |
| `ingredient_ratio_lists`         | ``     | ``               |                   |
| `recipe_citation_accessed`       | ``     | ``               |                   |
| `recipe_citation_dates`          | ``     | ``               |                   |
| `recipe_citation_titles`         | ``     | ``               |                   |
| `recipe_citation_urls`           | ``     | ``               |                   |
| `recipe_default_masses`          | ``     | ``               |                   |

### Summaries
| Count | Table Type | Description                                                                  |
|:-----:|:----------:|:-----------------------------------------------------------------------------|
| `6`   | `Data`     | No columns reference other tables                                            |
| `4`   | `Link`     | All columns reference other tables                                           |
| `3`   | `Value`    | Primary Key<sup>\*</sup> is a reference, right-most column holds data values |

<span style="font-size: 10pt;"><sup>\*</sup> - Keys may be of airty `>= 1`.</span>

| Count | Entity             | Entity Type                         | Description                                                   |
|:-----:|:------------------:|:-----------------------------------:|:--------------------------------------------------------------|
| `7`   | `recipe_id`        | `Primary Key, Integer, Foreign Key` |                                                               |
| `6`   | `id`               | `Primary Key, Integer`              | Integer identifier for data value, referenced by other tables |
| `2`   | `date`             | `Text, No Null`                     | Date used as reference by table with similar name             |
| `1`   | `access_date_id`   | `Integer, No Null, Foreign Key`     | Date a citation was accessed                                  |
| `1`   | `author`           | `Text, No Null`                     | Full name of author, e.g. "Suzie Quantum, Esq."               |
| `1`   | `author_id`        | ``                                  |                                                               |
| `1`   | `citation_date_id` | ``                                  |                                                               |
| `1`   | `ingredient`       | ``                                  |                                                               |
| `1`   | `ingredient_id`    | ``                                  |                                                               |
| `1`   | `mass`             | ``                                  |                                                               |
| `1`   | `mass_id`          | ``                                  |                                                               |
| `1`   | `ratio`            | ``                                  |                                                               |
| `1`   | `recipe`           | ``                                  |                                                               |
| `1`   | `title`            | ``                                  |                                                               |
| `1`   | `url`              | ``                                  |                                                               |
