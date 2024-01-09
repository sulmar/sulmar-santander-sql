USE sakila

-- Z³¹czenie wewnêtrzne (inner join) 
SELECT
    film.title AS film_title,
    [language].[name] AS film_language
FROM
	film 
		INNER JOIN [language] 
			ON film.language_id = [language].language_id -- warunek z³¹czenia


-- Z³¹czenie wewnêtrzne (inner join) z zastosowaniem aliasów tabel
SELECT
	f.language_id,
    f.title AS film_title,
    l.[name] AS film_language
FROM
	film AS f
		INNER JOIN [language] AS l
			ON f.language_id = l.language_id -- warunek z³¹czenia		

-- Z³¹czenie wewnêtrzne za pomoc¹ WHERE

SELECT 
	film.language_id,
	film.title AS film_title,
	[language].name AS film_language
FROM	
	film, [language]
WHERE
	film.language_id = [language].language_id

-- Z³¹czenie wielu tabel
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


	select * from staff

-- Zadanie: Wyœwietl p³atnoœci w nastêpuj¹cy sposób:

-- payment_id | customer_full_name | stuff_full_name | payment_date | amount
-- 1		  | Mary Smith		   | Mike Hillyer	 |				|
-- 2		  | Mary Smith		   | Mike Hillyer	 |				|
-- ...		  | ...				   | ...	 		 |              |

SELECT TOP (100)
	payment_id,
	payment.customer_id,
	payment.staff_id,
	payment_date,
	amount,
	CONCAT(LEFT(customer.[first_name],1), RIGHT(LOWER(customer.[first_name]),LEN(customer.[first_name]) - 1),' ',LEFT(customer.[last_name],1), RIGHT(LOWER(customer.[last_name]),LEN(customer.[last_name]) - 1)) as [customer_full_name],
	CONCAT(staff.first_name, ' ', staff.last_name) AS staff_full_name	
FROM
	payment
	JOIN customer ON payment.customer_id = customer.customer_id
	JOIN staff on payment.staff_id = staff.staff_id

-- Zadanie: Wyœwietl klientów tylko z Polski
-- | customer_id | customer_full_name	| city	| country

SELECT
    cus.customer_id,
    CONCAT(cus.first_name, ' ', cus.last_name) AS customer_full_name,
    cit.city,
    cnt.country
FROM 
    customer AS cus
JOIN 
    [address] AS a ON a.address_id = cus.address_id
JOIN 
    city AS cit ON cit.city_id = a.city_id
JOIN 
    country AS cnt ON cit.country_id = cnt.country_id
WHERE 
    cnt.country = 'Poland';


DECLARE @country VARCHAR(40)
SET @country = 'Japan'

SELECT
    cus.customer_id,
    CONCAT(cus.first_name, ' ', cus.last_name) AS customer_full_name,
    cit.city,
    cnt.country
FROM customer AS cus
	INNER JOIN [address] AS a 
		ON a.address_id = cus.address_id
	INNER JOIN city AS cit 
		ON cit.city_id = a.city_id
	INNER JOIN country AS cnt 
		ON cit.country_id = cnt.country_id
	WHERE cnt.country = @country

-- Zadanie 3: ZnajdŸ aktorów, którzy zagrali w wybranym filmie
DECLARE @title varchar(255)
SET @title = 'ACADEMY DINOSAUR'
SELECT f.title,
	CONCAT(a.first_name, ' ', a.last_name) as actor_full_name
	FROM film_actor AS fa
		JOIN film AS f ON fa.film_id=f.film_id
		JOIN actor AS a ON fa.actor_id = a.actor_id
	WHERE f.title = @title

-- Zadanie 4: ZnadŸ filmy w których zagra³ wybrany aktor

SELECT
    f.title AS film_title
FROM 
    film AS f
JOIN 
    film_actor AS fa ON f.film_id = fa.film_id
JOIN 
    actor AS a ON a.actor_id = fa.actor_id
WHERE 
    a.first_name = 'ED' AND a.last_name = 'CHASE'
ORDER By title;

SELECT
    f.film_id,
    f.title,
	CONCAT(a.first_name, ' ', a.last_name) AS actor_full_name
FROM film AS f
INNER JOIN film_actor AS fa ON f.film_id = fa.film_id
INNER JOIN actor AS a ON a.actor_id = fa.actor_id
WHERE CONCAT(a.first_name, ' ', a.last_name) COLLATE Polish_CI_AS = 'Cameron Streep'
ORDER BY f.title

 -- Zadanie 5: Wyœwietl tytu³y filmów i iloœæ dostêpnych sztuk w poszczególnych wypo¿yczalniach
 -- | film_id | film_title | store_city | inventory_stack |

SELECT 
	f.film_id,
	f.title AS film_title, 
	c.city as store_city, 	
	count(*) as inventory_stack
FROM inventory as i	
	join film as f on i.film_id = f.film_id
	join store as s on i.store_id= s.store_id
	join address as a on s.address_id =a.address_id
	join city as c on a.city_id = c.city_id
GROUP BY  f.film_id, f.title, c.city,s.store_id


-- Zadanie 6: Oblicz ile filmów zosta³o wypo¿yczonych w poszczególnych kategoriach.
-- | category_id | category_name | rented_films_count |

select c.category_id, c.name, 
count(*) as counts
from film as f
	inner join inventory as i on f.film_id = i.film_id
	inner join rental as r on i.inventory_id = r.inventory_id
	inner join film_category as fc on f.film_id = fc.film_id
	inner join category as c on fc.category_id = c.category_id
	group by c.category_id, c.name
order by counts desc

-- Zadanie 7: ZnajdŸ film, który jest najczeœciej wypo¿yczany
select 
	top 100
	f.title,
	count(*) as counts
from film as f
	join inventory as i on f.film_id = i.film_id
	join rental as r on i.inventory_id = r.inventory_id
group by f.title
 order by counts desc


--- z³¹czenia zewnêtrzne





SELECT DISTINCT customer_id FROM rental

INSERT INTO customer (store_id, first_name, last_name, email, address_id, active)
	VALUES (1, 'JOHN', 'SMITH', 'JOHN.SMITH@sakilacustomer.org', 5, 1)

SELECT * FROM customer 
SELECT COUNT(*) FROM customer 

-- lewe z³¹czenie zewnêtrzne

-- Wyœwietl iloœæ wypo¿yczeñ dla ka¿dego klienta w³¹cznie z 0 wypo¿yczeñ
SELECT 
	customer.customer_id,
	customer.first_name,
	customer.last_name,
	COUNT(rental_id) AS rental_quantity
FROM customer 
	LEFT OUTER JOIN rental
		ON customer.customer_id = rental.customer_id
GROUP BY
	customer.customer_id,
	customer.first_name,
	customer.last_name

SELECT 
	customer.customer_id,
	customer.first_name,
	customer.last_name,
	rental.rental_id,
	rental.rental_date,
	rental.return_date
FROM customer 
	LEFT OUTER JOIN rental
		ON customer.customer_id = rental.customer_id
ORDER BY customer_id


INSERT INTO country (country)
	VALUES ('Eskobar')


SELECT * FROM city
	RIGHT OUTER JOIN country
		ON city.country_id = country.country_id

SELECT * FROM country
	LEFT OUTER JOIN city
		ON country.country_id = city.country_id	

