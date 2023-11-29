using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace AdminSide.Pages
{
	//   public class showAllModel : PageModel
	//   {
	//	Database.ShowAllVM VM = new Database.ShowAllVM();
	//	public string BackgroundColor { get; set; }
	//	public string StatusText { get; set; }
	//	public List<string> VMs()
	//	{
	//		List<string> vm = new List<string>();

	//		vm = VM.GetCities();

	//		return vm;
	//	}

	//	public void OnGet()
	//	{
	//		int i = 0;

	//		if (i == 0)
	//		{
	//			BackgroundColor = "red";
	//			StatusText = "OFFLINE";
	//		}
	//		else if (i == 1)
	//		{
	//			BackgroundColor = "green";
	//			StatusText = "ONLINE";
	//		}
	//	}
	//}

	public class showAllModel : PageModel
	{
		Database.ShowAllVM VM = new Database.ShowAllVM();
		public Dictionary<string, string> DisplayInfo { get; set; } = new Dictionary<string, string>();

		public Dictionary<string, bool> VMs()
		{
			return VM.GetVendingMachineStatus();
		}

		public void OnGet()
        {
			// var vendingMachines = VMs();

			// foreach (var vm in vendingMachines)
			// {
			// 	string backgroundColor;
			// 	string statusText;

			// 	if (vm.Value) // If VM is online
			// 	{
			// 		backgroundColor = "green";
			// 		statusText = "ONLINE";
			// 	}
			// 	else // If VM is offline
			// 	{
			// 		backgroundColor = "red";
			// 		statusText = "OFFLINE";
			// 	}

			// 	DisplayInfo.Add(vm.Key, $"Background Color: {backgroundColor}, Status: {statusText}");
			// }

            // if (HttpContext.Session.GetInt32("UserId") != 1)
            // {
            //     return RedirectToPage("/Index");
            // }

            // return Page();
        }

		// public void OnGet()
		// {
		// 	var vendingMachines = VMs();

		// 	foreach (var vm in vendingMachines)
		// 	{
		// 		string backgroundColor;
		// 		string statusText;

		// 		if (vm.Value) // If VM is online
		// 		{
		// 			backgroundColor = "green";
		// 			statusText = "ONLINE";
		// 		}
		// 		else // If VM is offline
		// 		{
		// 			backgroundColor = "red";
		// 			statusText = "OFFLINE";
		// 		}

		// 		DisplayInfo.Add(vm.Key, $"Background Color: {backgroundColor}, Status: {statusText}");
		// 	}
		// }

		public IActionResult OnPostUpdateCurrentVM(string cityName)
		{
			VM.currentVM = cityName;
            // Additional logic here if needed

            Console.WriteLine(cityName);
            return RedirectToPage("/Admin"); // Reloads the page or redirects as necessary
		}

	}


}
