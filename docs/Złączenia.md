# Klucze
## Klucz podstawy (primary key)
## Klucz obcy (foreign key)

# Typy złączeń	
## Złączenia wewnętrzne (_inner join_)

- złączenie dwóch tabel
~~~ sql
select 
	customer.first_name,
	customer.last_name,
	[address].[address],
	customer.address_id,
	[address].city_id
 from customer
	inner join address 
		on customer.address_id = address.address_id  -- warunek złączenia
~~~

## Aliasy tabel

- złączenie dwóch tabel
~~~ sql
select 
	c.first_name,
	c.last_name,
	a.[address],
	c.address_id,
	a.city_id
 from customer as c
	inner join address as a
		on c.address_id = a.address_id  -- warunek złączenia
~~~


- złączenie wielu tabel

~~~ sql
select 
	customer.first_name,
	customer.last_name,
	[address].[address],
	city.city,
	country.country
 from customer
	inner join address 
		on customer.address_id = address.address_id  -- warunek złączenia
	inner join city
		on address.city_id = city.city_id            -- kolejny warunek złączenia
	inner join country
		on city.country_id = country.country_id      -- kolejny warunek złączenia
~~~


## Zadania 

### Zadanie 1

- Wyświetl płatności w następujący sposób:

| payment_id | customer_full_name | stuff_full_name | payment_date | amount |
| ---- | ---- | ---- | ---- | ---- |
| 1 | Mary Smith | Mike Hillyer | 2005-05-25 11:30:37.000 | 2.99 |
| 2 | Patricia Johnson | Mike Hillyer  | 2005-05-28 10:35:23.000 | 0.99 |
| 3 | Linda Williams | Jon Stephens | 2005-06-15 00:54:12.000 | 5.99 |
| ... | ... | ... | ... | ... |

### Zadanie 2

- Wyświetl klientów tylko z Polski

| customer_id | customer_full_name | city | country |
| ---- | ---- | ---- | ---- |
| 1 | Mary Smith | Bydgoszcz | Poland |
| 2 | Patricia Johnson | Czestochowa | Poland |
| 3 | Linda Williams | Jastrzebie-Zdrj | Poland |
| ... | ... | ... | ... |


### Zadanie 3

- Znajdź aktorów, którzy zagrali w wybranym filmie

### Zadanie 4
- Znadź filmy w których zagrał wybrany aktor

### Zadanie 5

- Wyświetl informacje o wypożyczonych filmach w styczniu (w dowolnym roku)

| rental_id | rental_date | customer_full_name | film_title | staff_full_name |
| ---- | ---- | ---- | ---- | ---- |
| ... | ... | ... | ... | ... |

### Zadanie 6

- Wyświetl tytuły filmów i ilość dostępnych sztuk w poszczególnych wypożyczalniach

| film_id | film_title | store_city | inventory_stack |
| ---- | ---- | ---- | ---- |
| 1 | ACADEMY DINOSAUR | Lethbridge | 3 |
| 2 | ACADEMY DINOSAUR | Woodridge | 4 |
| 3 | ADAPTATION HOLES | Lethbridge | 2 |
| 4 | ADAPTATION HOLES | Lethbridge | 1 |
| ... | ... | ... | ... |

### Zadanie 7

Oblicz ile filmów zostało wypożyczonych w poszczególnych kategoriach.

| category_id | category_name | rented_films_count |
| ---- | ---- | ---- |
| 1 |  |  |
| 2 |  |  |
| 3 |  |  |
| ... | ... | ... |

~~~ sql
SELECT
    c.category_id,
    c.name AS category_name,
    COUNT(r.rental_id) AS rented_films_count
FROM
    category c
JOIN
    film_category fc ON c.category_id = fc.category_id
JOIN
    film f ON fc.film_id = f.film_id
JOIN
    inventory i ON f.film_id = i.film_id
LEFT JOIN
    rental r ON i.inventory_id = r.inventory_id
GROUP BY
    c.category_id, c.name
ORDER BY
    rented_films_count DESC;
~~~

## Złączenie zewnętrzne (_outer join_)

### Lewe złączenie zewnętrzne (_left outer join_)


~~~ sql
select 
	rental.rental_date,
	rental.customer_id,
	customer.first_name,
	customer.last_name,
	customer.customer_id
from customer
	left outer join rental
		on rental.customer_id = customer.customer_id
~~~

### Prawe złączenie zewnętrzne (_right outer join_)

~~~ sql
select 
	rental.rental_date,
	rental.customer_id,
	customer.first_name,
	customer.last_name,
	customer.customer_id
from rental
	right outer join customer
		on rental.customer_id = customer.customer_id
~~~

### Pełne złączenie zewnętrzne (_full outer join_)
~~~ sql
select 
	rental.rental_date,
	rental.customer_id,
	customer.first_name,
	customer.last_name,
	customer.customer_id
from rental
	full outer join customer
		on rental.customer_id = customer.customer_id
~~~


## Złączenie krzyżowe (iloczyn kartezjański)

~~~ sql
SELECT
	title,
	[name]     
  FROM [dbo].[language]
  CROSS JOIN [dbo].[film]
~~~