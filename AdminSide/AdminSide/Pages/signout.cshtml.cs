using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace AdminSide.Pages
{
    public class signoutModel : PageModel
    {
        public IActionResult OnGet()
        {
            if (HttpContext.Session.GetInt32("UserId") != 1)
            {
                return RedirectToPage("/Index");
            }
            Model.AllProperties.CurrentAction = "Sign Out";
            return Page();
        }

        public IActionResult OnGetSignOut()
        {
            HttpContext.Session.Remove("UserId");
            // Alternatively, you could clear the entire session:
            // HttpContext.Session.Clear();

            return RedirectToPage("/Index");
        }
    }
}
