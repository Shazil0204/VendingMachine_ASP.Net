using System.Data.SqlClient;

namespace AdminSide.Database
{
    public class UpdateVendingMachineStatus
    {
        internal void UpdateVMStatus(string VMName)
        {
            var config = new ConfigurationBuilder()
                   .AddJsonFile("appsettings.json")
                   .Build();

            var conn = config.GetConnectionString("AllVendingMachinesDB");

            using (var connection = new SqlConnection(conn))
            {
                using (var command = new SqlCommand("[dbo].[UPDATEDBSTATUS]", connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@VMName", VMName);

                    connection.Open();
                    command.ExecuteScalar();
                }
            }
        }
    }
}