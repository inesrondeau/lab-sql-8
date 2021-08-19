USE sakila;
-- 1
SELECT sakila.s.store_id, sakila.ci.city, sakila.co.country
FROM sakila.address a
JOIN sakila.store s
USING (address_id)
JOIN sakila.city ci
USING (city_id)
JOIN sakila.country co
USING (country_id)
GROUP BY sakila.s.store_id;
-- 2 
SELECT store_id, COUNT(sakila.p.amount) as 'dollars'
FROM sakila.store s
JOIN sakila.customer c
USING(store_id)
JOIN sakila.payment p
USING (customer_id)
GROUP BY sakila.s.store_id
ORDER BY  COUNT(sakila.p.amount) DESC;
-- 3
SELECT sakila.c.name, sakila.f.length
FROM sakila.film f
JOIN sakila.film_category fc
USING (film_id)
JOIN sakila.category c
USING (category_id)
GROUP BY sakila.c.category_id 
ORDER BY sakila.f.length DESC
LIMIT 5;
-- 4
SELECT sakila.f.title
FROM sakila.film f
JOIN sakila.inventory i
USING (film_id)
JOIN sakila.rental r
USING (inventory_id)
GROUP BY sakila.f.title
ORDER BY COUNT(rental_id);
-- 5
SELECT sakila.c.name, SUM(sakila.p.amount) as 'gross revenue'
FROM sakila.category c
JOIN sakila.film_category fc
USING (category_id)
JOIN sakila.inventory i
USING (film_id)
JOIN sakila.rental r
USING (inventory_id)
JOIN sakila.payment p 
USING (rental_id)
GROUP BY sakila.c.name
ORDER BY SUM(sakila.p.amount) DESC
LIMIT 5;
-- 6
SELECT sakila.i.store_id
FROM sakila.film f
JOIN sakila.inventory i
USING (film_id)
WHERE sakila.f.title = 'Academy Dinosaur';
-- YES
-- 7
SELECT sakila.fa.film_id,sakila.a.first_name, sakila.a.last_name
FROM sakila.actor a
RIGHT JOIN sakila.film_actor fa
USING (actor_id);
-- 8 NOT SURE, WILL ASK TOMORROW AND COME BACK TO IT, SAME AS NUMBER 9
SELECT sakila.r.rental_id, sakila.i.film_id, sakila.c.first_name, sakila.c.last_name
FROM sakila.customer c
RIGHT JOIN sakila.rental r 
USING (customer_id)
RIGHT JOIN sakila.inventory i 
USING (inventory_id)
having count(c.customer_id=film_id)>3;


GROUP BY sakila.i.film_id;
