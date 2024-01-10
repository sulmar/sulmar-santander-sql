using Microsoft.Data.SqlClient;
using SakilaConsoleApp.Mappers;
using SakilaConsoleApp.Model;
using SakilaConsoleApp.Properties;

Console.WriteLine("Hello, Sakila!");

// GetAllCustomers();

// GetFilmById();

GetFilmsByTitle();

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