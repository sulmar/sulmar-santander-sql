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

-- Filtrowanie rekord�w na podstawie fragmentu tekstu
SELECT * FROM customer WHERE first_name LIKE 'AL%'

-- % - oznacza dowolny tekst