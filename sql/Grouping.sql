use sakila


-- Grupowanie

SELECT 
	rating,
	COUNT(*) AS rating_count
FROM 
	film 
GROUP BY
	rating


SELECT 
	staff_id, 
	SUM(amount) AS total_amount,
	COUNT(*) AS payment_count
FROM 
	payment
GROUP BY 
	staff_id

-- Grupowanie po jednym polu
SELECT
	YEAR(payment_date) as [payment_year],
	SUM(amount) AS total_amount
FROM
	payment
GROUP BY 
	YEAR(payment_date)

-- Grupowanie po kilku polach
SELECT
	YEAR(payment_date) as [payment_year],
	MONTH(payment_date) as [payment_month],
	SUM(amount) AS total_amount
FROM
	payment
GROUP BY 
	YEAR(payment_date), MONTH(payment_date) 
ORDER BY
	payment_year, payment_month

-- Zadanie
-- Wy�wietl zestawienie, kt�re zaprezentuje 3 dni tygodnia, w kt�rych najcz�ciej wypo�yczane s� filmy:

-- rental_weekname,quanitity
-- wtorek,2463
-- niedziela,2320
-- sobota,2311