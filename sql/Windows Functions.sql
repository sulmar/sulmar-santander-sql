use Sakila

-- Funkcja rakingowa
SELECT 
	ROW_NUMBER() OVER (ORDER BY last_name) AS ranking,
	first_name,
	last_name
FROM actor WHERE first_name LIKE 'L%'

SELECT 
	ROW_NUMBER() OVER(ORDER BY [length] DESC) AS ranking,
	title,
	[description],
	[length]
FROM film


SELECT * FROM 
(SELECT
	ROW_NUMBER() OVER(PARTITION BY country ORDER BY city) AS ranking,
	city,
	country
FROM 
	city
INNER JOIN country 
	ON city.country_id = country.country_id) AS r
WHERE
r.ranking = 1

SELECT 
	RANK() OVER(ORDER BY [length] DESC) AS ranking,
	title,
	[description],
	[length]
FROM film

SELECT 
	RANK() OVER(PARTITION BY rating ORDER BY [length] DESC) AS ranking,
	title,
	[description],
	rating,
	[length]
FROM film

-- Funkcja agreguj¹ca skumulowana
SELECT 
	payment_date,
	amount,
	SUM(amount) OVER (ORDER BY payment_date) AS RunningTotalAmount
FROM payment

SELECT 
	payment_date,
	staff_id,
	amount,
	SUM(amount) OVER ( PARTITION BY staff_id ORDER BY payment_date) AS RunningTotalAmount
FROM payment

-- Poprzednik / Nastêpnik
-- LAG / LEAD
SELECT 
	payment_date,
	staff_id,
	amount,
	-- SUM(amount) OVER ( ORDER BY payment_date) AS RunningTotalAmount,
	LAG(amount) OVER (ORDER BY payment_date) AS PrevAmount, 
	LEAD(amount) OVER (ORDER BY payment_date) AS NextAmount,
	amount - LAG(amount) OVER (ORDER BY payment_date) AS Diff
FROM payment
