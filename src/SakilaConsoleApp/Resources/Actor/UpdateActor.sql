UPDATE actor 
 SET 
	first_name = @firstname,
	last_name  = @lastname
WHERE
	actor_id = @id