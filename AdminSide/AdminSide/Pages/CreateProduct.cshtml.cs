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

            return Page();
        }

        [BindProperty]
        public string CityName { get; set; }

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
            Debug.WriteLine(AdminSide.Model.AllProperties.CityName + "\n" + ProductName+ "\n" + URL + "\n" + Price + "\n" + Stock + "\n" + BrandID + "\n" + TypeID);
            return RedirectToPage("/Admin");
        }
    }
}
