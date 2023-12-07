using System;
using System.Data;
using System.Data.SqlClient;

namespace AdminSide.Database
{
    public class UpdateCity
    {
        internal int UpdatingCity(string oldCityName, string newCityName)
        {
            var config = new ConfigurationBuilder()
                   .AddJsonFile("appsettings.json")
                   .Build();

            var conn = config.GetConnectionString("AllVendingMachinesDB");

            using (var connection = new SqlConnection(conn))
            {
                using (var cmd = new SqlCommand("[dbo].[UPDATINGCITYNAME]", connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@OLDCITYNAME", oldCityName));
                    cmd.Parameters.Add(new SqlParameter("@NEWCITYNAME", newCityName));

                    try
                    {
                        connection.Open();
                        var result = (int)cmd.ExecuteScalar();
                        AdminSide.Model.AllProperties.CityName = newCityName;
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
