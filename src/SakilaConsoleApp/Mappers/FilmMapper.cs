using Microsoft.Data.SqlClient;
using SakilaConsoleApp.Model;

namespace SakilaConsoleApp.Mappers
{
    internal class FilmMapper
    {
        public static Film Map(SqlDataReader reader)
        {
            int filmId = reader.GetInt32(reader.GetOrdinal("film_id"));
            string title = reader.GetString(reader.GetOrdinal("title"));
            string description = reader.GetString(reader.GetOrdinal("description"));

            Film film = new Film();
            film.Id = filmId;
            film.Title = title;
            film.Description = description;
            return film;
        }
    }
}
