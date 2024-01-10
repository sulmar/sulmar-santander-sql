SELECT 
	rating,
	COUNT(*) AS rating_count
FROM 
	film 
GROUP BY
	rating