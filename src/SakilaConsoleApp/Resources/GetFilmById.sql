-- DECLARE @film_id INT = 1

SELECT 
	film_id, 
	title, 
	[description]
FROM 
	film 
WHERE 
	film_id = @film_id
