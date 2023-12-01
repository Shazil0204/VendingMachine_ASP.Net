using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using AdminSide.Model;

namespace AdminSide.Pages
{
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

		}

		// public IActionResult OnPostUpdateCurrentVM(string cityName)
		// {
		// 	Model.AllProperties.CityName = cityName;

		// 	Console.WriteLine(Model.AllProperties.CityName);
		// 	return RedirectToPage("/Admin");
		// }

		public IActionResult OnPostUpdateCurrentVM(string ButtonName)
		{
			Console.WriteLine(ButtonName);
			AdminSide.Model.AllProperties.CityName = ButtonName;
			return RedirectToPage("/Admin");
		}

	}
}