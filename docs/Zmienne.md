
~~~ sql
-- Deklaracja zmiennej
DECLARE @first_name VARCHAR(45)

-- Przypisanie wartości do zmiennej
SET @first_name = 'MARY' 

-- Użycie zmiennej w zapytaniu
SELECT first_name, last_name, email FROM customer WHERE first_name = @first_name
~~~