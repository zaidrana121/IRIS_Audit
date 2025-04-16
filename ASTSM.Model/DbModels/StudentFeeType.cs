namespace ASTSM.Model.DbModels;

public partial class StudentFeeType
{
    public int Id { get; set; }

    public int StudentId { get; set; }

    public int FeeTypeId { get; set; }

    public int CreatedBy { get; set; }

    public DateTime CreatedOn { get; set; }
}
