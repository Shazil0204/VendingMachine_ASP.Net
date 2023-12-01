using System.Data.SqlClient;
using Microsoft.SqlServer;

namespace AdminSide.Database
{
	internal class Product
	{
		internal string Name { get; set; }
		internal decimal Price { get; set; }
		internal string ImageLink { get; set; }
		internal List<Product> GetProducts()
		{
			/*
			var config = new ConfigurationBuilder()
				.AddJsonFile("appsettings.json")
				.Build();

			var conn = config.GetConnectionString("AllVendingMachinesDB");
			
			using (var connection = new SqlConnection(conn))
			{
				using (var command = new SqlCommand("READINGVM", connection))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@VMName", ); 

					connection.Open();
				}
			}
			*/
			return new List<Product>
			{
				/* foreach(var in Product)
				{
						new Product()
						{
							Name = "Pepsi",
							Price = 15,
							ImageLink = "https://www.svgrepo.com/show/303358/pepsi-logo.svg",
						},
						new Product()
						{
							Name = "Nescafé",
							Price = 10,
							ImageLink = "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Nescaf%C3%A9_wordmark.svg/750px-Nescaf%C3%A9_wordmark.svg.png?20230610185935",
						},
						new Product()
						{
							Name = "Gfuel",
							Price = 20,
							ImageLink = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/G_Fuel_logo.svg/683px-G_Fuel_logo.svg.png?20190907060857",
						},
						new Product()
						{
							Name = "Gfuel",
							Price = 20,
							ImageLink = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/G_Fuel_logo.svg/683px-G_Fuel_logo.svg.png?20190907060857",
						},
						new Product()
						{
							Name = "Gfuel",
							Price = 20,
							ImageLink = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/G_Fuel_logo.svg/683px-G_Fuel_logo.svg.png?20190907060857",
						},
						new Product()
						{
							Name = "Gfuel",
							Price = 20,
							ImageLink = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/G_Fuel_logo.svg/683px-G_Fuel_logo.svg.png?20190907060857",
						},
						new Product()
						{
							Name = "Gfuel",
							Price = 20,
							ImageLink = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/G_Fuel_logo.svg/683px-G_Fuel_logo.svg.png?20190907060857",
						},
						new Product()
						{
							Name = "Gfuel",
							Price = 20,
							ImageLink = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/G_Fuel_logo.svg/683px-G_Fuel_logo.svg.png?20190907060857",
						},
						new Product()
						{
							Name = "Gfuel",
							Price = 20,
							ImageLink = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/G_Fuel_logo.svg/683px-G_Fuel_logo.svg.png?20190907060857",
						},
						new Product()
						{
							Name = "Gfuel",
							Price = 20,
							ImageLink = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/G_Fuel_logo.svg/683px-G_Fuel_logo.svg.png?20190907060857",
						},
						new Product()
						{
							Name = "Gfuel",
							Price = 20,
							ImageLink = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/G_Fuel_logo.svg/683px-G_Fuel_logo.svg.png?20190907060857",
						},
						new Product()
						{
							Name = "Gfuel",
							Price = 20,
							ImageLink = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/G_Fuel_logo.svg/683px-G_Fuel_logo.svg.png?20190907060857",
						},
						new Product()
						{
							Name = "G",
							Price = 20,
							ImageLink = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/G_Fuel_logo.svg/683px-G_Fuel_logo.svg.png?20190907060857",
						},
						new Product()
						{
							Name = "Gf",
							Price = 20,
							ImageLink = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/G_Fuel_logo.svg/683px-G_Fuel_logo.svg.png?20190907060857",
						},

						new Product()
						{
							Name = "Gfu",
							Price = 20,
							ImageLink = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/G_Fuel_logo.svg/683px-G_Fuel_logo.svg.png?20190907060857",
						},
						new Product()
						{
							Name = "Gfue",
							Price = 20,
							ImageLink = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/G_Fuel_logo.svg/683px-G_Fuel_logo.svg.png?20190907060857",
						},
						new Product()
						{
							Name = "Guf",
							Price = 20,
							ImageLink = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/G_Fuel_logo.svg/683px-G_Fuel_logo.svg.png?20190907060857",
						},
						new Product()
						{
							Name = "uel",
							Price = 20,
							ImageLink = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/G_Fuel_logo.svg/683px-G_Fuel_logo.svg.png?20190907060857",
						},
						new Product()
						{
							Name = "le",
							Price = 20,
							ImageLink = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/G_Fuel_logo.svg/683px-G_Fuel_logo.svg.png?20190907060857",
						},
						new Product()
						{
							Name = "el",
							Price = 20,
							ImageLink = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/G_Fuel_logo.svg/683px-G_Fuel_logo.svg.png?20190907060857",
						},
						new Product()
						{
							Name = "Coca Cola",
							Price = 25,
							ImageLink = "https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Coca-Cola_logo.svg/512px-Coca-Cola_logo.svg.png?20230911234338",
						},
				} */	
			};
		}
	}
}