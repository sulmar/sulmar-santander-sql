# Tabele

- Pobranie wszystkich rekordów z tabeli 
~~~ sql
SELECT * FROM customer
~~~ 

# Wybór pól z tabeli

~~~ sql
SELECT first_name, last_name, email FROM customer
~~~
 
- Nazwy pól muszą być nawiasach kwadratowych jeśli w ich nazwach występują słowa kluczowe:
~~~ sql
SELECT [name] FROM language
~~~

# Ograniczenie ilości rekordów

~~~ sql
SELECT TOP(5) first_name, last_name, email FROM customer
~~~

# Unikalność

~~~ sql
SELECT DISTINCT first_name FROM customer
~~~

# Aliasy kolumn

Umożliwiają zmianę nazwy kolumny "w locie".
~~~ sql
SELECT 
	first_name as imie, 
	last_name as nazwisko,
	email as [adres email]
FROM
	customer
~~~

# Aliasy tabel

Umożliwiają zmianę nazwy tabeli "w locie". Przydatne bardzo przy [[Złączenia]]
~~~ sql
SELECT 
	c.first_name,
	c.last_name,
	c.email
FROM
	customer AS c
~~~

