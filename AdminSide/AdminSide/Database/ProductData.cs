namespace AdminSide.Database
{
	internal class Product
	{
		internal string Name { get; set; }
		internal decimal Price { get; set; }
		internal string ImageLink { get; set; }

		internal List<Product> GetProducts()
		{
			return new List<Product>
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


			};
		}
	}
}