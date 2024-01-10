using Microsoft.Data.SqlClient;
using SakilaConsoleApp.Abstractions;
using SakilaConsoleApp.Mappers;
using SakilaConsoleApp.Model;
using SakilaConsoleApp.Properties;

namespace SakilaConsoleApp.Infrastructure
{

    public class DbFilmRepository : IFilmRepository
    {
        private readonly SqlConnection connection;

        public DbFilmRepository(SqlConnection connection)
        {
            this.connection = connection;
        }

        public List<Film> GetFilmsAll()
        {
            const string sql = "SELECT film_id, title, description FROM film";

            List<Film> films = new List<Film>();
            
            using SqlCommand command = new SqlCommand(sql, connection);

            connection.Open();

            using SqlDataReader reader = command.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Film film = FilmMapper.Map(reader);
                    films.Add(film);
                }
            }

            connection.Close();

            return films;
        }

        public List<Film> GetFilmsByTitle(string title)
        {
            connection.Open();

            using SqlCommand command = new SqlCommand(Resources.GetFilmsByTitle, connection);
            command.Parameters.AddWithValue("@title", title);

            List<Film> films = new List<Film>();

            using SqlDataReader reader = command.ExecuteReader();
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

            return films;
        }
    }
}
