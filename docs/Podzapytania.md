# Zapytanie na podst. podzapytania  
# Podzapytania z IN  

- Find films that belong to the Action or Drama categories

~~~ sql
SELECT film_id, title
FROM film
WHERE category_id IN (
    SELECT category_id
    FROM category
    WHERE name IN ('Action', 'Drama')
);
~~~

# Zagnieżdżanie podzapytań  
# Podzapytania skorelowane

# Predykaty
## Predykat ANY

## Predykat ALL