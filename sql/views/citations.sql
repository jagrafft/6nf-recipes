CREATE VIEW citations AS 
WITH
  citation_title AS (
    SELECT
      recipe_citation_titles.url_id,
      data_titles.title
    FROM
      recipe_citation_titles
    LEFT JOIN data_titles ON
      recipe_citation_titles.title_id = data_titles.id
  ),
  recipe_title AS (
    SELECT
      recipe_titles.url_id,
      data_titles.title
    FROM
      recipe_titles
    LEFT JOIN data_titles ON
      recipe_titles.title_id = data_titles.id
  ),
  citation_author AS (
    SELECT
        recipe_authors.url_id,
        data_authors.author
    FROM
      recipe_authors
    LEFT JOIN data_authors ON
      recipe_authors.author_id = data_authors.id
  ),
  citation_date AS (
    SELECT
        recipe_dates.url_id,
        data_dates.dt AS _date
    FROM
      recipe_dates
    LEFT JOIN data_dates ON
      recipe_dates.date_id = data_dates.id
  ),
  citation_accessed_date AS (
    SELECT
        recipe_access_dates.url_id,
        data_dates.dt AS _date
    FROM
      recipe_access_dates
    LEFT JOIN data_dates ON
      recipe_access_dates.date_id = data_dates.id
  )
SELECT
  data_urls.id AS id,
  recipe_title.title AS recipe,
  citation_title.title AS title,
  citation_author.author AS author,
  citation_date._date AS publication_date,
  citation_accessed_date._date AS access_date,
  data_urls.url AS url
FROM
  data_urls
LEFT JOIN recipe_title ON
  recipe_title.url_id = data_urls.id
LEFT JOIN citation_title ON
  citation_title.url_id = data_urls.id
LEFT JOIN citation_author ON
  citation_author.url_id = data_urls.id
LEFT JOIN citation_date ON
  citation_date.url_id = data_urls.id
LEFT JOIN citation_accessed_date ON
  citation_accessed_date.url_id = data_urls.id
