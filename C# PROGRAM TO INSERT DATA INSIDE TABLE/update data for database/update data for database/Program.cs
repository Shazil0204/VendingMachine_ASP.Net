using System;
using System.IO;
using System.Data.SqlClient;

namespace Insert_Data
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string path = "C:\\Users\\Shaz0184\\Desktop\\Vendimg Machine\\SQL Script\\City Name.txt";

            if (File.Exists(path))
            {
                // Read all lines (city names)
                string[] cityNames = File.ReadAllLines(path);

                string connectionstring = "Server=localhost;Database=AllVendingMachinesDB;User=Login;Password=Login;Encrypt=False;";

                using (SqlConnection connection = new SqlConnection(connectionstring))
                {
                    connection.Open();

                    foreach (string cityName in cityNames)
                    {
                        string insertQuery = "INSERT INTO Cities (City) VALUES (@City)";
                        using (SqlCommand cmd = new SqlCommand(insertQuery, connection))
                        {
                            cmd.Parameters.AddWithValue("@City", cityName.Trim());

                            cmd.ExecuteNonQuery();
                        }
                    }
                }

                Console.WriteLine("City names have been inserted into the database.");
            }
            else
            {
                Console.WriteLine($"The file {path} does not exist.");
            }
        }
    }
}
