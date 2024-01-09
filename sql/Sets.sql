
-- Suma zbiorów 
SELECT first_name, last_name FROM actor
UNION -- (zwraca tylko unikalne rekordy)
SELECT first_name, last_name FROM customer

SELECT first_name, last_name FROM actor
UNION ALL -- (zwraca wszystkie rekordy, w tym równie¿ duplikaty)
SELECT first_name, last_name FROM customer

-- Iloczyn zbiorów (czeœæ wspólna)
SELECT first_name, last_name FROM actor
INTERSECT
SELECT first_name, last_name FROM customer

-- Ró¿nica zbiorów
SELECT first_name, last_name FROM actor
EXCEPT
SELECT first_name, last_name FROM customer

SELECT first_name, last_name FROM customer
EXCEPT
SELECT first_name, last_name FROM actor

-- Zadanie
-- Wyœwietl tytu³y filmów, które znajduj¹ siê obu wypo¿yczalniach (store). 
-- Ile jest takich filmów?

-- | title |

SELECT [title] FROM
(SELECT 
	f.[title], 
	i.[store_id]  AS [store] 
	FROM [dbo].[inventory] i
		JOIN [dbo].[film] f ON f.[film_id] = i.[film_id]
	WHERE i.[store_id] = 1
UNION 
SELECT 
	f.[title], 
	i.[store_id] AS [store] 
	FROM [dbo].[inventory] i
		JOIN [dbo].[film] f ON f.[film_id] = i.[film_id]
	WHERE i.[store_id] = 2) AS [films]
GROUP BY [title]
HAVING COUNT([title]) > 1

SELECT 
	f.[title]	
	FROM [dbo].[inventory] i
		JOIN [dbo].[film] f ON f.[film_id] = i.[film_id]
	WHERE i.[store_id] = 1
INTERSECT 
SELECT 
	f.[title]
	FROM [dbo].[inventory] i
		JOIN [dbo].[film] f ON f.[film_id] = i.[film_id]
	WHERE i.[store_id] = 2
	

-- zbiór A store id 1
SELECT 
	i.film_id,
	title
FROM
	inventory as i
		INNER JOIN film as f
			ON i.film_id = f.film_id
WHERE
	i.store_id = 1
INTERSECT
-- zbiór B store id 2
SELECT 
	i.film_id,
	title
FROM
	inventory as i
		INNER JOIN film as f
			ON i.film_id = f.film_id
WHERE
	i.store_id = 2

-- Zadanie: znajdŸ filmy, które nie by³y wypo¿yczone
-- | film_id | title

SELECT
    f.film_id,
    f.title AS film_title
FROM 
    film AS f
LEFT JOIN 
    inventory AS i ON f.film_id = i.film_id
LEFT JOIN 
    rental AS r ON i.inventory_id = r.inventory_id
WHERE 
    r.rental_id IS NULL;

SELECT 
	film_id,
	title
FROM 
	film
EXCEPT
SELECT
	i.film_id,
	f.title
FROM rental AS r
	INNER JOIN inventory AS i
		ON r.inventory_id = i.inventory_id
	INNER JOIN film AS f
		ON i.film_id = f.film_id


-- znajdŸ filmy, które nie s¹ dopisane do inventory

SELECT 
	film_id
FROM film
EXCEPT
SELECT 
	film_id
FROM inventory

-- rezultat: zbiór pusty
SELECT 
	film_id
FROM inventory
EXCEPT
SELECT 
	film_id
FROM film 



SELECT first_name, last_name, 'customer' AS [person_type], email FROM customer
UNION ALL
SELECT first_name, last_name, 'staff', email FROM staff
UNION ALL
SELECT first_name, last_name, 'actor', NULL FROM actor


