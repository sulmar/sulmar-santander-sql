use sakila


print DB_NAME()

SELECT DATABASEPROPERTYEX(DB_NAME(), 'Collation') AS DefaultCollation


SELECT 
	*
FROM
	actor
WHERE 
	first_name COLLATE Polish_CS_AS  = 'PENELOPE'