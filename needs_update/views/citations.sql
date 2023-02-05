CREATE VIEW citations AS 
WITH
  recipe_title AS (
    SELECT
      recipe_id,
      title
    FROM
      citation_titles
  ),
  recipe_url AS (
    SELECT
      recipe_id,
      url
    FROM
      citation_urls
  ),
  recipe_author AS (
    SELECT
      recipe_author_ids.recipe_id,
      authors.author
    FROM
      recipe_author_ids
    LEFT JOIN authors ON
      recipe_author_ids.author_id = authors.id
  ),
  recipe_citation_date AS (
    SELECT
      recipe_citation_date_ids.recipe_id,
      citation_dates.citation_date
    FROM
      recipe_citation_date_ids
    LEFT JOIN citation_dates ON
      recipe_citation_date_ids.citation_date_id = citation_dates.id
  ),
  recipe_citation_accessed_date AS (
    SELECT
      recipe_access_date_ids.recipe_id,
      citation_access_dates.access_date
    FROM
      recipe_access_date_ids
    LEFT JOIN citation_access_dates ON
      recipe_access_date_ids.access_date_id = citation_access_dates.id
  )
SELECT
  recipe_title.recipe_id,
  recipe_author.author,
  recipe_title.title,
  recipe_citation_date.citation_date AS citation_date,
  recipe_citation_accessed_date.access_date AS access_date,
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

