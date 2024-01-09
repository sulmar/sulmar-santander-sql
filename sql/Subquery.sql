-- Podzapytanie

SELECT 
    customer_id,
	customer_full_name,
	email
	FROM (				-- g³ówne zapytanie
	SELECT					-- podzapytanie
		customer_id, 
		CONCAT(first_name, ' ', last_name) AS customer_full_name  ,
		email
	FROM 
		customer
) AS customer_with_full_name
WHERE
	customer_full_name = 'LINDA WILLIAMS'


SELECT 
	r.rental_id,
	c.first_name,
	c.last_name,
	f.title,
	r.rent_duration,
	CASE
        WHEN rent_duration < 3 THEN 'Low'
        WHEN rent_duration >= 3 AND rent_duration  <= 5 THEN 'Standard'
        WHEN rent_duration > 5 THEN 'High'
    END 
		AS rent_duration_range
FROM (
	SELECT  
		rental_id,
		inventory_id,
		DATEDIFF(day, rental_date, return_date) AS rent_duration   
	FROM rental 
	
) AS r
	JOIN inventory AS i 
		ON i.inventory_id = r.inventory_id
	JOIN film AS f 
		ON f.film_id = i.film_id
	JOIN customer AS c 
		ON c.customer_id = r.rental_id

	
SELECT 
	title, 
	c.[name] AS category_name
FROM film AS f
	INNER JOIN film_category  AS fc
		ON fc.film_id = f.film_id
	INNER JOIN category AS c
		ON c.category_id = fc.category_id
WHERE
	c.[name] IN ('Documentary', 'Horror')

-- Pobierz listê wypo¿yczeñ klientów tylko z Polski
SELECT * FROM rental
	WHERE customer_id IN (
		SELECT c.customer_id FROM customer AS c
		INNER JOIN address AS a
			ON c.address_id = a.address_id
		INNER JOIN city AS ct
			ON ct.city_id = a.city_id
		INNER JOIN country AS ctr
			ON ct.country_id = ctr.country_id
		WHERE ctr.country = 'Poland')




		

		
SELECT distinct city FROM city