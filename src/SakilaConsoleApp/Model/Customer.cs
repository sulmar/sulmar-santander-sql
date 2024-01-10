namespace SakilaConsoleApp.Model
{
    public class Customer
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public Customer(int id, string firstName, string lastName)
        {
            this.Id = id;
            this.FirstName  = firstName;
            this.LastName = lastName;
        }

        public override string ToString()
        {
            return $"{Id} {FirstName} {LastName}";
        }
    }
}
