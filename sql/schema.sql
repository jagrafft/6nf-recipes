-- SQL dump generated using DBML (dbml-lang.org)
-- Database: MySQL
-- Generated at: 2023-02-12T07:17:07.017Z
-- NB. - DBML does not support SQLite, so foreign key references and other details are modified by hand
--     - Best to avoid `AUTOINCREMENT` when necessary (https://www.sqlite.org/autoinc.html), so keys will be assigned by Python script

CREATE TABLE `data_authors` (
  `id` INTEGER PRIMARY KEY,
  `author` TEXT UNIQUE NOT NULL
);

CREATE TABLE `data_dates` (
  `id` INTEGER PRIMARY KEY,
  `dte` TEXT UNIQUE NOT NULL
);

CREATE TABLE `data_ingredients` (
  `id` INTEGER PRIMARY KEY,
  `ingredient` TEXT UNIQUE NOT NULL
);

CREATE TABLE `data_default_masses` (
  `id` INTEGER PRIMARY KEY,
  `grams` REAL UNIQUE NOT NULL
);

CREATE TABLE `data_ratios` (
  `id` INTEGER PRIMARY KEY,
  `ratio` REAL UNIQUE NOT NULL
);

CREATE TABLE `data_titles` (
  `id` INTEGER PRIMARY KEY,
  `title` TEXT UNIQUE NOT NULL
);

CREATE TABLE `data_urls` (
  `id` INTEGER PRIMARY KEY,
  `url` TEXT UNIQUE NOT NULL
);

CREATE TABLE `recipe_access_dates` (
  `url_id` INTEGER PRIMARY KEY REFERENCES `data_urls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  `date_id` INTEGER NOT NULL REFERENCES `data_dates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `recipe_authors` (
  `url_id` INTEGER PRIMARY KEY REFERENCES `data_urls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  `author_id` INTEGER NOT NULL REFERENCES `data_authors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `recipe_citation_titles` (
  `url_id` INTEGER PRIMARY KEY REFERENCES `data_urls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  `title_id` INTEGER NOT NULL REFERENCES `data_titles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `recipe_dates` (
  `url_id` INTEGER PRIMARY KEY REFERENCES `data_urls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  `date_id` INTEGER NOT NULL REFERENCES `data_dates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `recipe_default_masses` (
  `url_id` INTEGER PRIMARY KEY REFERENCES `data_urls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  `grams_id` INTEGER NOT NULL REFERENCES `data_default_masses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `recipe_ingredients` (
  `url_id` INTEGER PRIMARY KEY REFERENCES `data_urls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  `ingredients_id` INTEGER NOT NULL REFERENCES `data_ingredients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `recipe_ratios` (
  `url_id` INTEGER PRIMARY KEY REFERENCES `data_urls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  `ingredients_id` INTEGER NOT NULL REFERENCES `data_ingredients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  `ratio_id` INTEGER NOT NULL REFERENCES `data_ratios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `recipe_titles` (
  `url_id` INTEGER PRIMARY KEY REFERENCES `data_urls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  `title_id` INTEGER NOT NULL REFERENCES `data_titles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE UNIQUE INDEX "recipe_access_dates_0" ON "recipe_access_dates" ("url_id", "date_id");

CREATE UNIQUE INDEX "recipe_authors_0" ON "recipe_authors" ("url_id", "author_id");

CREATE UNIQUE INDEX "recipe_citation_titles_0" ON "recipe_citation_titles" ("url_id", "title_id");

CREATE UNIQUE INDEX "recipe_dates_0" ON "recipe_dates" ("url_id", "date_id");

CREATE UNIQUE INDEX "recipe_default_masses_0" ON "recipe_default_masses" ("url_id", "grams_id");

CREATE UNIQUE INDEX "recipe_ingredients_0" ON "recipe_ingredients" ("url_id", "ingredients_id");

CREATE UNIQUE INDEX "recipe_ratios_0" ON "recipe_ratios" ("url_id", "ingredients_id", "ratio_id");

CREATE UNIQUE INDEX "recipe_titles_0" ON "recipe_titles" ("url_id", "title_id");
