Grupowanie wymaga umiejętności [[Funkcje agregujące]]
## Grupowanie po datach
- jakie mieliśmy przychody w poszczególnych latach?

~~~ sql
select
	datepart(year, payment_date) as year,
	sum(amount) as total
from payment
group by datepart(year, payment_date)
~~~

- jakie mieliśmy przychody w poszczególnych latach i miesiącach?
~~~ sql
select
	datepart(year, payment_date) as year,
	datepart(month, payment_date) as month,
	sum(amount) as total
from payment
group by 
	datepart(year, payment_date),
	datepart(month, payment_date)
order by year, month
~~~

## Zadania 

### Zadanie

- Znajdź najczęściej wypożyczany film

### Zadanie 1

- Wyświetl zestawienie ile mamy filmów w poszczególnych kategoriach filmowych:

| category_name | quantity |
| ---- | ---- |
| Action | 64 |
| Animation | 66 |
| Children | 60 |
| ... | ... |

### Rozwiązanie

~~~ sql
select 
	c.name as category_name, 
	count(*) as quantity 
from film_category fc 
	inner join category as c
		on fc.category_id  = c.category_id
group by c.name
~~~

### Zadanie 2

- Wyświetl zestawienie, które zaprezentuje 3 dni tygodnia, w których najczęściej wypożyczane są filmy:

| rental_weekname | quantity |
| ---- | ---- |
| wtorek | 2463 |
| niedziela | 2320 |
| sobota | 2311 |


# Funkcje agregujące

# Filtrowanie grup

## Zadanie

- Znajdź aktorów, którzy zagrali więcej niż w 2 filmach


| actor_id | actor_first_name | actor_last_name | film_count |
| ---- | ---- | ---- | ---- |
| 1 | John | Smith | 3 |
| 2 | Brat | Pit | 5 |
| ... | ... | ... | ... |
## Zadanie

- Wyświetl tylko takie kategorie filmowe, w których mamy powyżej 70 filmów

| category_name | quantity |
| ---- | ---- |
| Foreign | 73 |
| Sports | 74 |


### Rozwiązanie

~~~ sql
select 
	c.name as category_name, 
	count(*) as quantity 
from film_category fc 
	inner join category as c
		on fc.category_id  = c.category_id
group by c.name
having count(*) > 70
~~~
