namespace ASTSM.Model.DbModels;

public partial class Discount :BaseModel
{

    public decimal Amount { get; set; }

    public int DiscountTypeId { get; set; }

	public string Reason { get; set; }

	public bool IsActive { get; set; }

    public int? DeletedBy { get; set; }

    public virtual DiscountType DiscountType { get; set; }

}
