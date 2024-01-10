
 
## Liczność

- liczność rekordów
~~~ sql
select count(*) from customer where active = 1
~~~

- liczność wartości w kolumnie

~~~ sql
SELECT COUNT([postal_code])
  FROM [sakila].[dbo].[address]
  WHERE postal_code IS NOT NULL
  ~~~

## Suma 
~~~ sql
select sum(amount) as total from payment
~~~

## Minimum
~~~ sql
select min(amount) as min_amount from payment
~~~

## Maximum
~~~ sql
select max(amount) as max_amount from payment
~~~

## Średnia
~~~ sql
select avg(amount) from payment
~~~

# Funkcja ISNULL

Uwaga: funkcje agregujące pomijają wartości _null_, dlatego należy stosować funkcję _ISNULL_

~~~ sql
select AVG(ISNULL(amount,0)) from payment
~~~
