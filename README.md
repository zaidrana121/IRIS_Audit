# ASTSchoolManagement-API

For updaing Models in API Project you need to run this command **ASTSM.Data** Project.

dotnet ef dbcontext scaffold "Data Source=DESKTOP-D218VQB\MSSQLSERVER01;Initial Catalog=ASTSchoolManagement_Prod;uid=sa;pwd=123;TrustServerCertificate=True;" Microsoft.EntityFrameworkCore.SqlServer -o DbModels -f
