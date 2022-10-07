CREATE TABLE recipe_default_masses (
    recipe_id INTEGER PRIMARY KEY REFERENCES recipe_list(id) ON DELETE CASCADE,
    mass_id INTEGER NO NULL REFERENCES default_masses(id)
);