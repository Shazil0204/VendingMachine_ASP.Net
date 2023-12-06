using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace AdminSide.Pages
{
    public class createCityModel : PageModel
    {
        Database.CreateCity Cc = new Database.CreateCity();
        Show_resultModel SAM = new Show_resultModel();
        public IActionResult OnGet()
        {
            if (HttpContext.Session.GetInt32("UserId") != 1)
            {
                return RedirectToPage("/Index");
            }
            Model.AllProperties.CurrentAction = "Create City";
            return Page();
        }
        
        [BindProperty]
        public string CityName { get; set; }

        public IActionResult OnPostCreateVendingMachine()
        {
            Model.AllProperties.ResultValue = Cc.CreatingCity(CityName);
            return RedirectToPage("/Show_result");
        }
    }
}
