-- CTE (Common Table Expression)

WITH cte_rental AS (

	SELECT c.customer_id FROM customer AS c
	INNER JOIN address AS a
		ON c.address_id = a.address_id
	INNER JOIN city AS ct
		ON ct.city_id = a.city_id
	INNER JOIN country AS ctr
		ON ct.country_id = ctr.country_id
	WHERE ctr.country = 'Poland'
)

SELECT 
		rental_id,
		DATEDIFF(day, rental_date, return_date) AS rental_duration
	FROM rental
		WHERE customer_id IN (SELECT customer_id FROM cte_rental)



-- Przyk³ad wielu powi¹zanych zapytañ CTE
WITH 
cte_store_1 AS (SELECT 
	f.[title], 
	i.[store_id]  AS [store] 
	FROM [dbo].[inventory] i
		JOIN [dbo].[film] f ON f.[film_id] = i.[film_id]
	WHERE i.[store_id] = 1
),

cte_store_2 AS (SELECT 
	f.[title], 
	i.[store_id]  AS [store] 
	FROM [dbo].[inventory] i
		JOIN [dbo].[film] f ON f.[film_id] = i.[film_id]
	WHERE i.[store_id] = 2
),

cte_store_1_2 AS (
	SELECT [title],[store]  FROM cte_store_1
	UNION 
	SELECT [title], [store] FROM cte_store_2
)

SELECT title, count(store) as [count]
FROM cte_store_1_2
GROUP BY title
HAVING count(store) > 1

