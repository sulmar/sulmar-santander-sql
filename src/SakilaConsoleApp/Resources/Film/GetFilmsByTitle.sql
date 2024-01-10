-- DECLARE @title VARCHAR(255) = 'AC%'

SELECT film_id, title, [description] FROM film WHERE title LIKE @title 