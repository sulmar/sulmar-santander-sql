USE sakila

-- Z��czenie wewn�trzne (inner join) 
SELECT
    film.title AS film_title,
    [language].[name] AS film_language
FROM
	film 
		INNER JOIN [language] 
			ON film.language_id = [language].language_id -- warunek z��czenia


-- Z��czenie wewn�trzne (inner join) z zastosowaniem alias�w tabel
SELECT
	f.language_id,
    f.title AS film_title,
    l.[name] AS film_language
FROM
	film AS f
		INNER JOIN [language] AS l
			ON f.language_id = l.language_id -- warunek z��czenia		

-- Z��czenie wewn�trzne za pomoc� WHERE

SELECT 
	film.language_id,
	film.title AS film_title,
	[language].name AS film_language
FROM	
	film, [language]
WHERE
	film.language_id = [language].language_id

-- Z��czenie wielu tabel
SELECT 
	c.first_name,
	c.last_name,
	a.[address],
	ct.city,
	ctr.country
FROM customer AS c
	INNER JOIN [address] AS a 
		ON c.address_id = a.address_id
	INNER JOIN city AS ct
		ON a.city_id = ct.city_id
	INNER JOIN country AS ctr
		ON ct.country_id = ctr.country_id

