using System;
using System.Data;
using System.Data.SqlClient;

namespace AdminSide.Database
{
    public class updateProduct
    {
        internal int UpdatingProduct(string ProductName, string ProductURL, int stock, int price, int brandID, int typeID)
        {
            var config = new ConfigurationBuilder()
                   .AddJsonFile("appsettings.json")
                   .Build();

            var conn = config.GetConnectionString("ConnectionString");

            using (var connection = new SqlConnection(conn))
            {
                using (var cmd = new SqlCommand("[dbo].[UPDATTINGPRODUCT]", connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@DBName", AdminSide.Model.AllProperties.CityName));
                    cmd.Parameters.Add(new SqlParameter("@ProductName", ProductName));
                    cmd.Parameters.Add(new SqlParameter("@ProductURL", ProductURL));
                    cmd.Parameters.Add(new SqlParameter("@Stock", stock));
                    cmd.Parameters.Add(new SqlParameter("@Price", price));
                    cmd.Parameters.Add(new SqlParameter("@BrandID", brandID));
                    cmd.Parameters.Add(new SqlParameter("@TypeID", typeID));

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
