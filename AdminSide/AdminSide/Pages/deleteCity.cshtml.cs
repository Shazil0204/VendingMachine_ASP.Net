using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace AdminSide.Pages
{
    public class deleteCityModel : PageModel
    {
        Database.DeleteCity DC = new Database.DeleteCity();
        Show_resultModel SAM = new Show_resultModel();
        public IActionResult OnGet()
        {
            if (HttpContext.Session.GetInt32("UserId") != 1)
            {
                return RedirectToPage("/Index");
            }
            Model.AllProperties.CurrentAction = "Delete City";
            return Page();
        }

        [BindProperty]
        public string DBName { get; set; }

        public IActionResult OnPostCreateVendingMachine()
        {
            Model.AllProperties.ResultValue = DC.DeletingCity(DBName);
            return RedirectToPage("/Show_result");
        }
    }
}
