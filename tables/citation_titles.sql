CREATE TABLE citation_titles (
    recipe_id INTEGER PRIMARY KEY REFERENCES recipe_list(id) ON DELETE CASCADE,
    title TEXT NO NULL
);
