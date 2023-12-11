using System;
using System.Data;
using System.Data.SqlClient;

namespace AdminSide.Database
{
    public class VMStatus
    {
        internal bool ReadingVMStatus(string VMName)
        {
            bool dbStatus = true;

            var config = new ConfigurationBuilder()
                   .AddJsonFile("appsettings.json")
                   .Build();

            var conn = config.GetConnectionString("ConnectionString");

            using (SqlConnection con = new SqlConnection(conn))
            {
                using (SqlCommand cmd = new SqlCommand("READINGVMSTATUS", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@DBName", VMName));

                    try
                    {
                        con.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                // Assuming the stored procedure returns a result set
                                // Handle your results here
                                dbStatus = (bool)(reader["DBStatus"]);
                                return dbStatus;
                            }
                        }
                    }
                    catch (SqlException ex)
                    {
                        // Handle exceptions here
                        Console.WriteLine(ex.Message);
                    }
                }
            }

            return dbStatus;
        }
    }

}