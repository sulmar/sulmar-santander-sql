USE Sakila

-- Filtrowanie rekord�w na podstawie por�wnania
-- SELECT * FROM tabela WHERE predykat

-- Filtrowanie na podst. pola numerycznego
SELECT * FROM film WHERE release_year = 2006

-- Filtrowanie na podst. pola tekstowego
SELECT * FROM film WHERE rating = 'PG' 

-- Filtrowanie na podstawie por�wnania
SELECT * FROM film WHERE [length] > 100

-- Filtrowanie warto�ci w przedziale za pomoc� operator�w por�wnania
SELECT * FROM film WHERE replacement_cost >= 10 AND replacement_cost <= 20

-- Filtrowanie warto�ci w przedziale za pomoc� BETWEEN
SELECT * FROM film WHERE replacement_cost BETWEEN 10 AND 20

-- Filtrowanie rekord�w rozpoczynaj�cych si� od podanego fragmentu tekstu
SELECT * FROM customer WHERE first_name LIKE 'AL%'

-- % - oznacza dowolny tekst

-- Filtrowanie rekord�w ko�cz�cych si� na podany fragmentu tekstu
SELECT * FROM customer WHERE email LIKE '%@sakilacustomer.org'

-- Filtrowanie rekord�w zawieraj�cy podany fragmentu tekstu
SELECT * FROM customer WHERE email LIKE '%sakila%'

-- _ - oznacza dowolny znak
SELECT email FROM customer WHERE email LIKE '%@sakilacustomer.___'

-- Filtrowanie rekord�w na podstawie d�ugo�ci warto�ci tekstowej
SELECT first_name, last_name, email FROM customer WHERE LEN(email) > 30

-- Operator AND (koniunkcja)
SELECT first_name, last_name, email FROM customer WHERE first_name = 'MARY' AND last_name = 'SMITH'

-- Operator OR (alternatywa)
SELECT first_name, last_name, email FROM customer WHERE first_name = 'MARY' OR first_name = 'JOHN'

SELECT first_name, last_name, email FROM customer WHERE first_name = 'MARY' OR first_name = 'JOHN' OR first_name = 'SUSAN'

-- Operator IN, czy warto�� pola znajduje si� w zbiorze warto�ci
SELECT first_name, last_name, email FROM customer WHERE first_name IN ('MARY', 'JOHN', 'SUSAN')

-- Do por�wnywania warto�ci NULL s�u�y operator IS
SELECT * FROM [address] WHERE postal_code IS NULL

-- Operator IS mo�na zanegowa�
SELECT * FROM [address] WHERE postal_code IS NOT NULL


SELECT * FROM customer WHERE email IS NULL




