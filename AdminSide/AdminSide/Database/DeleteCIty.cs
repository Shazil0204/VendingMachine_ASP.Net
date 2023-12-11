using System;
using System.Data;
using System.Data.SqlClient;

namespace AdminSide.Database
{
    public class DeleteCity
    {
        private string _connectionString;

        public int DeletingCity(string dbName)
        {

            var config = new ConfigurationBuilder()
                            .AddJsonFile("appsettings.json")
                            .Build();
            _connectionString = config.GetConnectionString("ConnectionString");
     
            using (var connection = new SqlConnection(_connectionString))
            {
                var command = new SqlCommand("DELETINGCITY", connection)
                {
                    CommandType = CommandType.StoredProcedure
                };

                command.Parameters.Add(new SqlParameter("@City", SqlDbType.VarChar) { Value = dbName });

                try
                {
                    connection.Open();
                    int result = (int)command.ExecuteScalar();
                    return result;
                }
                catch (SqlException e)
                {
                    Console.WriteLine($"SQL Error: {e.Message}");
                    return -1;
                }
                finally
                {
                    connection.Close();
                }
            }
        }

    }
}
