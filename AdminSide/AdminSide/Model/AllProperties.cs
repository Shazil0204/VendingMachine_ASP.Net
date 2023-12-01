using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace AdminSide.Model
{
    public class AllProperties
    {
        public static string CityName = "København";
        AdminSide.Database.VMStatus status = new AdminSide.Database.VMStatus();

        internal bool VMstatus()
        {
            bool VMS = status.Status(CityName);

            return VMS; 
        }
    }
}
    