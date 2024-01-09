-- Wyb�r na podstawie pojedynczej warto�ci

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

-- Wyb�r na podstawie warunk�w

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

-- Zadanie: Wy�wietl czas wypo�yczenia film�w w przedzia�ach:
-- short < 3 dni
-- standard 3..5 dni
-- long > 5 dni

-- | rent_id | customer_fullname | title | rent_duration | rent_duration_range |


