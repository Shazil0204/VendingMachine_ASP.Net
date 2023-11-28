using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace AdminSide.Pages
{
    internal class IndexModel : PageModel
    {
        private readonly Database.Login _login;
        private readonly ILogger<IndexModel> _logger;
        public int LoginResult { get; private set; }

        public IndexModel(ILogger<IndexModel> logger, Database.Login login )
        {
            _logger = logger;
            _login = login;
        }
        public void OnGet()
        {
 
        }

        // public IActionResult OnPost(int EmployeeNumber, string username, string password)
        // {

        //     LoginResult = _login.ValidateUser(EmployeeNumber, username, password);

        //     if (LoginResult == 1) // Successful login
        //     {
        //         HttpContext.Session.SetInt32("UserId", LoginResult);
        //         return RedirectToPage("/Admin");
        //     }

        //     return Page();
        // }

        public IActionResult OnPost(int EmployeeNumber, string username, string password)
        {
            LoginResult = _login.ValidateUser(EmployeeNumber, username, password);

            if (LoginResult == 1) // Successful login
            {
                HttpContext.Session.SetInt32("UserId", LoginResult);
                return RedirectToPage("/Admin");
            }

            return Page();
        }

    }
}