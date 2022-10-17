CREATE TABLE recipe_access_date_ids (
       recipe_id INTEGER PRIMARY KEY REFERENCES recipe_list(id) ON DELETE CASCADE,
       access_date_id INTEGER NO NULL REFERENCES recipe_citation_accessed_dates(id)
);
