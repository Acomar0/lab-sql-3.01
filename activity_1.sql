use sakila;

-- Drop column picture from staff
ALTER TABLE staff
DROP COLUMN picture;

select * from staff;

-- A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly
select * from customer where last_name= "Sanders";
INSERT INTO sakila.staff (first_name, last_name, email, store_id, address_id, username ) VALUES ("Tammy", "Sanders", "TAMMY.SANDERS@sakilacustomer.org", 2, 79, "tam");


-- Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
-- You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there.
-- You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
select film_id from sakila.film
where title = 'Academy Dinosaur';
select i.inventory_id, f.title from sakila.inventory i join film f using (film_id) 
where film_id = 1;
select * from rental order by rental_id desc;
INSERT INTO sakila.rental (rental_id, rental_date, inventory_id, customer_id, staff_id) VALUES ("16050", "2023-01-23 16:27:00", 1, 130, 1);


