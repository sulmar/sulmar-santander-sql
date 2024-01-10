using Microsoft.Data.SqlClient;
using SakilaConsoleApp.Abstractions;
using SakilaConsoleApp.Infrastructure;
using SakilaConsoleApp.Mappers;
using SakilaConsoleApp.Model;
using SakilaConsoleApp.Properties;

Console.WriteLine("Hello, Sakila!");

string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=sakila;Integrated Security=True";
SqlConnection connection = new SqlConnection(connectionString);

IFilmRepository filmRepository = new DbFilmRepository(connection);

var films = filmRepository.GetFilmsAll();

foreach (var film in films)
{
    Console.WriteLine(film);
}


// GetTotalsRentalsByWeekday();

// GetAllCustomers();

// GetFilmById();

// GetFilmsByTitle();

// AddActor();

// UpdateActor();

// RemoveActor();

static void GetAllCustomers()
{
    // dotnet add package Microsoft.Data.SqlClient

    // Parametry połączenia do bazy danych
    string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=sakila;Integrated Security=True";

    // Tworzymy połączenie do bazy danych
    SqlConnection connection = new SqlConnection(connectionString);

    const string sql = "SELECT customer_id, first_name, last_name FROM customer";

    // Otwieramy połączenie do bazy danych
    connection.Open();

    // Tworzymy polecenie SQL
    SqlCommand command = new SqlCommand(sql, connection);

    // Wykonaj polecenie SQL i pobierz wyniki
    SqlDataReader reader = command.ExecuteReader();

    // Tworzymy listę klientów
    List<Customer> customers = new List<Customer>();

    if (reader.HasRows)
    {
        while (reader.Read())
        {
            // Odczytywanie wartości kolumn
            //object customerId = reader["customer_id"];
            //object firstName = reader["first_name"];
            //object lastName = reader["last_name"];
            //Console.WriteLine($"{customerId} {firstName} {lastName}");

            // Odczytywanie wartości kolumn i mapowanie na odpowiednie typy
            int customerId = reader.GetInt32(reader.GetOrdinal("customer_id"));
            string firstName = reader.GetString(reader.GetOrdinal("first_name"));
            string lastName = reader.GetString(reader.GetOrdinal("last_name"));

            // Mapowanie zmiennych na obiekt
            Customer customer = new Customer(customerId, firstName, lastName);

            customers.Add(customer);
        }
    }
    else
    {
        Console.WriteLine("No customers found");
    }


    // Zamykamy połączenie do bazy danych
    connection.Close();

    // Wyświetlenie listy klientów
    foreach (Customer customer in customers)
    {
        Console.WriteLine(customer.ToString());
    }
}

static void GetFilmById()
{
    // dotnet add package Microsoft.Data.SqlClient

    // Parametry połączenia do bazy danych
    string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=sakila;Integrated Security=True";

    // Tworzymy połączenie do bazy danych
    SqlConnection connection = new SqlConnection(connectionString);

    int selectedFilmId = 10;

    // Otwieramy połączenie do bazy danych
    connection.Open();

    // Tworzymy polecenie SQL
    SqlCommand command = new SqlCommand(Resources.GetFilmById, connection);

    // Przekazanie parametru do zapytania
    command.Parameters.AddWithValue("@film_id", selectedFilmId);

    Film film = new Film();

    SqlDataReader reader = command.ExecuteReader();
    {
        if (reader.HasRows)
        {
            reader.Read();

            film = FilmMapper.Map(reader);
        }
    }

    connection.Close();

    Console.WriteLine(film);
}

static void GetFilmsByTitle()
{
    string selectedTitle = "AC%";

    string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=sakila;Integrated Security=True";

    SqlConnection connection = new SqlConnection(connectionString);

    connection.Open();

    SqlCommand command = new SqlCommand(Resources.GetFilmsByTitle, connection);
    command.Parameters.AddWithValue("@title", selectedTitle);

    List<Film> films = new List<Film>();

    SqlDataReader reader = command.ExecuteReader();
    {
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                // Mapowanie   
                Film film = FilmMapper.Map(reader);

                films.Add(film);
            }
        }
    }



    connection.Close();

    foreach (Film film in films)
    {
        Console.WriteLine(film);
    }
}

static void AddActor()
{
    Actor actor = new Actor();
    actor.FirstName = "Bruce";
    actor.LastName = "Willis";

    string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=sakila;Integrated Security=True";

    SqlConnection connection = new SqlConnection(connectionString);

    SqlCommand command = new SqlCommand(Resources.AddActor, connection);

    command.Parameters.AddWithValue("@firstname", actor.FirstName);
    command.Parameters.AddWithValue("@lastname", actor.LastName);

    try
    {
        connection.Open();

        // int rowsAffected = command.ExecuteNonQuery();
        // Console.WriteLine($"{rowsAffected} rows affected.");

        int id = Convert.ToInt32(command.ExecuteScalar());
        actor.Id = id;

        Console.WriteLine(actor);
    }
    catch (SqlException e)
    {
        Console.WriteLine(e.ErrorCode);
    }
    finally
    {
        connection.Close();
    }
}

static void UpdateActor()
{
    Actor actor = new Actor();
    actor.Id = 201;
    actor.FirstName = "Bruce";
    actor.LastName = "Lee";

    string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=sakila;Integrated Security=True";

    SqlConnection connection = new SqlConnection(connectionString);

    SqlCommand command = new SqlCommand(Resources.UpdateActor, connection);
    command.Parameters.AddWithValue("@id", actor.Id);
    command.Parameters.AddWithValue("@firstname", actor.FirstName);
    command.Parameters.AddWithValue("@lastname", actor.LastName);

    try
    {
        connection.Open();

        int rowsAffected = command.ExecuteNonQuery();
        Console.WriteLine($"{rowsAffected} rows affected.");

        Console.WriteLine(actor);
    }
    catch (SqlException e)
    {
        Console.WriteLine(e.ErrorCode);
    }
    finally
    {
        connection.Close();
    }
}

static void RemoveActor()
{
    Actor actor = new Actor();
    actor.Id = 201;

    string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=sakila;Integrated Security=True";

    SqlConnection connection = new SqlConnection(connectionString);

    SqlCommand command = new SqlCommand(Resources.RemoveActor, connection);

    command.Parameters.AddWithValue("@id", actor.Id);

    try
    {
        connection.Open();

        int rowsAffected = command.ExecuteNonQuery();
        Console.WriteLine($"{rowsAffected} rows affected.");
    }
    catch (SqlException e)
    {
        Console.WriteLine(e.ErrorCode);
    }
    finally
    {
        connection.Close();
    }
}

static void GetTotalsRentalsByWeekday()
{
    string connectString = "Data Source=(localdb)\\MSSQLLocalDB; Initial Catalog=sakila; Integrated Security=True; Encrypt=False; Trust Server Certificate=False;";

    SqlConnection connection = new SqlConnection(connectString);

    try
    {
        connection.Open();

        SqlCommand command = new SqlCommand(Resources.GetTotalRentalsByWeekday, connection);

        List<TotalRentalsByWeekday> totals = new List<TotalRentalsByWeekday>();  // Zmieniona nazwa listy

        using (SqlDataReader reader = command.ExecuteReader())
        {
            while (reader.Read())
            {
                int rentalCount = reader.GetInt32(reader.GetOrdinal("rental_count"));
                string dayOfWeek = reader.GetString(reader.GetOrdinal("rental_day"));

                TotalRentalsByWeekday rentals = new TotalRentalsByWeekday(rentalCount, dayOfWeek);
                totals.Add(rentals);
            }
        }

        foreach (TotalRentalsByWeekday film in totals)  // Zmieniona nazwa listy
        {
            Console.WriteLine(film);
        }
    }
    catch (Exception ex)
    {
        Console.WriteLine($"Wystąpił błąd: {ex.Message}");
    }
    finally
    {
        connection.Close();
    }
}