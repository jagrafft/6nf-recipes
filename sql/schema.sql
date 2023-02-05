-- SQL dump generated using DBML (dbml-lang.org)
-- Database: MySQL
-- Generated at: 2023-02-05T19:41:10.755Z
-- NB. DBML does not support SQLite, so foreign key references are modified by hand

CREATE TABLE `recipe_urls` (
  `id` INT PRIMARY KEY,
  `url` TEXT UNIQUE NOT NULL
);

CREATE TABLE `data_authors` (
  `id` INT PRIMARY KEY,
  `author` TEXT UNIQUE NOT NULL
);

CREATE TABLE `data_dates` (
  `id` INT PRIMARY KEY,
  `dte` DATE UNIQUE NOT NULL
);

CREATE TABLE `data_ingredients` (
  `id` INT PRIMARY KEY,
  `ingredient` TEXT UNIQUE NOT NULL
);

CREATE TABLE `data_default_masses` (
  `id` INT PRIMARY KEY,
  `grams` REAL UNIQUE NOT NULL
);

CREATE TABLE `data_ratios` (
  `id` INT PRIMARY KEY,
  `ratio` REAL UNIQUE NOT NULL
);

CREATE TABLE `data_titles` (
  `id` INT PRIMARY KEY,
  `title` TEXT UNIQUE NOT NULL
);

CREATE TABLE `recipe_access_dates` (
  `url_id` INT PRIMARY KEY REFERENCES `recipe_urls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  `date_id` INT NOT NULL REFERENCES `data_dates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `recipe_authors` (
  `url_id` INT PRIMARY KEY REFERENCES `recipe_urls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  `author_id` INT NOT NULL REFERENCES `data_authors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `recipe_citation_title` (
  `url_id` INT PRIMARY KEY REFERENCES `recipe_urls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  `title_id` INT NOT NULL REFERENCES `data_titles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `recipe_dates` (
  `url_id` INT PRIMARY KEY REFERENCES `recipe_urls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  `date_id` INT NOT NULL REFERENCES `data_dates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `recipe_default_masses` (
  `url_id` INT PRIMARY KEY REFERENCES `recipe_urls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  `grams_id` INT NOT NULL REFERENCES `data_default_masses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `recipe_ingredients` (
  `url_id` INT PRIMARY KEY REFERENCES `recipe_urls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  `ingredients_id` INT NOT NULL REFERENCES `data_ingredients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `recipe_ratios` (
  `url_id` INT PRIMARY KEY REFERENCES `recipe_urls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  `ingredients_id` INT NOT NULL REFERENCES `data_ingredients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  `ratio_id` INT NOT NULL REFERENCES `data_ratios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `recipe_titles` (
  `url_id` INT PRIMARY KEY REFERENCES `recipe_urls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  `title_id` INT NOT NULL REFERENCES `data_titles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE UNIQUE INDEX `recipe_access_dates_index_0` ON `recipe_access_dates` (`url_id`, `date_id`);

CREATE UNIQUE INDEX `recipe_authors_index_1` ON `recipe_authors` (`url_id`, `author_id`);

CREATE UNIQUE INDEX `recipe_citation_title_index_2` ON `recipe_citation_title` (`url_id`, `title_id`);

CREATE UNIQUE INDEX `recipe_dates_index_3` ON `recipe_dates` (`url_id`, `date_id`);

CREATE UNIQUE INDEX `recipe_default_masses_index_4` ON `recipe_default_masses` (`url_id`, `grams_id`);

CREATE UNIQUE INDEX `recipe_ingredients_index_5` ON `recipe_ingredients` (`url_id`, `ingredients_id`);

CREATE UNIQUE INDEX `recipe_ratios_index_6` ON `recipe_ratios` (`url_id`, `ingredients_id`, `ratio_id`);

CREATE UNIQUE INDEX `recipe_titles_index_7` ON `recipe_titles` (`url_id`, `title_id`);
