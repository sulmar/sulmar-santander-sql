use sakila

-- Aliasy kolumn
SELECT 
	title AS [name], 
	rental_duration AS [rental duration], 
	rental_rate, 
	rental_duration * rental_rate AS rental_cost
FROM 
	film
WHERE 
	rental_duration * rental_rate > 10
ORDER BY rental_cost

-- Zastosowanie podzapytania w celu unikniêcia duplikowania logiki biznesowej
SELECT * FROM 
(
	SELECT title AS [name], 
		rental_duration AS duration, 
		rental_rate, 
		rental_duration * rental_rate AS rental_cost
	FROM 
		film
) AS film_with_rental_duration -- alias tabeli
WHERE
	film_with_rental_duration.rental_cost > 10
ORDER BY rental_cost



/*
 1. FROM
 2. WHERE
 3. GROUP BY
 4. HAVING 
 5. SELECT
 6. ORDER BY
*/

-- Alias tabeli
SELECT 
	f.title,
	f.[description],
	f.release_year
FROM 
	film as f


-- U¿ycie sta³ej
SELECT 
	amount,  
	amount * 0.23 as [tax]	
FROM 
	payment

-- Operacje tekstowe
SELECT 
	first_name + ' ' + last_name AS full_name 
FROM 
	customer

-- Funkcje tekstowe
SELECT 
	first_name,
	LOWER(first_name) AS normalized_first_name,
	email,
	UPPER(email) AS normalized_email,
	LEFT(first_name, 3) AS prefix_first_name,
	RIGHT(last_name, 3) AS suffix_last_name,
	SUBSTRING(first_name, 3, 2) AS fragment_first_name,
	CHARINDEX('.', email) AS email_dot_index,
	LEN(email) as email_length,
	CONCAT(first_name, ' ', last_name) AS full_name
FROM 
	customer

-- Rozwi¹zanie zadania
SELECT
    CONCAT(LEFT([first_name],1), RIGHT(LOWER([first_name]), LEN([first_name]) - 1)) as [capitalized_first_name], 
    CONCAT(LEFT([last_name],1), RIGHT(LOWER([last_name]), LEN([last_name]) - 1)) as [capitalized_last_name],
    LOWER([email]) as [email_normalized],
    SUBSTRING([email], (CHARINDEX('@', [email]) + 1), LEN([email])) AS [domain]
FROM 
	customer	

