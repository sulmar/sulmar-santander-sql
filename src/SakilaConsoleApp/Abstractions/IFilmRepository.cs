using SakilaConsoleApp.Model;

namespace SakilaConsoleApp.Abstractions
{
    public interface IFilmRepository
    {
        List<Film> GetFilmsAll();
        List<Film> GetFilmsByTitle(string title);
    }
}
