# Operacje liczbowe

- mnożenie 
~~~ sql
SELECT 
    title,
	rental_duration * rental_rate AS rental_amount
FROM 
    film;
~~~

- użycie stałej
~~~ sql
SELECT 
	amount, 
	amount * 0.23 AS tax 
FROM 
	payment
~~~

# Operacje tekstowe

~~~ sql
SELECT
	first_name + ' ' + last_name AS full_name
FROM customer
~~~ 
# Funkcje tekstowe

~~~ sql
SELECT
	first_name,
	LOWER(first_name) as NormalizedFirstName,
	UPPER(email) as NormalizedEmail,
	LEFT(first_name, 3), 
	RIGHT(first_name, 3),
	SUBSTRING(first_name, 3, 2),
	CHARINDEX('.', email) AS DotIndex
FROM customer
~~~

## Zadanie
- Utwórz listę klientów w następujący sposób:

| capitalized_first_name | capitalized_last_name | email_normalized | domain |
| ---- | ---- | ---- | ---- |
| Mary | Smith | mary.smith@sakilacustomer.org | sakilacustomer.org |
| Patricia | Johnson | patricia.johnson@sakilacustomer.org | sakilacustomer.org |
| Linda | Williams | linda.williams@sakilacustomer.org | sakilacustomer.org |
| ... | ... |  |  |

### Rozwiązanie

~~~ sql
SELECT 
    UPPER(SUBSTRING(first_name, 1, 1)) + LOWER(SUBSTRING(first_name, 2, LEN(first_name))) AS capitalized_first_name,
    UPPER(SUBSTRING(last_name, 1, 1)) + LOWER(SUBSTRING(last_name, 2, LEN(last_name))) AS capitalized_last_name,
	LOWER(email) AS email_normalized,
     SUBSTRING(email, CHARINDEX('@', email) + 1, LEN(email) - CHARINDEX('@', email)) AS domain
FROM 
    customer;
~~~



# Funkcje datowe

## Operacje na dacie

~~~ sql
SELECT	
	YEAR(payment_date) as [payment_year],
	MONTH(payment_date) as [payment_month],
	DAY(payment_date) as [payment_day],
	DATEPART(weekday , payment_date) AS [weekday],
	DATENAME(weekday , payment_date) AS [weekname]
FROM
	payment
~~~

Wskazówka: zmiana języka
~~~ sql
SET LANGUAGE Polish;
~~~

## Operacje pomiędzy datami

~~~ sql
SELECT
    rental_id,
    rental_date,
    return_date,
    DATEDIFF(day, rental_date, return_date) AS days_rented,
    DATEADD(day, 14, rental_date) AS due_date
FROM
    rental
~~~
## Zadanie 

- Wyświetl w jaki dzień tygodnia wypożyczane i zwracany są filmy

| rental_id | rental_weekday | return_weekday |
| ---- | ---- | ---- |
| 1 | wtorek | niedziela |
| 2 | piątek | środa |
| 3 | czwartek | niedziela |
| ... | ... | ... |

# Wybór wartości
~~~ sql
select 
	first_name, 
	last_name, 
	active,
	display_active = 
	case active
		when 1 then 'Aktywny'
		when 0 then 'Nieaktywny'
	end
from customer
~~~

## Zadanie
- Wyświetl listę filmów w następujący sposób:

| Tytuł | Opis | Rok | Grupa wiekowa |
| ---- | ---- | ---- | ---- |
| ACADEMY DINOSAUR | An Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies | 2006 | BO z rodzicami |
| ACE GOLDFINGER | A Astounding Epistle of a Database Administrator And a Explorer who must Find a Car in Ancient China | 2006 | BO |
| ADAPTATION HOLES | A Astounding Reflection of a Lumberjack And a Car who must Sink a Lumberjack in A Baloon Factory | 2006 | od 17 lat |
| ... | ... | ... | ... |
- Zastosuj mapowanie:
 
| Rating | Opis |
| ---- | ---- |
| NC-17 | od 17 lat |
| PG | BO z rodzicami |
| PG-13 | od 13 lat |
| G | BO |
| R | dla dorosłych |

~~~ sql
select 
	title AS Tytuł, 	
	description AS Opis,
	release_year AS Rok
	'Grupa wiekowa' = 
	case rating 	
		when 'NC-17' then 'od 17 lat'
		when 'PG' then 'BO z rodzicami'
		when 'PG-13' then 'od 13 lat'
		when 'G' then 'BO'
		when 'R' then 'dla dorosłych'
	end 	
from film
~~~
