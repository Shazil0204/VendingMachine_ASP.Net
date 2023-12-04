using System;
using System.Data;
using System.Data.SqlClient;

namespace AdminSide.Database
{
    public class CreateProduct
    {
        internal int CreatingProduct(string VMName, string productName, string URL, int stock, int price, int brandID, int typeID)
        {
            var config = new ConfigurationBuilder()
                   .AddJsonFile("appsettings.json")
                   .Build();

            var conn = config.GetConnectionString("AllVendingMachinesDB");

            using (var connection = new SqlConnection(conn))
            {
                using (var cmd = new SqlCommand("[dbo].[CREATEPRODUCT]", connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@VMName", VMName));
                    cmd.Parameters.Add(new SqlParameter("@ProductName", productName));
                    cmd.Parameters.Add(new SqlParameter("@ProductURL", URL));
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