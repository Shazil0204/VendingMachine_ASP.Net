using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace AdminSide.Pages
{
    public class Product_TypeModel : PageModel
    {
        Database.CreateProductType CPT = new Database.CreateProductType();
        Show_resultModel SAM = new Show_resultModel();
        public IActionResult OnGet()
        {
            if (HttpContext.Session.GetInt32("UserId") != 1)
            {
                return RedirectToPage("/Index");
            }
            Model.AllProperties.CurrentAction = "Create Product Type";
            return Page();
        }
        [BindProperty]
        public string TypeName { get; set; }

        public IActionResult OnPostCreateProductType()
        {
            Model.AllProperties.ResultValue = CPT.CreatingproductType(TypeName);
            return RedirectToPage("/Show_result");
        }
    }
}
