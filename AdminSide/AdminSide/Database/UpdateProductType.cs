using System;
using System.Data;
using System.Data.SqlClient;

namespace AdminSide.Database
{
    public class UpdateProductType
    {
        internal int UpdatingPT(string oldPT, string newPT)
        {
            var config = new ConfigurationBuilder()
                   .AddJsonFile("appsettings.json")
                   .Build();

            var conn = config.GetConnectionString("ConnectionString");

            using (var connection = new SqlConnection(conn))
            {
                using (var cmd = new SqlCommand("[dbo].[UPDATINGPRODUCTTYPE]", connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@ProductType", oldPT));
                    cmd.Parameters.Add(new SqlParameter("@NewTypeName", newPT));

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
