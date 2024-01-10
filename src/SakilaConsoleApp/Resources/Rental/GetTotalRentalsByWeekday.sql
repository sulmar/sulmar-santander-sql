SELECT TOP(3)
    DATENAME(WEEKDAY, rental_date) AS rental_day,
    COUNT(*) AS rental_count
FROM 
    rental
GROUP BY
    DATENAME(WEEKDAY, rental_date)
ORDER BY
    rental_count DESC