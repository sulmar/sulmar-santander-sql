USE Sakila

-- Pobranie wszystkich rekordów z tabeli
-- schemat.tabela
SELECT * FROM [dbo].[customer]

-- Schemat dbo jest schematem domyœlnym wiêc mo¿emy go pomijaæ:
SELECT * FROM customer

-- Wybór pól z tabeli
SELECT first_name, last_name, email FROM customer

-- Nazwy pól powinny byæ w nawiasach kwadratowych jeœli pojawiaj¹ siê w nich s³owa kluczowe
SELECT [name] FROM [language]

-- Ograniczenie iloœci rekordów
SELECT TOP(100) * FROM film

-- Ograniczenie iloœci rekordów i kolumn
SELECT TOP(100) title, [description], release_year FROM film

-- Pobranie unikalnych wartoœci
SELECT DISTINCT first_name FROM customer

