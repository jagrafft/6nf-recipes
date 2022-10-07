CREATE TABLE recipe_citation_dates (
    recipe_id INTEGER PRIMARY KEY REFERENCES recipe_list(id) ON DELETE CASCADE,
    date_id INTEGER NO NULL REFERENCES recipe_citation_date_values(id)
);