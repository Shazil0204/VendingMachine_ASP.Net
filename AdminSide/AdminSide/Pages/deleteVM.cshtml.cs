using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace AdminSide.Pages
{
    public class deleteVMModel : PageModel
    {
        Database.DeleteVendingMachine DVM = new Database.DeleteVendingMachine();
        Show_resultModel SAM = new Show_resultModel();
        public IActionResult OnGet()
        {
            if (HttpContext.Session.GetInt32("UserId") != 1)
            {
                return RedirectToPage("/Index");
            }
            Model.AllProperties.CurrentAction = "Delete Vending Machine";
            return Page();
        }

        [BindProperty]
        public string DBName { get; set; }

        public IActionResult OnPostCreateVendingMachine()
        {
            Model.AllProperties.ResultValue = DVM.DeleteVM(DBName);
            return RedirectToPage("/Show_result");
        }
    }
}
