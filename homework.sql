-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT first_name, last_name
FROM actor
WHERE last_name = 'Wahlberg';
-- Answer = 2


-- 2. How many payments were made between $3.99 and $5.99?
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;
-- Answer = 4794


-- 3. What film does the store have the most of? (search in inventory table)
SELECT film_id, COUNT(inventory_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT DESC;
-- Answer = Several films have a count of 8


-- 4. How many customers have the last name ‘William’?
-- (couldn't find table including William as last name, the table name would go next to from)
SELECT COUNT(last_name)
FROM customer
WHERE last_name = 'William';
-- Answer = 0


-- 5. What store employee (get the id) sold the most rentals?
SELECT COUNT(rental_id), staff_id
FROM rental
GROUP BY staff_id;
-- Answer = staff id 1 with 8040 sales


-- 6. How many different distinct names are there?
SELECT COUNT(DISTINCT name)
FROM category;
-- Answer 591


-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT DESC;
-- Answer = film id 508 with 15 actors


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT store_id, last_name
FROM customer
WHERE last_name LIKE '%es'
AND store_id = 1;
-- Answer = 13

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)\
-- This code operates fine until I add in the last line about customer id. At that point I get 0 results
SELECT amount, COUNT(payment_id) AS payment_id_count, COUNT(customer_id) AS customer_id_count
FROM payment
GROUP BY amount, customer_id
HAVING COUNT(payment_id) > 250
-- AND customer_id BETWEEN 380 AND 430;



-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
SELECT DISTINCT rating, COUNT(rating)
FROM film
GROUP BY rating;
-- Answer = 5 ratings with PG-13 having most with 223 total