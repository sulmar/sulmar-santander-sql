namespace SakilaConsoleApp.Model;

internal class TotalRentalsByWeekday
{
    public int RentalCount { get; set; }
    public string DayOfWeek { get; set; }

    public TotalRentalsByWeekday(int rentalCount, string dayOfWeek)
    {
        RentalCount = rentalCount;
        DayOfWeek = dayOfWeek;
    }

    public override string ToString() => $"Rental Count: {RentalCount}, Day of Week: {DayOfWeek}";
}