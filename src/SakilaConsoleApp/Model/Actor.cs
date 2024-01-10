namespace SakilaConsoleApp.Model
{
    internal class Actor
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public override string ToString()
        {
            return $"{Id} {FirstName} {LastName}";  
        }
    }
}
