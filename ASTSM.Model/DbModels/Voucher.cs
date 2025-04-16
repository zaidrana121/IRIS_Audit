using System;
using System.Collections.Generic;

namespace ASTSM.Model.DbModels;

public partial class Voucher
{
    public int Id { get; set; }

    public string VoucherNo { get; set; }

    public DateTime IssueDate { get; set; }

    public DateTime DueDate { get; set; }

    public DateTime FeesMonth { get; set; }

    public int GradeId { get; set; }

    public string GradeTitle { get; set; }

    public int StudentId { get; set; }

    public string StudentName { get; set; }

    public string Rollno { get; set; }

    public decimal TotalAmount { get; set; }

    public int? ImageId { get; set; }

    public string Status { get; set; }

    public bool IsPaid { get; set; }
    public bool IsMonthly { get; set; }

    public int? PaidBy { get; set; }

    public DateTime? PaidOn { get; set; }
    public bool IsCancelled { get; set; }

    public int? CancelledBy { get; set; }

    public DateTime? CancelledOn { get; set; }

    public int GeneratedBy { get; set; }

    public DateTime GeneratedOn { get; set; }

    public int? DeletedBy { get; set; }

    public DateTime? DeletedOn { get; set; }

    public virtual ICollection<VoucherDetail> VoucherDetails { get; set; } = new List<VoucherDetail>();
}
