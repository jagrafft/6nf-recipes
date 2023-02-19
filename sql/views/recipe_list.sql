CREATE VIEW recipe_list AS
SELECT
  data_urls.id,
  data_titles.title
FROM
  data_urls
LEFT JOIN recipe_titles ON
  recipe_titles.url_id = data_urls.id
LEFT JOIN data_titles ON
  recipe_titles.title_id = data_titles.id
