using System.ComponentModel;

namespace ASTSM.Utlis.Enums
{
    public enum Designation
    {
        Principal,
        Accountant,
        Owner,
        Teacher,
        Coordinator
    }

    public static class VoucherStatues
    {
        public static string Unpaid = "Unpaid";
        public static string Paid = "Paid";
        public static string Cancelled = "Cancelled";
    }
}
