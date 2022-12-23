# Sixth Normal Form (6NF) Recipe Ratio Database: Model

[Julog](https://github.com/ztangent/Julog.jl) model of column and table relationships used to cross-validate the database's [schema](https://github.com/jagrafft/6nf-recipes#schema).

### Execution
1. If necessary, install [Julia](https://julialang.org/)
1. `cd path/to/6nf-recipes`
1. `julia -e 'using Pkg; Pkg.add("Julog")'`
1. `julia model/run_julog_model.jl`

#### Example Output
```julia
# primary_key(K) #
satisfied: true
  {K => id}
  {K => ingredient_id}
  {K => recipe_id}

# data_key(K) #
satisfied: true
  {K => author}
  {K => ratio}
  {K => access_date}
  {K => citation_date}
  {K => title}
  {K => url}
  {K => ingredient}
  {K => mass}
  {K => recipe}

# foreign_key(K) #
satisfied: true
  {K => recipe_id}
  {K => ingredient_id}
  {K => access_date_id}
  {K => author_id}
  {K => citation_date_id}
  {K => mass_id}

# column_type(Type(Y), Column(C), Table(T)) #
satisfied: true
  {Y => DATA_COLUMN, C => author, T => authors}
  {Y => DATA_COLUMN, C => ratio, T => bakers_percentages}
  {Y => DATA_COLUMN, C => access_date, T => citation_access_dates}
  {Y => DATA_COLUMN, C => citation_date, T => citation_dates}
  {Y => DATA_COLUMN, C => title, T => citation_titles}
  {Y => DATA_COLUMN, C => url, T => citation_urls}
  {Y => DATA_COLUMN, C => ingredient, T => ingredients}
  {Y => DATA_COLUMN, C => mass, T => masses}
  {Y => DATA_COLUMN, C => recipe, T => recipes}
  {Y => PRIMARY_KEY, C => id, T => authors}
  {Y => PRIMARY_KEY, C => id, T => citation_access_dates}
  {Y => PRIMARY_KEY, C => id, T => citation_dates}
  {Y => PRIMARY_KEY, C => id, T => ingredients}
  {Y => PRIMARY_KEY, C => id, T => masses}
  {Y => PRIMARY_KEY, C => id, T => recipes}
  {Y => FOREIGN_KEY, C => access_date_id, T => recipe_access_date_ids}
  {Y => FOREIGN_KEY, C => author_id, T => recipe_author_ids}
  {Y => FOREIGN_KEY, C => citation_date_id, T => recipe_citation_date_ids}
  {Y => FOREIGN_KEY, C => mass_id, T => recipe_mass_ids}
  {Y => PRIMARY_FOREIGN_KEY, C => recipe_id, T => bakers_percentages}
  {Y => PRIMARY_FOREIGN_KEY, C => ingredient_id, T => bakers_percentages}
  {Y => PRIMARY_FOREIGN_KEY, C => recipe_id, T => citation_titles}
  {Y => PRIMARY_FOREIGN_KEY, C => recipe_id, T => citation_urls}
  {Y => PRIMARY_FOREIGN_KEY, C => recipe_id, T => recipe_access_date_ids}
  {Y => PRIMARY_FOREIGN_KEY, C => recipe_id, T => recipe_author_ids}
  {Y => PRIMARY_FOREIGN_KEY, C => recipe_id, T => recipe_citation_date_ids}
  {Y => PRIMARY_FOREIGN_KEY, C => recipe_id, T => recipe_mass_ids}

# table_write_rank(Type(Y), WriteRank(W), Table(T)) #
satisfied: true
  {Y => DATA_TABLE, W => 1, T => authors}
  {Y => DATA_TABLE, W => 1, T => citation_access_dates}
  {Y => DATA_TABLE, W => 1, T => citation_dates}
  {Y => DATA_TABLE, W => 1, T => ingredients}
  {Y => DATA_TABLE, W => 1, T => masses}
  {Y => DATA_TABLE, W => 1, T => recipes}
  {Y => VALUE_TABLE, W => 2, T => bakers_percentages}
  {Y => VALUE_TABLE, W => 2, T => citation_titles}
  {Y => VALUE_TABLE, W => 2, T => citation_urls}
  {Y => LINK_TABLE, W => 2, T => recipe_access_date_ids}
  {Y => LINK_TABLE, W => 2, T => recipe_author_ids}
  {Y => LINK_TABLE, W => 2, T => recipe_citation_date_ids}
  {Y => LINK_TABLE, W => 2, T => recipe_mass_ids}
```
