using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace AdminSide.Model
{
    public class AllProperties
    {
        public static string CityName = "MainVM";
        public static string CurrentAction = "Null";
        public static int ResultValue = -50;
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
