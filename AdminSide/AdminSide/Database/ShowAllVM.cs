using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;

namespace AdminSide.Database
{
	public class ShowAllVM
	{
		public Dictionary<string, bool> GetVendingMachineStatus()
		{
			Dictionary<string, bool> vendingMachines = new Dictionary<string, bool>();

			var config = new ConfigurationBuilder()
			   .AddJsonFile("appsettings.json")
			   .Build();

			var conn = config.GetConnectionString("AllVendingMachinesDB");

			using (SqlConnection connection = new SqlConnection(conn))
			{
				SqlCommand command = new SqlCommand("SHOWALLVENDINGMACHINES", connection);
				command.CommandType = System.Data.CommandType.StoredProcedure;

				try
				{
					connection.Open();

					SqlDataReader reader = command.ExecuteReader();

					while (reader.Read())
					{
						string dbName = reader["DBName"].ToString();
						bool dbStatus = (bool)reader["DBStatus"];

						vendingMachines.Add(dbName, dbStatus);
					}

					reader.Close();
				}
				catch (SqlException e)
				{
					Console.WriteLine(e.Message);
					// Handle exception
				}
			}

			return vendingMachines;
		}
	}
}
