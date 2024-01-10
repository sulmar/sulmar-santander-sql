
#  Wstawiania danych  

## Do istniejącej tabeli

## Na podstawie innej tabeli

### Wstawianie danych do nowej tabeli na podstawie innej tabeli
# Modyfikacja danych

~~~ sql
UPDATE customer
	SET active = 0
WHERE
	customerId = 10
~~~
# Usuwanie danych

~~~ sql
DELETE FROM customer	
WHERE
	customerId = 10
~~~