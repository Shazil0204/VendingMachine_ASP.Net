using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace AdminSide.Pages
{
    public class updateCityModel : PageModel
    {
        Database.UpdateCity UC = new Database.UpdateCity();
        Show_resultModel SAM = new Show_resultModel();
        public IActionResult OnGet()
        {
            if (HttpContext.Session.GetInt32("UserId") != 1)
            {
                return RedirectToPage("/Index");
            }
            Model.AllProperties.CurrentAction = "Update City Name";
            return Page();
        }

        [BindProperty]
        public string oldCityName { get; set; }

        [BindProperty]
        public string newCityName { get; set; }

        public IActionResult OnPostCreateVendingMachine()
        {
            Model.AllProperties.ResultValue = UC.UpdatingCity(oldCityName, newCityName);
            return RedirectToPage("/Show_result");
        }
    }
}
