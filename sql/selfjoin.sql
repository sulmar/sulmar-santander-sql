SELECT * from staff

-- Dodanie nowej kolumny do tabeli
ALTER TABLE staff
	ADD manager_id INT

-- Aktualizacja wybranego rekordu
UPDATE staff
SET manager_id = 1
WHERE staff_id = 2


-- Samoz³¹czenie (self-join)

-- | staff_first_name | staff_last_name | manager_first_name | manager_last_name |

SELECT * FROM staff

SELECT
	staff.first_name AS staff_first_name,
	staff.last_name AS staff_last_name,
	manager.first_name AS  manager_first_name,
	manager.last_name AS manager_last_name
FROM
	staff 
	LEFT OUTER JOIN staff AS manager
		ON staff.manager_id = manager.staff_id



