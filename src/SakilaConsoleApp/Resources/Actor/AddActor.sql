INSERT INTO actor (first_name, last_name) 
	VALUES (@firstname, @lastname);

SELECT SCOPE_IDENTITY();