using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace AdminSide.Pages
{
    public class CreateProductModel : PageModel
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
        Database.CreateProduct CP = new Database.CreateProduct();
        Show_resultModel SAM = new Show_resultModel();

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
            Model.AllProperties.ResultValue = CP.CreatingProduct(Model.AllProperties.CityName, ProductName, URL, Price, Stock, BrandID, TypeID);
            return RedirectToPage("/Show_result");
        }
    }
}
