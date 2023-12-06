using System;
using System.Data;
using System.Data.SqlClient;

namespace AdminSide.Database
{
    public class CreateCity
    {
        internal int CreatingCity(string name)
        {
            var config = new ConfigurationBuilder()
                   .AddJsonFile("appsettings.json")
                   .Build();

            var conn = config.GetConnectionString("AllVendingMachinesDB");

            using (var connection = new SqlConnection(conn))
            {
                using (var cmd = new SqlCommand("[dbo].[INSERTCITY]", connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@City", name));

                    try
                    {
                        connection.Open();
                        var result = (int)cmd.ExecuteScalar();
                        return result;
                    }
                    catch (SqlException ex)
                    {
                        // Handle exceptions here
                        Console.WriteLine(ex.Message);
                        return -1; // Indicate error
                    }
                }
            }   
        }
    }
}
