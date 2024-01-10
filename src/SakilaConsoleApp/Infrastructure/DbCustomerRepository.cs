using Microsoft.Data.SqlClient;
using SakilaConsoleApp.Abstractions;
using SakilaConsoleApp.Model;
using SakilaConsoleApp.Properties;

namespace SakilaConsoleApp.Infrastructure
{
    public class DbCustomerRepository : ICustomerRepository
    {
        private readonly SqlConnection connection;

        public DbCustomerRepository(SqlConnection connection)
        {
            this.connection = connection;
        }

        public void AddCustomer(Customer customer)
        {
            // TODO: Change Resources.AddActor to Resources.AddCustomer
            throw new NotImplementedException();

            using SqlCommand command = new SqlCommand(Resources.AddActor, connection);

            command.Parameters.AddWithValue("@firstname", customer.FirstName);
            command.Parameters.AddWithValue("@lastname", customer.LastName);

            try
            {
                connection.Open();

                int id = Convert.ToInt32(command.ExecuteScalar());
                customer.Id = id;
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

        public Customer GetCustomerById(int id)
        {
            throw new NotImplementedException();
        }

        public List<Customer> GetCustomersAll()
        {
            throw new NotImplementedException();
        }

        public void RemoveCustomer(int id)
        {
            // TODO: Change Resources.RemoveActor to Resources.RemoveCustomer
            throw new NotImplementedException();

            SqlCommand command = new SqlCommand(Resources.RemoveActor, connection);

            command.Parameters.AddWithValue("@id", id);

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

        public void UpdateCustomer(Customer customer)
        {
            // TODO: Change Resources.UpdateActor to Resources.UpdateCustomer
            throw new NotImplementedException();

            using SqlCommand command = new SqlCommand(Resources.UpdateActor, connection);
            command.Parameters.AddWithValue("@id", customer.Id);
            command.Parameters.AddWithValue("@firstname", customer.FirstName);
            command.Parameters.AddWithValue("@lastname", customer.LastName);

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
    }
}
