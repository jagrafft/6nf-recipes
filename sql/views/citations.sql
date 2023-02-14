CREATE VIEW citations AS 
WITH
  citation_title AS (
    SELECT
      url_id,
      title_id
    FROM
      recipe_citation_titles
  ),
  citation_author AS (
    SELECT
        url_id,
        author_id
    FROM
        recipe_authors
  ),
  citation_date AS (
    SELECT
        url_id,
        date_id
    FROM
      recipe_dates
  ),
  citation_accessed_date AS (
    SELECT
        url_id,
        date_id
    FROM
      recipe_access_dates
  )
SELECT
    data_titles.title AS citation_title,
    data_authors.author AS citation_author,
    data_dates.dt AS citation_date,
    data_dates.dt AS citation_access_date
    data_urls.url AS citation_url
FROM

--  recipe_title
--LEFT JOIN recipe_url ON
--  recipe_title.recipe_id = recipe_url.recipe_id
--LEFT JOIN recipe_author ON
--  recipe_title.recipe_id = recipe_author.recipe_id
--LEFT JOIN recipe_citation_date ON
--  recipe_title.recipe_id = recipe_citation_date.recipe_id
--LEFT JOIN recipe_citation_accessed_date ON
--  recipe_title.recipe_id = recipe_citation_accessed_date.recipe_id
