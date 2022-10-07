CREATE TABLE ingredient_ratio_lists (
       recipe_id INTEGER NO NULL REFERENCES recipe_list(id) ON DELETE CASCADE,
       ingredient_id INTEGER NO NULL REFERENCES ingredient_list(id) ON DELETE CASCADE,
       ratio REAL NO NULL,
       PRIMARY KEY (recipe_id, ingredient_id)
);
