Rekordy możemy filtrować za pomocą klauzuli _WHERE_ podając warunek logiczny

# Operatory porównania

## Porównanie
~~~ sql
SELECT 
	title, 
	[description], 
	rating 
FROM
	film 
WHERE
	rating = 'PG'
~~~

~~~ sql
SELECT 
	first_name, 
	last_name, 
	email,
	active
from 
	customer
WHERE 
   active = 0
~~~

## Większe/mniejsze
~~~ sql
SELECT [payment_id]
      ,[customer_id]
      ,[staff_id]
      ,[rental_id]
      ,[amount]
      ,[payment_date]
      ,[last_update]
  FROM [sakila].[dbo].[payment]
  WHERE amount > 10
~~~

### Operator pomiędzy
- Zamiast 
~~~ sql
SELECT [payment_id]
      ,[customer_id]
      ,[staff_id]
      ,[rental_id]
      ,[amount]
      ,[payment_date]
      ,[last_update]
  FROM [sakila].[dbo].[payment]
  WHERE amount >= 3 AND amount <= 5
~~~

można użyć operatora BETWEEN
~~~ sql
SELECT [payment_id]
      ,[customer_id]
      ,[staff_id]
      ,[rental_id]
      ,[amount]
      ,[payment_date]
      ,[last_update]
  FROM [sakila].[dbo].[payment]
  WHERE amount BETWEEN 3 AND 5
~~~

~~~ sql
SELECT [payment_id]
      ,[customer_id]
      ,[staff_id]
      ,[rental_id]
      ,[amount]
      ,[payment_date]
      ,[last_update]
  FROM [sakila].[dbo].[payment]
  WHERE amount BETWEEN 3 AND 5
~~~

## Operator LIKE

~~~ sql
SELECT
	first_name, 
	last_name, 
	email,
	active
FROM
	customer
WHERE
	first_name LIKE 'A%'
~~~


# Operatory logiczne

## Operator AND (koniunkcja)
- obydwa warunki muszą być spełnione
~~~ sql
SELECT 
	first_name as imie, 
	last_name as nazwisko, 
	email,
	active
FROM
	customer
WHERE 
	first_name = 'mary' AND last_name = 'smith'
~~~

## Operator OR (alternatywa)
- przynajmniej jeden z warunków musi być spełniony

~~~ sql
SELECT 
	first_name as imie, 
	last_name as nazwisko, 
	email,
	active
FROM
	customer
WHERE 
	first_name = 'mary' OR first_name = 'john'
~~~

# Operator IN
- zbiór wartości
~~~ sql
select 
	first_name, 
	last_name, 
	email,
	active
from 
	customer
where
	first_name in ('mary', 'john', 'adam')
~~~

- jest to odpowiednik takiego zapisu:
~~~ sql
select 
	first_name, 
	last_name, 
	email,
	active
from 
	customer
where
	first_name = 'mary' OR first_name = 'john' OR first_name = 'adam'
~~~


# Operator IS NULL
~~~ sql
SELECT [address]       
      ,[postal_code]     
  FROM [sakila].[dbo].[address]
  WHERE postal_code IS NULL
~~~

# Porównywanie tekstów


- Wyświetlenie domyślnego porównywania dla wybranej bazy danych

~~~ sql
SELECT DATABASEPROPERTYEX(DB_NAME(), 'Collation') AS DefaultCollation;
~~~

- Filtrowanie z ustawieniem sposobu porównywania
~~~ sql
select actor_id, first_name, last_name 
from actor
where
 first_name COLLATE Polish_CI_AS = 'Penelope'; 
~~~


~~~ sql
 SELECT * FROM sys.fn_helpcollations()
 WHERE NAME like 'Polish%'
 ~~~
