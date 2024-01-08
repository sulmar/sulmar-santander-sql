USE sakila

-- Zmienne

-- Deklaracja zmiennej
DECLARE @first_name VARCHAR(45)

-- Przypisanie warto�ci do zmiennej
SET @first_name = 'MARY' 

-- Wy�wietlenie komunikatu
PRINT 'Hello World'
PRINT @first_name

PRINT 'Hello ' + @first_name

-- U�ycie zmiennej w zapytaniu
SELECT first_name, last_name, email FROM customer WHERE first_name = @first_name
