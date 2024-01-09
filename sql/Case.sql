-- Wybór na podstawie pojedynczej wartoœci

SELECT 
	title, 
	rating,
	CASE rating
		WHEN 'NC-17' THEN 'od 17 lat'
		WHEN 'PG'	 THEN 'BO z rodzicami'
		WHEN 'PG-13' THEN 'od 13 lat'
		WHEN 'G'	 THEN 'BO'
		WHEN 'R'	 THEN 'od 18 lat'
	END AS [rating_pl]
FROM 
	film

SELECT 
	title, 
	rating,
	rating_pl = CASE rating
		WHEN 'NC-17' THEN 'od 17 lat'
		WHEN 'PG'	 THEN 'BO z rodzicami'
		WHEN 'PG-13' THEN 'od 13 lat'
		WHEN 'G'	 THEN 'BO'
		WHEN 'R'	 THEN 'od 18 lat'
	END
FROM 
	film

-- Wybór na podstawie warunków

SELECT
	title,
	replacement_cost,
	CASE 
		WHEN replacement_cost < 10 THEN 'Low'
		WHEN replacement_cost >= 10 AND replacement_cost < 20 THEN 'Low'
		WHEN replacement_cost >= 20 THEN 'High'
	END AS 'Range'
FROM
	film

-- Zadanie: Wyœwietl czas wypo¿yczenia filmów w przedzia³ach:
-- short < 3 dni
-- standard 3..5 dni
-- long > 5 dni

-- | rent_id | film_title | customer_fullname | rent_duration (days) | rent_duration_range |

SELECT 
	r.[rental_id],
	f.[title],
	CONCAT(LEFT(c.[first_name],1), RIGHT(LOWER(c.[first_name]),LEN(c.[first_name]) - 1),' ',LEFT(c.[last_name],1), RIGHT(LOWER(c.[last_name]),LEN(c.[last_name]) - 1)) as [customer_fullname],
	DATEDIFF (day, [rental_date], [return_date]) as [rent_duration],
	CASE
		WHEN DATEDIFF (day, [rental_date], [return_date]) < 3 THEN 'short'
		WHEN DATEDIFF (day, [rental_date], [return_date]) >= 3 AND DATEDIFF (day, [rental_date], [return_date]) <= 5 THEN 'standard'
		WHEN DATEDIFF (day, [rental_date], [return_date]) > 5 THEN 'long'
	END AS [rent_duration_range]
FROM [dbo].[rental] r
	JOIN [dbo].[customer] c 
		ON c.[customer_id] = r.[customer_id]
	JOIN [inventory] i 
		ON i.inventory_id = r.inventory_id
	JOIN [film] f 
		ON i.film_id = f.film_id


SELECT
    r.rental_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_full_name,
    f.title,
    DATEDIFF(day, r.rental_date, r.return_date) AS rent_duration,
    CASE
        WHEN DATEDIFF(day, r.rental_date, r.return_date) < 3 THEN 'Low'
        WHEN DATEDIFF(day, r.rental_date, r.return_date) >= 3 OR DATEDIFF(day, r.rental_date, r.return_date) <= 5 THEN 'Standard'
        WHEN DATEDIFF(day, r.rental_date, r.return_date) > 5 THEN 'High'
        END AS rent_duration_range
FROM rental AS r
	JOIN inventory AS i 
		ON i.inventory_id = r.inventory_id
	JOIN film AS f 
		ON f.film_id = i.film_id
	JOIN customer AS c 
		ON c.customer_id = r.rental_id





