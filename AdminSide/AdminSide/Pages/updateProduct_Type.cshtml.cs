using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace AdminSide.Pages
{
    public class updateProduct_TypeModel : PageModel
    {
        Database.UpdateProductType UPT = new Database.UpdateProductType();
        Show_resultModel SAM = new Show_resultModel();
        public IActionResult OnGet()
        {
            if (HttpContext.Session.GetInt32("UserId") != 1)
            {
                return RedirectToPage("/Index");
            }
            Model.AllProperties.CurrentAction = "Update Product Type";
            return Page();
        }
        [BindProperty]
        public string Old_PT { get; set; }

        [BindProperty]
        public string New_PT { get; set; }

        public IActionResult OnPostCreateProductType()
        {
            Model.AllProperties.ResultValue = UPT.UpdatingPT(Old_PT, New_PT);
            return RedirectToPage("/Show_result");
        }
    }
}
