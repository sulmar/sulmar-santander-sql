USE sakila

-- Iloœæ rekordów
SELECT COUNT(*) FROM customer

-- Iloœæ aktywnych klientów
SELECT COUNT(*) FROM customer WHERE active = 1

SELECT DISTINCT active FROM customer 

-- Ilu jest nieaktywnych klientów?
SELECT COUNT(*) FROM customer WHERE active = 0
SELECT COUNT(*) FROM customer WHERE NOT active = 1

SELECT COUNT(*) FROM customer WHERE active <> 1
SELECT COUNT(*) FROM customer WHERE active != 1

-- Liczba rekordów
SELECT COUNT(*) FROM [address]

SELECT COUNT(address_id) FROM [address]

-- Liczba wartoœci (z pominiêciem NULL)
SELECT COUNT(postal_code) FROM [address]

SELECT postal_code, ISNULL(postal_code, '---') FROM [address]

SELECT COUNT(ISNULL(postal_code, '')) FROM [address]

-- Obliczenie œredniej (uwaga: pomija wartoœci NULL!)
SELECT AVG(amount) FROM payment 

-- Obliczenie œredniej z zastosowaniem funkcji ISNULL
SELECT AVG(ISNULL(amount, 0)) FROM payment 

-- Obliczenie sumy
SELECT SUM(amount) FROM payment

-- Obliczenie minimum i maksimum
SELECT MIN(amount), MAX(amount) FROM payment

-- Ile jest wypo¿yczeñ zrealizowanych przez pracownika o id = 1 (staff_id)
SELECT COUNT(*) FROM rental WHERE staff_id = 1

-- Ile jest nieoddanych filmów?
SELECT COUNT(*) FROM rental WHERE return_date IS NULL

-- Ile jest filmów w kategorii PG, PG-13 i czas wypo¿yczenia do 3 dni (rental_duration)?


