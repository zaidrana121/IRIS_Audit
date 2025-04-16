namespace ASTSM.Model.DbModels;

public partial class DiscountType : BaseModel
{
    public string Title { get; set; }

    public string Description { get; set; }

    public bool? IsActive { get; set; }

    public virtual ICollection<Discount> Discounts { get; set; } = new List<Discount>();
}
