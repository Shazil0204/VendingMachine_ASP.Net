using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace AdminSide.Pages
{
    public class showAllModel : PageModel
    {
		Database.ShowAllVM VM = new Database.ShowAllVM();
		public string BackgroundColor { get; set; }
		public string StatusText { get; set; }
		public List<string> VMs()
		{
			List<string> vm = new List<string>();

			vm = VM.GetCities();

			return vm;
		}

		public void OnGet()
		{
			int i = 0;

			if (i == 0)
			{
				BackgroundColor = "red";
				StatusText = "OFFLINE";
			}
			else if (i == 1)
			{
				BackgroundColor = "green";
				StatusText = "ONLINE";
			}
		}
	}
}
