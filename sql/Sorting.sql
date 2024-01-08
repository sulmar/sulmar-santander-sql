USE sakila

-- Sortowanie narastaj¹co
SELECT film_id, title, rental_duration FROM film ORDER BY rental_duration ASC

-- Sortowanie malej¹co
SELECT film_id, title, rental_duration FROM film ORDER BY rental_duration DESC

-- Sortowanie po kilku kolumnach
SELECT first_name, last_name FROM actor ORDER BY first_name, last_name 


-- top 10
SELECT TOP(10) * FROM payment ORDER BY payment_date DESC

-- bottom 10
SELECT TOP(10) * FROM payment ORDER BY payment_date ASC

SELECT * FROM payment ORDER BY amount DESC


