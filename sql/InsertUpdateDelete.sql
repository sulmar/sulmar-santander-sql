
-- Dodanie rekordu do tabeli
INSERT INTO city (city, country_id)
	VALUES ('Warsaw', 76)


-- Dodanie rekordów na podstawie innej tabeli
INSERT INTO customer (store_id, first_name, last_name, email, address_id, active)
SELECT 
	1,
	first_name,
	last_name,
	email,
	1,
	1
FROM staff

select * from customer

UPDATE customer
	SET 
		active = 0, 
		store_id = 2
	WHERE 
		customer_id = 602

DELETE customer
	WHERE customer_id = 602

TRUNCATE TABLE customer