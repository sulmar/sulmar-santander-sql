-- Oblicz w ilu filmach zagra³ aktor
-- Poka¿ tylko tych aktorów, którzy zagrali w wiêcej ni¿ 40 filmach


SELECT 
	a.actor_id,
	a.first_name,
	a.last_name,
	COUNT(fa.film_id) AS film_count
FROM actor AS a
	INNER JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id
GROUP BY
	a.actor_id,a.first_name, a.last_name
HAVING
	COUNT(fa.film_id) > 40
ORDER BY film_count DESC






