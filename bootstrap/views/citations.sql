CREATE VIEW citations AS 
WITH
  recipe_title AS (
    SELECT
      recipe_id,
      title
    FROM
      recipe_citation_titles
  ),
  recipe_url AS (
    SELECT
      recipe_id,
      url
    FROM
      recipe_citation_urls
  ),
  recipe_author AS (
    SELECT
      recipe_citation_authors.recipe_id,
      recipe_citation_author_names.author
    FROM
      recipe_citation_authors
    LEFT JOIN recipe_citation_author_names ON
      recipe_citation_authors.author_id = recipe_citation_author_names.id
  ),
  recipe_citation_date AS (
    SELECT
      recipe_citation_dates.recipe_id,
      recipe_citation_date_values.date
    FROM
      recipe_citation_dates
    LEFT JOIN recipe_citation_date_values ON
      recipe_citation_dates.date_id = recipe_citation_date_values.id
  ),
  recipe_citation_accessed_date AS (
    SELECT
      recipe_citation_accessed.recipe_id,
      recipe_citation_accessed_dates.date
    FROM
      recipe_citation_accessed
    LEFT JOIN recipe_citation_accessed_dates ON
      recipe_citation_accessed.date_id = recipe_citation_accessed_dates.id
  )
SELECT
  recipe_title.recipe_id,
  recipe_author.author,
  recipe_title.title,
  recipe_citation_date.date AS citation_date,
  recipe_citation_accessed_date.date AS access_date,
  recipe_url.url
FROM
  recipe_title
LEFT JOIN recipe_url ON
  recipe_title.recipe_id = recipe_url.recipe_id
LEFT JOIN recipe_author ON
  recipe_title.recipe_id = recipe_author.recipe_id
LEFT JOIN recipe_citation_date ON
  recipe_title.recipe_id = recipe_citation_date.recipe_id
LEFT JOIN recipe_citation_accessed_date ON
  recipe_title.recipe_id = recipe_citation_accessed_date.recipe_id

