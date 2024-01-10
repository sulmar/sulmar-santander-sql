namespace SakilaConsoleApp.Model
{
    public class Film
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public int ReleaseYear { get; set; }
        public byte LanguageId { get; set; }
        public byte RentalDuration { get; set; }
        public float RentalRate { get; set; }
        public byte Length { get; set; }
        public decimal ReplacementCost { get; set; }
        public string Rating { get; set; }
        public DateTime LastUpdate { get; set; }
    }

    /*
      |-----------------|----------|
      | SQL Server      |  C#      |
      |-----------------|----------|
      | bigint          | long     |
      | int             | int      |
      | smallint        | short    |
      | varchar         | string   |
      | nvarchar        | string   |
      | text            | string   |
      | tinyint         | byte     |
      | smallint        | int      |
      | datetime        | DateTime |
      | numeric(n)      | int      |
      | numeric(n,m)    | decimal  |
      | decimal(n,m)    | decimal  |
      | real            | float    |
      | bit             | bool     |
      | time             | TimeSpan |
      | varbinary        | byte[]   |
      | uniqueidentifier | Guid     |
      |------------------|----------|

    */
}
