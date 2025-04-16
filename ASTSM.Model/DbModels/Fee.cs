namespace ASTSM.Model.DbModels;

public partial class Fee : BaseModel
{
    public decimal TotalAmount { get; set; }

    public bool IsActive { get; set; }

    public virtual ICollection<FeeDetail> FeeDetails { get; set; } = new List<FeeDetail>();

    public virtual ICollection<Grade> Grades { get; set; } = new List<Grade>();
}
