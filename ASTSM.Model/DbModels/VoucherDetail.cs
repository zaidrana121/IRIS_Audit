using System;
using System.Collections.Generic;

namespace ASTSM.Model.DbModels;

public partial class VoucherDetail
{
    public int Id { get; set; }

    public int VoucherId { get; set; }

    public string FeesType { get; set; }

    public decimal FeesAmount { get; set; }

    public string DiscountType { get; set; }

    public int DiscountValue { get; set; }

    public decimal DiscountAmount { get; set; }

    public bool IsDiscounted { get; set; }
    public bool IsCancelled { get; set; }

    public virtual Voucher Voucher { get; set; }
}
