using Microsoft.Data.SqlClient;
using SakilaConsoleApp.Model;
using SakilaConsoleApp.Properties;

Console.WriteLine("Hello, Sakila!");

// GetAllCustomers();

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

        int filmId = reader.GetInt32(reader.GetOrdinal("film_id"));
        string title = reader.GetString(reader.GetOrdinal("title"));
        string description = reader.GetString(reader.GetOrdinal("description"));

        // Mapowanie       
        film.Id = filmId;
        film.Title = title;
        film.Description = description;
    }
}

connection.Close();

Console.WriteLine($"{film.Id} {film.Title} {film.Description}");






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