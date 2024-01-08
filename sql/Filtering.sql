USE Sakila

-- Filtrowanie rekordów na podstawie porównania
-- SELECT * FROM tabela WHERE predykat

-- Filtrowanie na podst. pola numerycznego
SELECT * FROM film WHERE release_year = 2006

-- Filtrowanie na podst. pola tekstowego
SELECT * FROM film WHERE rating = 'PG' 

-- Filtrowanie na podstawie porównania
SELECT * FROM film WHERE [length] > 100

-- Filtrowanie wartoœci w przedziale za pomoc¹ operatorów porównania
SELECT * FROM film WHERE replacement_cost >= 10 AND replacement_cost <= 20

-- Filtrowanie wartoœci w przedziale za pomoc¹ BETWEEN
SELECT * FROM film WHERE replacement_cost BETWEEN 10 AND 20

-- Filtrowanie rekordów rozpoczynaj¹cych siê od podanego fragmentu tekstu
SELECT * FROM customer WHERE first_name LIKE 'AL%'

-- % - oznacza dowolny tekst

-- Filtrowanie rekordów koñcz¹cych siê na podany fragmentu tekstu
SELECT * FROM customer WHERE email LIKE '%@sakilacustomer.org'

-- Filtrowanie rekordów zawieraj¹cy podany fragmentu tekstu
SELECT * FROM customer WHERE email LIKE '%sakila%'

-- _ - oznacza dowolny znak
SELECT email FROM customer WHERE email LIKE '%@sakilacustomer.___'

-- Filtrowanie rekordów na podstawie d³ugoœci wartoœci tekstowej
SELECT first_name, last_name, email FROM customer WHERE LEN(email) > 30

-- Operator AND (koniunkcja)
SELECT first_name, last_name, email FROM customer WHERE first_name = 'MARY' AND last_name = 'SMITH'

-- Operator OR (alternatywa)
SELECT first_name, last_name, email FROM customer WHERE first_name = 'MARY' OR first_name = 'JOHN'

SELECT first_name, last_name, email FROM customer WHERE first_name = 'MARY' OR first_name = 'JOHN' OR first_name = 'SUSAN'

-- Operator IN, czy wartoœæ pola znajduje siê w zbiorze wartoœci
SELECT first_name, last_name, email FROM customer WHERE first_name IN ('MARY', 'JOHN', 'SUSAN')

-- Do porównywania wartoœci NULL s³u¿y operator IS
SELECT * FROM [address] WHERE postal_code IS NULL

-- Operator IS mo¿na zanegowaæ
SELECT * FROM [address] WHERE postal_code IS NOT NULL


SELECT * FROM customer WHERE email IS NULL




