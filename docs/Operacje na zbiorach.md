
## Suma zbiorów

- **UNION** zwraca tylko unikalne rekordy

~~~ sql
SELECT first_name, last_name FROM actor
UNION
SELECT first_name, last_name FROM customer;
~~~

- **UNION ALL** zwraca wszystkie rekordy zawierające również duplikaty

~~~ sql
SELECT first_name, last_name FROM actor
UNION ALL
SELECT first_name, last_name FROM customer;
~~~

## Różnica zbiorów

~~~ sql
SELECT first_name, last_name FROM actor
EXCEPT
SELECT first_name, last_name FROM customer
~~~

## Część wspólna zbiorów

~~~ sql
SELECT first_name, last_name FROM actor
INTERSECT
SELECT first_name, last_name FROM customer
~~~

## Zadania

### Zadanie 1
- Wyświetl tytuły filmów, które znajdują się obu wypożyczalniach (store). Ile jest takich filmów?
### Rozwiązanie

~~~ sql
select title from inventory  as i
	inner join film  as f
		on i.film_id = f.film_id
	where store_id = 2
intersect
select title from inventory  as i
	inner join film  as f
		on i.film_id = f.film_id
	where store_id = 1
~~~

### Zadanie 3

- Znajdź filmy, które nie były wypożyczone
~~~ sql
SELECT film_id, title
FROM film
EXCEPT
SELECT f.film_id, f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id;
~~~

### Zadanie 2
- Wyświetl tytuły filmów, które znajdują się tylko w drugiej wypożyczalni (store). Ile jest takich filmów?
#### Rozwiązanie

~~~ sql
select title from inventory  as i
	inner join film  as f
		on i.film_id = f.film_id
	where store_id = 2
except
select title from inventory  as i
	inner join film  as f
		on i.film_id = f.film_id
	where store_id = 1
~~~
