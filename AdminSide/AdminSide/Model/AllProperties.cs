using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace AdminSide.Model
{
    public class AllProperties
    {
        public static string CityName = "København";
        Database.VMStatus Ustatus = new Database.VMStatus();
        Database.UpdateVendingMachineStatus Rstatus = new Database.UpdateVendingMachineStatus();

        internal bool VMstatus()
        {
            bool VMS = Ustatus.ReadingVMStatus(CityName);

            return VMS; 
        }

        internal void ChangeStatus()
        {
            Rstatus.UpdateVMStatus(CityName);
        }
    }
}
    