using System.Data.SqlClient;
using System.Diagnostics;
using Microsoft.SqlServer;

namespace AdminSide.Database
{
	internal class Product
	{
		internal string Name { get; private set; }
		internal int Price { get; private set; }
		internal string ImageLink { get; private set; }

		internal List<Product> products = new List<Product>();

		internal void GetProducts()
		{
			var config = new ConfigurationBuilder()
				.AddJsonFile("appsettings.json")
				.Build();

			var conn = config.GetConnectionString("AllVendingMachinesDB");
			
			using (var connection = new SqlConnection(conn))
			{
				using (var command = new SqlCommand("READINGVM", connection))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@VMName", Model.AllProperties.CityName); 

					connection.Open();

					SqlDataReader reader = command.ExecuteReader();
					while (reader.Read())
					{
						Name = reader["ProductName"].ToString();
						Price = (int)reader["Price"];
						ImageLink = reader["ProductURL"].ToString();

						products.Add(new Product() {Name = Name, Price = Price, ImageLink = ImageLink});
					}
					reader.Close();
				}
			}
		}
	}
}