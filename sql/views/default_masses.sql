CREATE VIEW default_masses AS
SELECT
  data_urls.id,
  data_default_masses.grams
FROM
  data_urls
LEFT JOIN recipe_default_masses ON
  recipe_default_masses.url_id = data_urls.id
LEFT JOIN data_default_masses ON
  recipe_default_masses.grams_id = data_default_masses.id
