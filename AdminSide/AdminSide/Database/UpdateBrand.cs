using System;
using System.Data;
using System.Data.SqlClient;

namespace AdminSide.Database
{
    public class UpdateBrand
    {
        internal int UpdatingBrand(string oldBrandName, string newBrandName)
        {
            var config = new ConfigurationBuilder()
                   .AddJsonFile("appsettings.json")
                   .Build();

            var conn = config.GetConnectionString("ConnectionString");

            using (var connection = new SqlConnection(conn))
            {
                using (var cmd = new SqlCommand("[dbo].[UPDATINGBRAND]", connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@ProductBrand", oldBrandName));
                    cmd.Parameters.Add(new SqlParameter("@NewBrandName", newBrandName));

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
