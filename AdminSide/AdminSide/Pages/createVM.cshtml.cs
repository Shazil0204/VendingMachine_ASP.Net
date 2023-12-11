using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace AdminSide.Pages
{
    public class createVMModel : PageModel
    {
        Database.CreateVendingMachine CVM = new Database.CreateVendingMachine();
        Show_resultModel SAM = new Show_resultModel();
        public IActionResult OnGet()
        {
            if (HttpContext.Session.GetInt32("UserId") != 1)
            {
                return RedirectToPage("/Index");
            }
            Model.AllProperties.CurrentAction = "Create Vending Machine";
            return Page();
        }

        [BindProperty]
        public string CityName { get; set; }

        [BindProperty]
        public string DBName { get; set; }

        public IActionResult OnPostCreateVendingMachine()
        {
            Model.AllProperties.ResultValue = CVM.CreateVM(DBName, CityName);
            return RedirectToPage("/Show_result");
        }
    }
}
