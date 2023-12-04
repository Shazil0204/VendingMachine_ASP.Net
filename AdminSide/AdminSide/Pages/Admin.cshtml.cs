using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace AdminSide.Pages
{
    public class AdminModel : PageModel
    {

        Model.AllProperties allProperties = new Model.AllProperties();

        // public void OnGet()
        // {
        // }

        public IActionResult OnGet()
        {
            if (HttpContext.Session.GetInt32("UserId") != 1)
            {
                return RedirectToPage("/Index");
            }

            return Page();
        }

        public IActionResult OnPostUpdateCurrentVMStatus()
		{
            allProperties.ChangeStatus();
			return RedirectToPage();
		}
    }
}
