USE sakila

-- Ilo�� rekord�w
SELECT COUNT(*) FROM customer

-- Ilo�� aktywnych klient�w
SELECT COUNT(*) FROM customer WHERE active = 1

SELECT DISTINCT active FROM customer 

-- Ilu jest nieaktywnych klient�w?
SELECT COUNT(*) FROM customer WHERE active = 0
SELECT COUNT(*) FROM customer WHERE NOT active = 1

SELECT COUNT(*) FROM customer WHERE active <> 1
SELECT COUNT(*) FROM customer WHERE active != 1

-- Liczba rekord�w
SELECT COUNT(*) FROM [address]

SELECT COUNT(address_id) FROM [address]

-- Liczba warto�ci (z pomini�ciem NULL)
SELECT COUNT(postal_code) FROM [address]

SELECT postal_code, ISNULL(postal_code, '---') FROM [address]

SELECT COUNT(ISNULL(postal_code, '')) FROM [address]

-- Obliczenie �redniej (uwaga: pomija warto�ci NULL!)
SELECT AVG(amount) FROM payment 

-- Obliczenie �redniej z zastosowaniem funkcji ISNULL
SELECT AVG(ISNULL(amount, 0)) FROM payment 

-- Obliczenie sumy
SELECT SUM(amount) FROM payment

-- Obliczenie minimum i maksimum
SELECT MIN(amount), MAX(amount) FROM payment

-- Ile jest wypo�ycze� zrealizowanych przez pracownika o id = 1 (staff_id)
SELECT COUNT(*) FROM rental WHERE staff_id = 1

-- Ile jest nieoddanych film�w?
SELECT COUNT(*) FROM rental WHERE return_date IS NULL

-- Ile jest film�w w kategorii PG, PG-13 i czas wypo�yczenia do 3 dni (rental_duration)?


