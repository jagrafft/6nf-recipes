CREATE TABLE recipe_citation_authors (
    recipe_id INTEGER PRIMARY KEY REFERENCES recipe_list(id) ON DELETE CASCADE,
    author_id INTEGER NO NULL REFERENCES recipe_citation_author_names(id)
);