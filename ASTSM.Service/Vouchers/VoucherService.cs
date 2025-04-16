using ASTSM.Data.Repositories.Grades;
using ASTSM.Data.Repositories.UnitOfWork;
using ASTSM.Model.DbModels;
using ASTSM.Model.Dtos;
using ASTSM.Model.Dtos.ManualVouchers;
using ASTSM.Model.Dtos.Students;
using ASTSM.Model.Dtos.Vouchers;
using ASTSM.Model.IdentityModel;
using ASTSM.Service.Grades;
using ASTSM.Service.Students;
using ASTSM.Service.Users;
using ASTSM.Utlis.Enums;
using Microsoft.VisualBasic;
using System.Linq.Expressions;

namespace ASTSM.Service.Vouchers
{
    public class VoucherService : IVoucherService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IGradeService _gradeService;
        private readonly UserIdentity _loggedInUser;
        public VoucherService(IUnitOfWork unitOfWork, IGradeService gradeService, UserSessionService userSessionService)
        {
            _unitOfWork = unitOfWork;
            _gradeService = gradeService;
            _loggedInUser = userSessionService.GetLoginUserInfo();
        }

        public async Task<VoucherDto> GenerateVouchersAsync()
        {
            try
            {
                return await _unitOfWork.VoucherRepository.GenerateVouchersAsync();
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public async Task<List<VoucherDto>> SearchVouchers(VoucherSearchRequestDto searchRequestDto)
        {
            try
            {
                Expression<Func<Voucher, bool>> filter = x =>
                x.VoucherNo == (searchRequestDto.VoucherNo != "" ? searchRequestDto.VoucherNo : x.VoucherNo)
                && x.StudentId == (searchRequestDto.StudentId != 0 ? searchRequestDto.StudentId : x.StudentId)
                && x.GradeId == (searchRequestDto.GradeId != 0 ? searchRequestDto.GradeId : x.GradeId)
                && x.Status == (searchRequestDto.Status != "" ? searchRequestDto.Status : x.Status)
                && x.FeesMonth >= (searchRequestDto.StartDate != null? searchRequestDto.StartDate : x.FeesMonth)
                && x.FeesMonth <= (searchRequestDto.EndDate != null? searchRequestDto.EndDate : x.FeesMonth);

                var vouchers = await _unitOfWork.VoucherRepository.GetAllAsync(filter);


                var result = vouchers.Select(u => new VoucherDto
                {
                    ClassSection = u.GradeTitle,
                    DueDate = u.DueDate,
                    StudentName = u.StudentName,
                    IssueDate = u.IssueDate,
                    FeesMonth = u.FeesMonth,
                    VoucherNo = u.VoucherNo,
                    IsMonthly = u.IsMonthly,
                    VoucherStatus = u.Status,
                    RollNo = u.Rollno,
                    TotalAmount = u.TotalAmount,
                    VoucherDetails = u.VoucherDetails.Select(d => new VoucherDetailDto()
                    {
                        FeeAmount = d.FeesAmount,
                        FeeTypeTitle = d.FeesType,
                        FeeTypeId = 0,
                        DiscountAmount = d.DiscountAmount,
                        DiscountValue = d.DiscountValue,
                        DiscountType = d.DiscountType


                    }).ToList()
                }).ToList();

                return result;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<bool> UpdateDueDate(int VoucherId, DateTime dueDate)
        {
            try
            {
                var voucher = await _unitOfWork.VoucherRepository.GetByIdAsync(VoucherId);

                if (voucher == null)
                    return false;

                voucher.DueDate = dueDate.Date;
                await _unitOfWork.VoucherRepository.UpdateAsync(voucher);

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public async Task<List<VoucherDto>> GetVoucherbyIds(List<int> voucherIds)
        {
            try
            {
                Expression<Func<Voucher, bool>> filter = x => voucherIds.Contains(x.Id);

                var vouchers = await _unitOfWork.VoucherRepository.GetAllAsync(filter);

                var result = vouchers.Select(u => new VoucherDto
                {
                    ClassSection = u.GradeTitle,
                    DueDate = u.DueDate,
                    StudentName = u.StudentName,
                    RollNo = u.Rollno,
                    IssueDate = u.IssueDate,
                    FeesMonth = u.FeesMonth,
                    VoucherNo = u.VoucherNo,
                    VoucherStatus = u.Status,
                    IsPaid = u.IsPaid,
                    TotalAmount = u.TotalAmount,
                    VoucherDetails = u.VoucherDetails.Select(d => new VoucherDetailDto()
                    {
                        FeeAmount = d.FeesAmount,
                        FeeTypeTitle = d.FeesType,
                        FeeTypeId = 0,
                        DiscountAmount = d.DiscountAmount,
                        DiscountValue = d.DiscountValue,
                        DiscountType = d.DiscountType

                    }).ToList()
                }).ToList();

                return result;
            }
            catch (Exception ex)
            {
                throw;
            }
        }


        public async Task<List<int>> GenerateVouchersAsync(VoucherGenerateDto voucherGenerateDto)
        {
            try
            {
                List<int> voucherIds = new List<int>();

                var grade = await _gradeService.GetByIdAsync(voucherGenerateDto.GradeId);
                var feesTypes = await _unitOfWork.FeeTypeRepository.GetAllAsync();
                var discountTypes = await _unitOfWork.DiscountTypeRepository.GetAllAsync();

                foreach (var studentId in voucherGenerateDto.StudentIds)
                {
                    var student = await _unitOfWork.StudentRepository.GetByIdAsync(studentId);
                    var studentFees = await _unitOfWork.StudentFeeTypeRepository.GetAllbyStudentId(studentId);
                    Voucher vochure = new Voucher()
                    {
                        GradeId = grade.Id,
                        GradeTitle = grade.Title,
                        StudentId = student.Id,
                        StudentName = student.Name,
                        Rollno = student.Rollno,
                        IssueDate = DateTime.Now,
                        DueDate = voucherGenerateDto.DueDate,
                        FeesMonth = new DateTime(month: voucherGenerateDto.Month, year: voucherGenerateDto.Year, day: 1),
                        GeneratedBy = _loggedInUser.Id,
                        GeneratedOn = DateTime.Now,
                        Status = VoucherStatues.Unpaid,
                        VoucherNo = "",
                        IsPaid = false,
                        IsCancelled = false,
                        IsMonthly = true,
                        TotalAmount = grade.Fee.TotalAmount

                    };

                    await _unitOfWork.VoucherRepository.AddAsync(vochure);

                    vochure.VoucherNo = vochure.Id.ToString("00000");

                    await _unitOfWork.VoucherRepository.UpdateAsync(vochure);

                    decimal tempTotalAmount = 0;
                    Expression<Func<Voucher, bool>> filterUnpaidVouchers = x => !x.IsPaid && x.StudentId.Equals(student.Id) && x.GradeId.Equals(grade.Id) && x.FeesMonth.Month < vochure.FeesMonth.Month && x.IsMonthly && x.IsCancelled == false;
                    var unpaidVouchers = await _unitOfWork.VoucherRepository.GetAllAsync(filterUnpaidVouchers);
                    if (unpaidVouchers != null && unpaidVouchers.Count > 0)
                    {
                        var unpaidVoucherIds = unpaidVouchers.Select(x => x.Id);


                        var arrears = unpaidVoucherIds.Select(x => new VoucherArrear
                        {
                            VoucherArrearId = x,
                            VoucherId = vochure.Id,
                            IsPaid = false,
                            CreatedBy = _loggedInUser.Id,
                            CraetedOn = DateTime.Now
                        }).ToList();

                        await _unitOfWork.VoucherArrearsRepository.AddRangeAsync(arrears);
                        var ArrearsTotal = await CalculateAndUpdateArrears(vochure.Id, "create");
                        tempTotalAmount = tempTotalAmount + ArrearsTotal;
                    }

                    List<VoucherDetail> voucherDetails = new();
                    foreach (var fees in grade.Fee.FeeDetails)
                    {

                        if (!studentFees.Select(u => u.FeeTypeId).Contains(fees.FeeTypeId))
                            continue;

                        int discountId = 0;
                        if (student.IsStudentDiscount)
                        {
                            var studenDiscount = await _unitOfWork.StudentDiscountDetailRepository.GetStudentDiscountId(studentId, fees.FeeTypeId);
                            discountId = studenDiscount != null ? (int)studenDiscount.DiscountId : 0;
                        }
                        else
                            discountId = fees.DiscountId;

                        var discount = await _unitOfWork.DiscountRepository.GetByIdAsync(discountId);
                        decimal total = 0;

                        VoucherDetail voucherDetail = new()
                        {
                            VoucherId = vochure.Id,
                            FeesAmount = fees.Amount,
                            IsCancelled = false,
                            DiscountType = discount != null ? discount.DiscountType.Title : "",
                            DiscountAmount = discount != null ? (discount.DiscountType.Title == "Percentage" ? (fees.Amount - (discount.Amount / 100) * fees.Amount) : (fees.Amount - discount.Amount)) : (int)fees.Amount,
                            FeesType = feesTypes.FirstOrDefault(u => u.Id == fees.FeeTypeId)?.Title ?? "",
                            DiscountValue = discount != null ? (int)discount.Amount : 0
                        };
                        voucherDetails.Add(voucherDetail);

                        tempTotalAmount = tempTotalAmount + voucherDetail.DiscountAmount;

                    }
                    await _unitOfWork.VoucherDetailRepository.AddRangeAsync(voucherDetails);
                    if (tempTotalAmount > 0)
                    {
                        vochure.TotalAmount = tempTotalAmount;
                        await _unitOfWork.VoucherRepository.UpdateAsync(vochure);
                    }


                    voucherIds.Add(vochure.Id);
                }
                return voucherIds;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public async Task<bool> PayVoucherbyIds(List<int> voucherIds)
        {
            try
            {
                Expression<Func<Voucher, bool>> filterVoucher = x => voucherIds.Contains(x.Id);
                var vouchers = await _unitOfWork.VoucherRepository.GetAllAsync(filterVoucher);


                foreach (var voucher in vouchers)
                {

                    Expression<Func<VoucherArrear, bool>> filterArrearsVoucher = x => x.VoucherId.Equals(voucher.Id);
                    var unpaidVouchers = await _unitOfWork.VoucherArrearsRepository.GetAllAsync(filterArrearsVoucher);// AID 1 VID 2

                    var arearsToUpdate = unpaidVouchers.Where(x => x.IsPaid == false).Select(u => u.VoucherArrearId).ToList();
                    arearsToUpdate.Add(voucher.Id);

                    foreach (var arearToUpdate in arearsToUpdate)
                    {
                        var upVoucher = await _unitOfWork.VoucherRepository.GetByIdAsync(arearToUpdate);

                        upVoucher.IsPaid = true;
                        upVoucher.Status = VoucherStatues.Paid;
                        upVoucher.PaidBy = _loggedInUser.Id;
                        upVoucher.PaidOn = DateTime.Now;
                        await _unitOfWork.VoucherRepository.UpdateAsync(upVoucher);

                        Expression<Func<VoucherArrear, bool>> filterUpArrearsVoucher = x => x.VoucherArrearId.Equals(arearToUpdate);
                        var upArrearsVoucher = await _unitOfWork.VoucherArrearsRepository.GetAllAsync(filterUpArrearsVoucher);

                        foreach (var o in upArrearsVoucher)
                        {
                            o.IsPaid = true;
                            await _unitOfWork.VoucherArrearsRepository.UpdateAsync(o);

                        }
                        await CalculateAndUpdateArrears(arearToUpdate, "pay");
                    }
                    Expression<Func<VoucherArrear, bool>> filterRemaingArrearsVoucher = x => x.VoucherArrearId.Equals(voucher.Id);
                    var remaingVouchersArrears = await _unitOfWork.VoucherArrearsRepository.GetAllAsync(filterRemaingArrearsVoucher);// AID 1 VID 2
                    foreach (var futureVoucherId in remaingVouchersArrears)
                    {
                        await CalculateAndUpdateArrears(futureVoucherId.VoucherId, "pay");
                    }

                }

                return true;

            }
            catch (Exception ex)
            {
                return false;
            }

        }

        private async Task<decimal> CalculateAndUpdateArrears(int voucherId, string status)
         {
            try
            {
                Expression<Func<Voucher, bool>> filterUpVoucherDetail = x => x.Id.Equals(voucherId);
                var tempvoucherDetail = await _unitOfWork.VoucherRepository.GetAllAsync(filterUpVoucherDetail);
                var voucherDetails = tempvoucherDetail.Where(x => x.IsCancelled == false).FirstOrDefault();

                Expression<Func<VoucherDetail, bool>> filterUpVoucher = x => x.VoucherId.Equals(voucherId);
                var feeDetails = await _unitOfWork.VoucherDetailRepository.GetAllAsync(filterUpVoucher);
                var arrearFees = feeDetails.Where(x => x.FeesType == "Arrears" && x.IsCancelled == false).FirstOrDefault();

                Expression<Func<VoucherArrear, bool>> filterUpArrearsVoucher = x => x.VoucherId.Equals(voucherId) && !x.IsPaid;
                var arrears = await _unitOfWork.VoucherArrearsRepository.GetAllAsync(filterUpArrearsVoucher);

                if (arrears.Count == 0)
                {
                    if (arrearFees != null)
                    {
                        Expression<Func<Voucher, bool>> filterUpVouchers = x => x.Id.Equals(arrearFees.VoucherId);
                        var VoucherDetails = await _unitOfWork.VoucherRepository.GetAllAsync(filterUpVouchers);

                        var tempVoucher = VoucherDetails.Where(x => x.Id == arrearFees.VoucherId && x.IsCancelled == false).FirstOrDefault();
                        tempVoucher.TotalAmount = tempVoucher.TotalAmount - arrearFees.DiscountAmount;
                        await _unitOfWork.VoucherRepository.UpdateAsync(tempVoucher);

                        arrearFees.DiscountAmount = 0;
                        arrearFees.FeesAmount = 0;
                        await _unitOfWork.VoucherDetailRepository.UpdateAsync(arrearFees);



                    }
                    return 0;
                }
                if (status == "pay" && arrears.Count > 0)
                {
                    foreach (var remianingArrears in arrears)
                    {
                        Expression<Func<Voucher, bool>> filterremianingArrears = x => x.Id.Equals(remianingArrears.VoucherId);
                        var VoucherDetail = await _unitOfWork.VoucherRepository.GetAllAsync(filterremianingArrears);

                        var tempVoucher = VoucherDetail.FirstOrDefault();
                        tempVoucher.TotalAmount = tempVoucher.TotalAmount - arrearFees.DiscountAmount;
                        await _unitOfWork.VoucherRepository.UpdateAsync(tempVoucher);

                        arrearFees.DiscountAmount = 0;
                        arrearFees.FeesAmount = 0;
                        await _unitOfWork.VoucherDetailRepository.UpdateAsync(arrearFees);


                        Expression<Func<Voucher, bool>> filterVoucher = x => x.Id.Equals(remianingArrears.VoucherArrearId);
                        var vouchers = await _unitOfWork.VoucherRepository.GetAllAsync(filterVoucher);

                        var sumOfArearAmount = vouchers.Where(x => x.Id != voucherId && x.StudentId == voucherDetails.StudentId && x.IsMonthly == true && x.IsCancelled == false).FirstOrDefault().TotalAmount;

                        tempVoucher.TotalAmount = tempVoucher.TotalAmount + sumOfArearAmount;
                        await _unitOfWork.VoucherRepository.UpdateAsync(tempVoucher);
                        if (arrearFees != null)
                        {
                            arrearFees.FeesAmount = sumOfArearAmount;
                            arrearFees.DiscountAmount = sumOfArearAmount;
                            await _unitOfWork.VoucherDetailRepository.UpdateAsync(arrearFees);
                        }
                    }
                    return 0;
                }
                if (status == "create")
                {
                    Expression<Func<Voucher, bool>> filterVoucher = x => arrears.Select(u => u.VoucherId).Contains(voucherId);
                    var vouchers = await _unitOfWork.VoucherRepository.GetAllAsync(filterVoucher);

                    var sumOfArearAmount = vouchers.Where(x => x.Id != voucherId && x.StudentId == voucherDetails.StudentId && x.IsMonthly == true && x.IsCancelled == false).OrderByDescending(u => u.Id).FirstOrDefault().TotalAmount;

                    if (arrearFees != null)
                    {
                        arrearFees.FeesAmount = sumOfArearAmount;
                        await _unitOfWork.VoucherDetailRepository.UpdateAsync(arrearFees);

                        return sumOfArearAmount;
                    }


                    VoucherDetail voucherDetail = new VoucherDetail()
                    {
                        VoucherId = voucherId,
                        FeesAmount = sumOfArearAmount,
                        DiscountType = "",
                        DiscountAmount = sumOfArearAmount,
                        FeesType = "Arrears",
                        DiscountValue = 0
                    };
                    await _unitOfWork.VoucherDetailRepository.AddAsync(voucherDetail);

                    return sumOfArearAmount;
                }
                return 0;
            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        public async Task<List<int>> ManualVouchersAsync(ManualVoucherRequestDto manualVoucherRequest)
        {
            try
            {
                List<int> voucherIds = new List<int>();

                foreach (var student in manualVoucherRequest.StudentDetails)
                {
                    Voucher vochure = new()
                    {
                        GradeId = manualVoucherRequest.GradeId,
                        GradeTitle = manualVoucherRequest.GradeTitle,
                        StudentId = student.Id,
                        StudentName = student.Name,
                        Rollno = student.RollNo,
                        IssueDate = DateTime.Now,
                        DueDate = manualVoucherRequest.DueDate,
                        FeesMonth = manualVoucherRequest.VoucherDate,
                        GeneratedBy = 1,
                        GeneratedOn = DateTime.Now,
                        Status = VoucherStatues.Unpaid,
                        VoucherNo = "",
                        IsPaid = false,
                        IsMonthly = false,
                        TotalAmount = manualVoucherRequest.Fee.TotalAmount
                    };

                    await _unitOfWork.VoucherRepository.AddAsync(vochure);

                    vochure.VoucherNo = vochure.Id.ToString("00000");

                    await _unitOfWork.VoucherRepository.UpdateAsync(vochure);


                    foreach (var fees in manualVoucherRequest.Fee.FeeDetails)
                    {

                        decimal total = 0;
                        var feeTypeFromDB = await _unitOfWork.FeeTypeRepository.GetByIdAsync(fees.FeeTypeId);
                        VoucherDetail voucherDetail = new VoucherDetail()
                        {
                            VoucherId = vochure.Id,
                            FeesAmount = fees.Amount,
                            DiscountType = fees.Discount.DiscountTypeId == 1 ? "Percentage" : "Net",
                            DiscountAmount = fees.Discount.DiscountTypeId == 1 ? (fees.Amount - (fees.Discount.Amount / 100) * fees.Amount) : (fees.Amount - fees.Discount.Amount),
                            FeesType = feeTypeFromDB.Title,
                            DiscountValue = (int)fees.Discount.Amount
                        };
                        await _unitOfWork.VoucherDetailRepository.AddAsync(voucherDetail);
                    }
                    voucherIds.Add(vochure.Id);
                }
                return voucherIds;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public async Task<VoucherDashboardStatsDto> GetVoucheDashboardStats()
        {
            VoucherDashboardStatsDto voucherDashboardStatsFromDb = await _unitOfWork.VoucherRepository.GetVoucheDashboardStats();
            return voucherDashboardStatsFromDb;
        }

        public async Task<bool> CancelVoucherbyIds(List<int> voucherIds)
        {
            try
            {
                Expression<Func<Voucher, bool>> filterVoucher = x => voucherIds.Contains(x.Id);
                var vouchers = await _unitOfWork.VoucherRepository.GetAllAsync(filterVoucher);


                foreach (var voucher in vouchers)
                {

                    Expression<Func<VoucherArrear, bool>> filterArrearsVoucher = x => x.VoucherId.Equals(voucher.Id);
                    var linkVouchers = await _unitOfWork.VoucherArrearsRepository.GetAllAsync(filterArrearsVoucher);// AID 1 VID 2

                    if (linkVouchers != null)
                        _unitOfWork.VoucherArrearsRepository.HardDeleteRange(linkVouchers);

                    var upVoucher = await _unitOfWork.VoucherRepository.GetByIdAsync(voucher.Id);
                    upVoucher.IsCancelled = true;
                    upVoucher.Status = VoucherStatues.Cancelled;
                    upVoucher.CancelledBy = _loggedInUser.Id;
                    upVoucher.CancelledOn = DateTime.Now;
                    await _unitOfWork.VoucherRepository.UpdateAsync(upVoucher);


                    Expression<Func<VoucherDetail, bool>> filterUpVoucher = x => x.VoucherId.Equals(voucher.Id);
                    var feeDetails = await _unitOfWork.VoucherDetailRepository.GetAllAsync(filterUpVoucher);

                    foreach (var feeDetail in feeDetails)
                    {
                        feeDetail.IsCancelled = true;
                        await _unitOfWork.VoucherDetailRepository.UpdateAsync(feeDetail);
                    }

                    var arearsToUpdate = linkVouchers.Where(x => x.IsPaid == false).Select(u => u.VoucherArrearId).ToList();
                    arearsToUpdate.Add(voucher.Id);

                    foreach (var arearToUpdate in arearsToUpdate)
                    {
                        await CalculateAndUpdateArrears(arearToUpdate, "pay");
                    }
                    Expression<Func<VoucherArrear, bool>> filterRemaingArrearsVoucher = x => x.VoucherArrearId.Equals(voucher.Id);
                    var remaingVouchersArrears = await _unitOfWork.VoucherArrearsRepository.GetAllAsync(filterRemaingArrearsVoucher);// AID 1 VID 2

                    if (remaingVouchersArrears != null)
                        _unitOfWork.VoucherArrearsRepository.HardDeleteRange(remaingVouchersArrears);

                    foreach (var futureVoucherId in remaingVouchersArrears)
                    {
                        await CalculateAndUpdateArrears(futureVoucherId.VoucherId, "pay");
                    }

                }

                return true;

            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }


}
