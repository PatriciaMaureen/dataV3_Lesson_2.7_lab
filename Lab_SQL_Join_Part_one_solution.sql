USE sakila;
-- 1. 
SELECT c.name AS category_name , COUNT(*) AS num_films
FROM sakila.category c
JOIN sakila.film_category f
ON c.category_id = f.category_id
GROUP BY category_name
ORDER BY num_films DESC;

-- 2. 
SELECT concat(s.first_name, ' ', s.last_name) AS staff_name , SUM(p.amount) AS amount_rung_up
FROM sakila.staff s
JOIN sakila.payment p
ON s.staff_id = p.staff_id
WHERE p.payment_date between '20050801' and '20050831'
GROUP BY staff_name
ORDER BY amount_rung_up DESC;

-- 3.
SELECT concat(a.first_name, ' ', a.last_name) AS actor_name , COUNT(fa.film_id) AS appearance
FROM sakila.actor a
JOIN sakila.film_actor fa
ON a.actor_id = fa.actor_id
GROUP BY actor_name
ORDER BY appearance DESC
LIMIT 1;

-- 4.
SELECT concat(c.first_name, ' ', c.last_name) AS customer_name , COUNT(*) AS num_rentals
FROM sakila.customer c
JOIN sakila.rental r
ON c.customer_id = r.customer_id
GROUP BY customer_name
ORDER BY num_rentals DESC
LIMIT 1;

-- 5. 
SELECT concat(s.first_name, ' ', s.last_name) AS staff_name , a.address
FROM sakila.staff s
JOIN sakila.address a
ON s.address_id = a.address_id;

-- 6. 
SELECT f.title, COUNT(fa.actor_id) AS num_actors
FROM sakila.film f
JOIN sakila.film_actor fa
ON f.film_id = fa.film_id
GROUP BY f.title
ORDER BY num_actors DESC;

-- 7.
SELECT concat(c.first_name,' ', c.last_name) AS customer_name, SUM(p.amount) AS total_paid
FROM sakila.customer c
JOIN sakila.payment p
ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY c.last_name ASC;

-- 8.
SELECT fc.category_id, f.title
FROM sakila.film_category fc
JOIN sakila.film f
ON f.film_id = fc.film_id;
