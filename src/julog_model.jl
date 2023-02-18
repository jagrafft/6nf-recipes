using Julog

#=
=#

clauses = @julog [
    # Facts (e.g. data) #
    # (Key)
    primary_key(id) <<= true,
    primary_key(ingredient_id) <<= true,
    primary_key(recipe_id) <<= true,
    # (Key, Table, Column)
    foreign_key_assoc(access_date_id, citation_access_dates, id) <<= true,
    foreign_key_assoc(author_id, authors, id) <<= true,
    foreign_key_assoc(citation_date_id, citation_dates, id) <<= true,
    foreign_key_assoc(ingredient_id, ingredients, id) <<= true,
    foreign_key_assoc(mass_id, masses, id) <<= true,
    foreign_key_assoc(recipe_id, recipes, id) <<= true,
    # (Table, Column)
    table_column(authors, id) <<= true,
    table_column(authors, author) <<= true,
    table_column(bakers_percentages, recipe_id) <<= true,
    table_column(bakers_percentages, ingredient_id) <<= true,
    table_column(bakers_percentages, ratio) <<= true,
    table_column(citation_access_dates, id) <<= true,
    table_column(citation_access_dates, access_date) <<= true,
    table_column(citation_dates, id) <<= true,
    table_column(citation_dates, citation_date) <<= true,
    table_column(citation_titles, recipe_id) <<= true,
    table_column(citation_titles, title) <<= true,
    table_column(citation_urls, recipe_id) <<= true,
    table_column(citation_urls, url) <<= true,
    table_column(ingredients, id) <<= true,
    table_column(ingredients, ingredient) <<= true,
    table_column(masses, id) <<= true,
    table_column(masses, mass) <<= true,
    table_column(recipe_access_date_ids, recipe_id) <<= true,
    table_column(recipe_access_date_ids, access_date_id) <<= true,
    table_column(recipe_author_ids, recipe_id) <<= true,
    table_column(recipe_author_ids, author_id) <<= true,
    table_column(recipe_citation_date_ids, recipe_id) <<= true,
    table_column(recipe_citation_date_ids, citation_date_id) <<= true,
    table_column(recipe_mass_ids, recipe_id) <<= true,
    table_column(recipe_mass_ids, mass_id) <<= true,
    table_column(recipes, id) <<= true,
    table_column(recipes, recipe) <<= true,
    # Rules #
    data_key(K) <<= table_column(_, K) & !foreign_key_assoc(K, _, _) & !primary_key(K),
    foreign_key(K) <<= table_column(_, K) & foreign_key_assoc(K, _, _),
    # { FK => Foreign Key, DA => Data Column,
    #   PFK => Primary Foreign Key, PK => Primary Key }
    col(T, K, "DA") <<= table_column(T, K) & !primary_key(K) & !foreign_key(K),
    col(T, K, "FK") <<= table_column(T, K) & !primary_key(K) & foreign_key(K),
    col(T, K, "PFK") <<= table_column(T, K) & primary_key(K) & foreign_key(K),
    col(T, K, "PK") <<= table_column(T, K) & primary_key(K) & !foreign_key(K),
]
