
## Wprowadzenie

## Instalacja

~~~ bash
dotnet add package Microsoft.Data.SqlClient
~~~


## Podstawowe operacje

### Pobieranie danych

~~~ csharp
using System;
using System.Data.SqlClient;
using System.Data;

class Program
{
    static void Main()
    {
        string connectionString = "yourConnectionString"; // Replace with your actual connection string

        // Create and open a connection
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            // Replace 'yourDatabaseName' with your actual database name
            string query = "SELECT CustomerID, CustomerName, City FROM customer WHERE City = @TargetCity";

            // Replace 'yourUsername' and 'yourPassword' with your actual SQL Server username and password
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                // Replace 'yourUsername' with your actual SQL Server username
                command.Parameters.AddWithValue("@TargetCity", "targetCity"); // Replace 'targetCity' with the actual city you're searching for

                // Execute the query
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    // Check if there are any rows
                    if (reader.HasRows)
                    {
                        // Iterate through the rows and display results
                        while (reader.Read())
                        {
                            Console.WriteLine($"CustomerID: {reader["CustomerID"]}, CustomerName: {reader["CustomerName"]}, City: {reader["City"]}");
                        }
                    }
                    else
                    {
                        Console.WriteLine("No customers found for the specified city.");
                    }
                }
            }
        }
    }
}

~~~ 

### Modyfikacja

~~~ csharp

~~~

## Wstrzykiwanie zależności

~~~ csharp
public void ConfigureServices(IServiceCollection services)
{
    services.AddScoped<ICustomerService, DbCustomerService>();

    services.AddScoped<SqlConnection>(options => new SqlConnection(Configuration.GetConnectionString("MyConnection")));
}
~~~

## Repozytorium

~~~ csharp
 public class DbCustomerService : ICustomerService
    {
        private readonly SqlConnection connection;

        public DbCustomerService(SqlConnection connection)
        {
            this.connection = connection;
        }

        public void Add(Customer customer)
        {
             string sql = "INSERT INTO [dbo].[customer] (first_name, last_name) VALUES (@FirstName, @LastName)";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@FirstName", customer.FirstName);
            command.Parameters.AddWithValue("@LastName", customer.LastName);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        public IEnumerable<Customer> Get()
        {
            IList<Customer> customers = new List<Customer>();
             
            string sql = "SELECT customer_id, first_Name, last_Name FROM [dbo].[customer]";

            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                Customer customer = Map(reader);
                customers.Add(customer);
            }

            connection.Close();

            return customers;
        }

        private static Customer Map(SqlDataReader reader)
        {
            Customer customer = new Customer();
            customer.Id = reader.GetInt32(0);
            customer.FirstName = reader.GetString(1);
            customer.LastName = reader.GetString(2);

            return customer;
        }

        public Customer Get(int id)
        {
            Customer customer = null;

            string sql = "SELECT Id, FirstName, LastName FROM [dbo].[customer] WHERE customer_id = @Id";

            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@Id", id);
            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            if (reader.Read())
            {
                customer = Map(reader);
            }

            connection.Close();

            return customer;
        }

        public void Remove(int id)
        {
            string sql = "DELETE FROM [dbo].[customer] WHERE Id = @Id";

            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();

            command.ExecuteNonQuery();

            connection.Close();
        }

        public void Update(Customer customer)
        {
            string sql = "UPDATE [dbo].[customer] SET first_name=@FirstName, last_name=@LastName WHERE CustomerId = @id";

            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@Id", id);
            command.Parameters.AddWithValue("@FirstName", customer.FirstName);
            command.Parameters.AddWithValue("@LastName", customer.LastName);
            connection.Open();

            command.ExecuteNonQuery();

            connection.Close();
        }
    }
~~~

## Zadanie

- Utwórz aplikację konsolową lub desktopową do obsługi wypożyczalni wideo
- Dodaj wyszukiwanie filmów z katalogu na podstawie nazwy i ratingu
- Dodaj możliwość wypożyczenia wybranego filmu
- Dodaj możliwość zwrotu wypożyczonego filmu

