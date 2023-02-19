CREATE VIEW ingredient_list AS
SELECT
  data_urls.id,
  data_ingredients.ingredient,
  data_ratios.ratio
FROM
  data_urls
LEFT JOIN recipe_bakers_percentages ON
  recipe_bakers_percentages.url_id = data_urls.id
LEFT JOIN data_ingredients ON
  recipe_bakers_percentages.ingredient_id = data_ingredients.id
LEFT JOIN data_ratios ON
  recipe_bakers_percentages.ratio_id = data_ratios.id
