# Sixth Normal Form (6NF) Recipe Ratio Database: Model

[Julog](https://github.com/ztangent/Julog.jl) model of column and table relationships used to cross-validate the database's [schema](https://github.com/jagrafft/6nf-recipes#schema).

### Execution
1. If necessary, install [Julia](https://julialang.org/)
1. `cd path/to/6nf-recipes`
1. `julia -e 'using Pkg; Pkg.add("Julog")'`
1. `julia model/run_julog_model.jl`

#### Example Output
```julia
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

# col(Column(A), Key(B), Type(C)) #
PK => Primary Key, FK => Foreign Key, PFK => Primary Foreign Key, DA => Data Column
satisfied: true
  {A => authors, B => author, C => DA}
  {A => bakers_percentages, B => ratio, C => DA}
  {A => citation_access_dates, B => access_date, C => DA}
  {A => citation_dates, B => citation_date, C => DA}
  {A => citation_titles, B => title, C => DA}
  {A => citation_urls, B => url, C => DA}
  {A => ingredients, B => ingredient, C => DA}
  {A => masses, B => mass, C => DA}
  {A => recipes, B => recipe, C => DA}
  {A => authors, B => id, C => PK}
  {A => citation_access_dates, B => id, C => PK}
  {A => citation_dates, B => id, C => PK}
  {A => ingredients, B => id, C => PK}
  {A => masses, B => id, C => PK}
  {A => recipes, B => id, C => PK}
  {A => recipe_access_date_ids, B => access_date_id, C => FK}
  {A => recipe_author_ids, B => author_id, C => FK}
  {A => recipe_citation_date_ids, B => citation_date_id, C => FK}
  {A => recipe_mass_ids, B => mass_id, C => FK}
  {A => bakers_percentages, B => recipe_id, C => PFK}
  {A => bakers_percentages, B => ingredient_id, C => PFK}
  {A => citation_titles, B => recipe_id, C => PFK}
  {A => citation_urls, B => recipe_id, C => PFK}
  {A => recipe_access_date_ids, B => recipe_id, C => PFK}
  {A => recipe_author_ids, B => recipe_id, C => PFK}
  {A => recipe_citation_date_ids, B => recipe_id, C => PFK}
  {A => recipe_mass_ids, B => recipe_id, C => PFK}
```
