using System;
using System.Data;
using System.Data.SqlClient;

namespace AdminSide.Database
{
    public class CreateVendingMachine
    {
        private string _connectionString;

        public int CreateVM(string dbName, string cityName)
        {
            var config = new ConfigurationBuilder()
                            .AddJsonFile("appsettings.json")
                            .Build();
            _connectionString = config.GetConnectionString("ConnectionString");
     
            using (var connection = new SqlConnection(_connectionString))
            {
                var command = new SqlCommand("CREATINGVM", connection)
                {
                    CommandType = CommandType.StoredProcedure
                };

                command.Parameters.Add(new SqlParameter("@DBName", SqlDbType.VarChar) { Value = dbName });
                command.Parameters.Add(new SqlParameter("@CityName", SqlDbType.VarChar) { Value = cityName });

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
