namespace ASTSM.Model.DbModels;

public partial class FeeDetail
{
    public int Id { get; set; }

    public int FeeTypeId { get; set; }

    public decimal Amount { get; set; }

    public int FeeId { get; set; }

    public int DiscountId { get; set; }

    public int CreatedBy { get; set; }

    public DateTime CreatedOn { get; set; }

    public int? UpdatedBy { get; set; }

    public DateTime? UpdatedOn { get; set; }

    public virtual Fee Fee { get; set; }

    public virtual FeeType FeeType { get; set; }
}
