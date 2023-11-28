using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;

namespace AdminSide.Database
{
    public class Login
    {
        internal int ValidateUser(int employeeNumber, string username, string password)
        {
            var config = new ConfigurationBuilder()
                   .AddJsonFile("appsettings.json")
                   .Build();

            var conn = config.GetConnectionString("AdminLoginDB");

            using (var connection = new SqlConnection(conn))
            {
                using (var command = new SqlCommand("[dbo].[CHECKINGPERMISSION]", connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@EmployeeNumber", employeeNumber);
                    command.Parameters.AddWithValue("@UserName", username);
                    command.Parameters.AddWithValue("@Password", password);

                    connection.Open();
                    var result = (int)command.ExecuteScalar();

                    return result;
                }
            }
        }
    }
}