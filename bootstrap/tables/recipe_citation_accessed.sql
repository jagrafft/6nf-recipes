CREATE TABLE recipe_citation_accessed (
       recipe_id INTEGER PRIMARY KEY REFERENCES recipe_list(id) ON DELETE CASCADE,
       date_id INTEGER NO NULL REFERENCES recipe_citation_accessed_dates(id)
);
