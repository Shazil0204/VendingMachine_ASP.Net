using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace AdminSide.Pages
{
    public class updateBrandModel : PageModel
    {
        Database.UpdateBrand UB = new Database.UpdateBrand();
        Show_resultModel SAM = new Show_resultModel();
        public IActionResult OnGet()
        {
            if (HttpContext.Session.GetInt32("UserId") != 1)
            {
                return RedirectToPage("/Index");
            }
            Model.AllProperties.CurrentAction = "Update Brand";
            return Page();
        }
        [BindProperty]
        public string Old_Brand_Name { get; set; }

        [BindProperty]
        public string New_Brand_Name { get; set; }

        public IActionResult OnPostCreateProductType()
        {
            Model.AllProperties.ResultValue = UB.UpdatingBrand(Old_Brand_Name, New_Brand_Name);
            return RedirectToPage("/Show_result");
        }
    }
}
