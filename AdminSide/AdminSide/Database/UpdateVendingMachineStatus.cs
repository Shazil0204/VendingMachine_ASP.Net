using System.Data.SqlClient;

namespace AdminSide.Database
{
    public class UpdateVendingMachineStatus
    {
        internal int VMStatus(int NewStatus, string VMName)
        {
            var config = new ConfigurationBuilder()
                   .AddJsonFile("appsettings.json")
                   .Build();

            var conn = config.GetConnectionString("AdminLoginDB");

            using (var connection = new SqlConnection(conn))
            {
                using (var command = new SqlCommand("[dbo].[UPDATEDBSTATUS]", connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@VMName", VMName);
                    command.Parameters.AddWithValue("@NewStatus", NewStatus);

                    connection.Open();
                    var result = (int)command.ExecuteScalar();

                    return result;
                }
            }
        }
    }
}