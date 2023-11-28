using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace AdminSide.Pages
{
    public class Create_BrandModel : PageModel
    {
        public IActionResult OnGet()
        {
            if (HttpContext.Session.GetInt32("UserId") != 1)
            {
                return RedirectToPage("/Index");
            }

            return Page();
        }
    }
}
