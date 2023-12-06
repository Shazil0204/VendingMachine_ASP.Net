using System;
using System.Data;
using System.Data.SqlClient;

namespace AdminSide.Database
{
    public class CreateBrand
    {
        internal int CreatingBrand(string brandName)
        {
            var config = new ConfigurationBuilder()
                   .AddJsonFile("appsettings.json")
                   .Build();

            var conn = config.GetConnectionString("AllVendingMachinesDB");

            using (var connection = new SqlConnection(conn))
            {
                using (var cmd = new SqlCommand("[dbo].[CREATINGBRAND]", connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@VMName", AdminSide.Model.AllProperties.CityName));
                    cmd.Parameters.Add(new SqlParameter("@BrandName", brandName));

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
