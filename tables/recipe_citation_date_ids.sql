CREATE TABLE recipe_citation_date_ids (
    recipe_id INTEGER PRIMARY KEY REFERENCES recipe_list(id) ON DELETE CASCADE,
    citation_date_id INTEGER NO NULL REFERENCES recipe_citation_date_values(id)
);
