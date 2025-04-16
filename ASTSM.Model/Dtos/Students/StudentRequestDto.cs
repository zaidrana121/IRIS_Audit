namespace ASTSM.Model.Dtos.Students
{
	public class StudentRequestDto
	{
		public StudentRequestDto() {
			Student = new();
			StudentDiscountDetails = new();
		}
		public int GradeId { get; set; }
		public List<int> FeeTypeIds { get; set; }
		public StudentDto Student { get; set; }
		public List<StudentDiscountDetailDto> StudentDiscountDetails { get; set; }
    }
}
