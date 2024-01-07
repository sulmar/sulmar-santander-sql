# Przykłady ze szkolenia Podstawy języka SQL

## Wprowadzenie

Witaj w repozytorium z materiałami do szkolenia **Podstawy języka SQL**.

Do rozpoczęcia tego kursu potrzebujesz następujących rzeczy:

1. [SQL Server Express LocalDb](https://learn.microsoft.com/en-us/sql/database-engine/configure-windows/sql-server-express-localdb).
2. Sklonuj repozytorium Git

```bash
git clone https://github.com/sulmar/sulmar-santander-sql
```

3. Utwórz bazę danych

```bash
sqlcmd -S localhost -d master -E -i sql-server-sakila-schema.sql
```

4. Załadowuj przykładowane dane

```bash
sqlcmd -S localhost -d sakila -E -i sql-server-sakila-insert-data.sql

```

## Podstawy
