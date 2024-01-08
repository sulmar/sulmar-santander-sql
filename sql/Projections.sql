USE Sakila

-- Pobranie wszystkich rekord�w z tabeli
-- schemat.tabela
SELECT * FROM [dbo].[customer]

-- Schemat dbo jest schematem domy�lnym wi�c mo�emy go pomija�:
SELECT * FROM customer

-- Wyb�r p�l z tabeli
SELECT first_name, last_name, email FROM customer

-- Nazwy p�l powinny by� w nawiasach kwadratowych je�li pojawiaj� si� w nich s�owa kluczowe
SELECT [name] FROM [language]

-- Ograniczenie ilo�ci rekord�w
SELECT TOP(100) * FROM film

-- Ograniczenie ilo�ci rekord�w i kolumn
SELECT TOP(100) title, [description], release_year FROM film

-- Pobranie unikalnych warto�ci
SELECT DISTINCT first_name FROM customer

