using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace AdminSide.Pages
{
    public class Create_BrandModel : PageModel
    {
        Database.CreateBrand CB = new Database.CreateBrand();
        Show_resultModel SAM = new Show_resultModel();
        public IActionResult OnGet()
        {
            if (HttpContext.Session.GetInt32("UserId") != 1)
            {
                return RedirectToPage("/Index");
            }
            Model.AllProperties.CurrentAction = "Create Brand";
            return Page();
        }

        [BindProperty]
        public string BrandName { get; set; }

        public IActionResult OnPostCreateBrand()
        {
            Model.AllProperties.ResultValue = CB.CreatingBrand(BrandName);
            return RedirectToPage("/Show_result");
        }
    }
}

/*
    hello world i am here+
                       
*/