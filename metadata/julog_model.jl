using Julog

#=
=#

clauses = @julog [
    # "Facts" (e.g. data)
    table_column(authors, id) <<= true,
    table_column(authors, author) <<= true,
    table_column(bakers_percentages, recipe_id) <<= true,
    table_column(bakers_percentages, ingredient_id) <<= true,
    table_column(bakers_percentages, ratio) <<= true,
    table_column(citation_dates, id) <<= true,
    table_column(citation_dates, citation_date) <<= true,
    table_column(citation_access_dates, id) <<= true,
    table_column(citation_access_dates, access_date) <<= true,
    table_column(citation_titles, recipe_id) <<= true,
    table_column(citation_titles, title) <<= true,
    table_column(citation_urls, recipe_id) <<= true,
    table_column(citation_urls, url) <<= true,
    table_column(ingredients, id) <<= true,
    table_column(ingredients, ingredient) <<= true,
    table_column(masses, id) <<= true,
    table_column(masses, mass) <<= true,
    table_column(recipes, id) <<= true,
    table_column(recipes, recipe) <<= true,
    table_column(recipe_access_date_ids, recipe_id) <<= true,
    table_column(recipe_access_date_ids, access_date_id) <<= true,
    table_column(recipe_author_ids, recipe_id) <<= true,
    table_column(recipe_author_ids, author_id) <<= true,
    table_column(recipe_citation_date_ids, recipe_id) <<= true,
    table_column(recipe_citation_date_ids, citation_date_id) <<= true,
    table_column(recipe_mass_ids, recipe_id) <<= true,
    table_column(recipe_mass_ids, mass_id) <<= true,
    foreign_key_assoc(recipe_id, recipes, id) <<= true,
    foreign_key_assoc(author_id, authors, id) <<= true,
    foreign_key_assoc(mass_id, masses, id) <<= true,
    foreign_key_assoc(ingredient_id, ingredients, id) <<= true,
    foreign_key_assoc(citation_date_id, citation_dates, id) <<=true,
    foreign_key_assoc(access_date_id, citation_access_dates, id) <<= true,
    # Rules
    data_key(K) <<= table_column(T,K) & !foreign_key_assoc(K,_,_) & !foreign_key_assoc(_,T,K),
    foreign_key(K) <<= table_column(_,K) & foreign_key_assoc(K,_,_)
]
