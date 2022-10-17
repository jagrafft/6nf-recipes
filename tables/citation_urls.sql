CREATE TABLE citation_urls (
    recipe_id INTEGER PRIMARY KEY REFERENCES recipe_list(id) ON DELETE CASCADE,
    url TEXT NO NULL
);