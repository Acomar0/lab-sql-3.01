CREATE TABLE `actor` (
  `actor_id` smallint PRIMARY KEY,
  `first_name` varchar(45),
  `last_name` varchar(45),
  `last_update` timestamp
);

CREATE TABLE `country` (
  `country_id` smallint PRIMARY KEY,
  `country` varchar(50),
  `last_update` timestamp
);

CREATE TABLE `film_category` (
  `film_id` smallint PRIMARY KEY,
  `category_id` tinyint,
  `last_update` timestamp
);

CREATE TABLE `category` (
  `category_id` tinyint PRIMARY KEY,
  `name` varchar(25),
  `last_update` timestamp
);

CREATE TABLE `film_text` (
  `film_id` smallint PRIMARY KEY,
  `title` varchar(255),
  `description` text
);

CREATE TABLE `film_actor` (
  `film_id` smallint,
  `actor_id` smallint,
  `last_update` timestamp,
  PRIMARY KEY (`film_id`, `actor_id`)
);

CREATE TABLE `language` (
  `language_id` pk,
  `name` varchar(20),
  `last_update` timestamp
);

CREATE TABLE `film` (
  `film_id` smallint PRIMARY KEY,
  `title` varchar(128),
  `description` text,
  `release_year` year,
  `language_id` pk,
  `original_language_id` tinyint,
  `rental_duration` tinyint,
  `rental_rate` decimal(4,2),
  `length` smallint,
  `replacement_cost` decimal(5,2),
  `rating` film_rating_enum,
  `last_update` timestamp
);

CREATE TABLE `address` (
  `address_id` smallint PRIMARY KEY,
  `address` varchar(50),
  `address2` varchar(50),
  `district` varchar(50),
  `city_id` smallint,
  `postal_code` varchar(10),
  `phone` varchar(20),
  `last_update` timestamp
);

CREATE TABLE `inventory` (
  `inventory_id` mediumint PRIMARY KEY,
  `film_id` smallint,
  `store_id` tinyint,
  `last_update` timestamp
);

CREATE TABLE `city` (
  `city_id` smallint PRIMARY KEY,
  `city` varchar(50),
  `country_id` smallint,
  `last_update` timestamp
);

CREATE TABLE `store` (
  `store_id` tinyint PRIMARY KEY,
  `manager_staff_id` tinyint,
  `address_id` smallint,
  `last_update` timestamp
);

CREATE TABLE `rental` (
  `rental_id` int PRIMARY KEY,
  `rental_date` duration,
  `inventory_id` mediumint,
  `customer_id` smallint,
  `return_date` datetime,
  `staff_id` tinyint,
  `last_update` timestamp
);

CREATE TABLE `payment` (
  `payment_id` smallint PRIMARY KEY,
  `rental_id` int,
  `staff_id` tinyint,
  `customer_id` smallint,
  `amount` decimal(5,2),
  `payment_date` datetime,
  `last_update` timestamp
);

CREATE TABLE `staff` (
  `staff_id` tinyint PRIMARY KEY,
  `first_name` varchar(45),
  `last_name` varchar(45),
  `address_id` smallint,
  `picture` blob,
  `email` varchar(50),
  `store_id` tinyint,
  `active` boolean,
  `username` varchar(16),
  `password` varchar(40),
  `last_update` timestamp
);

CREATE TABLE `customer` (
  `customer_id` smallint PRIMARY KEY,
  `store_id` timestamp,
  `first_name` varchar(45),
  `last_name` varchar(45),
  `email` datetime,
  `address_id` smallint,
  `active` boolean,
  `create_date` datetime,
  `last_update` timestamp
);

ALTER TABLE `category` ADD FOREIGN KEY (`category_id`) REFERENCES `film_category` (`category_id`);

ALTER TABLE `film_text` ADD FOREIGN KEY (`film_id`) REFERENCES `film_actor` (`film_id`);

ALTER TABLE `film` ADD FOREIGN KEY (`language_id`) REFERENCES `film_actor` (`film_id`);

ALTER TABLE `film_category` ADD FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`);

ALTER TABLE `language` ADD FOREIGN KEY (`language_id`) REFERENCES `film` (`language_id`);

ALTER TABLE `actor` ADD FOREIGN KEY (`actor_id`) REFERENCES `film_actor` (`actor_id`);

ALTER TABLE `inventory` ADD FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`);

ALTER TABLE `address` ADD FOREIGN KEY (`address_id`) REFERENCES `store` (`address_id`);

ALTER TABLE `payment` ADD FOREIGN KEY (`rental_id`) REFERENCES `rental` (`rental_id`);

ALTER TABLE `payment` ADD FOREIGN KEY (`customer_id`) REFERENCES `rental` (`customer_id`);

ALTER TABLE `payment` ADD FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`);

ALTER TABLE `rental` ADD FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`);

ALTER TABLE `store` ADD FOREIGN KEY (`store_id`) REFERENCES `staff` (`store_id`);

ALTER TABLE `rental` ADD FOREIGN KEY (`last_update`) REFERENCES `city` (`last_update`);

ALTER TABLE `film` ADD FOREIGN KEY (`last_update`) REFERENCES `address` (`last_update`);

ALTER TABLE `customer` ADD FOREIGN KEY (`customer_id`) REFERENCES `rental` (`customer_id`);

ALTER TABLE `store` ADD FOREIGN KEY (`store_id`) REFERENCES `customer` (`store_id`);

ALTER TABLE `address` ADD FOREIGN KEY (`address_id`) REFERENCES `customer` (`address_id`);
