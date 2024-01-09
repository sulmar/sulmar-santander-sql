-- Tabele tymczasowa
CREATE TABLE #ratings (
   name_eng VARCHAR(20),
   name_pl VARCHAR(20)
)

INSERT INTO #ratings (name_eng, name_pl)
	VALUES 
		('NC-17', 'od 17 lat'),
		('PG', 'BO z rodzicami'),
		('PG-13', 'od 13 lat'),
		('G', 'BO'),
		('R', 'od 18 lat')

SELECT 
	title, 
	rating,
	r.name_pl AS [rating_pl]
FROM 
	film AS f
		INNER JOIN #ratings AS r
		  ON f.rating = r.name_eng


DROP TABLE #ratings