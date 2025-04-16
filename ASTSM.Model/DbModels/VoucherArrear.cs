namespace ASTSM.Model.DbModels;

public partial class VoucherArrear
{
    public int Id { get; set; }

    public int VoucherId { get; set; }

    public int VoucherArrearId { get; set; }

    public bool IsPaid { get; set; }

    public int CreatedBy { get; set; }

    public DateTime CraetedOn { get; set; }
}
