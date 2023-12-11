using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace AdminSide.Pages
{
    public class updateProductModel : PageModel
    {
        public IActionResult OnGet()
        {
            if (HttpContext.Session.GetInt32("UserId") != 1)
            {
                return RedirectToPage("/Index");
            }
            Model.AllProperties.CurrentAction = "Create Product";
            return Page();
        }
        Database.updateProduct UP = new Database.updateProduct();

        [BindProperty]
        public string ProductName { get; set; }

        [BindProperty]
        public string URL { get; set; }

        [BindProperty]
        public int Price { get; set; }

        [BindProperty]
        public int Stock { get; set; }

        [BindProperty]
        public int BrandID { get; set; }

        [BindProperty]
        public int TypeID { get; set; }

        public IActionResult OnPostCreateProduct()
        {
            Model.AllProperties.ResultValue = UP.UpdatingProduct(ProductName, URL, Price, Stock, BrandID, TypeID);
            return RedirectToPage("/Show_result");
        }
    }
}
