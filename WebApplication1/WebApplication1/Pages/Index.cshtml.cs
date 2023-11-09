using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace WebApplication1.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;

        Database.DatabaseConnection DB = new Database.DatabaseConnection();

        public IndexModel(ILogger<IndexModel> logger)
        {
            _logger = logger;
        }

        public void OnGet()
        {

        }

        public List<string> VMs()
        {
            List<string> vm = new List<string>();

            vm = DB.GetCities();

            return vm;
        }
    }
}