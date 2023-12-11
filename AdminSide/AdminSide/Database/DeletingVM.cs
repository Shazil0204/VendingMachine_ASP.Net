using System;
using System.Data;
using System.Data.SqlClient;

namespace AdminSide.Database
{
    public class DeleteVendingMachine
    {
        private string _connectionString;

        public int DeleteVM(string dbName)
        {

            if (dbName == "MainVM")
            {
                return AdminSide.Model.AllProperties.ResultValue = -10;
            }
            else
            {

                if (dbName == AdminSide.Model.AllProperties.CityName)
                {
                    Model.AllProperties.CityName = "MainVM";

                }

                var config = new ConfigurationBuilder()
                                .AddJsonFile("appsettings.json")
                                .Build();
                _connectionString = config.GetConnectionString("ConnectionString");

                using (var connection = new SqlConnection(_connectionString))
                {
                    var command = new SqlCommand("DELETINGVM", connection)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    command.Parameters.Add(new SqlParameter("@DBName", SqlDbType.VarChar) { Value = dbName });

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
}
