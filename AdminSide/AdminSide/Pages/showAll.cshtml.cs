using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace AdminSide.Pages
{
    public class showAllModel : PageModel
    {

		Database.ShowAllVM VM = new Database.ShowAllVM();

        public void OnGet()
        {
        }

		public List<string> VMs()
		{
			List<string> vm = new List<string>();

			vm = VM.GetCities();

			return vm;
		}
	}
}
