using Microsoft.Data.SqlClient;
using SakilaConsoleApp.Model;

Console.WriteLine("Hello, Sakila!");

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
foreach(Customer customer in customers)
{
    Console.WriteLine(customer.ToString());
}