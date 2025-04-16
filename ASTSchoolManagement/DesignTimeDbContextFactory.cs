using ASTSM.Data.Context;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;
using System.IO;
using ASTSM;
public class DesignTimeDbContextFactory : IDesignTimeDbContextFactory<ASTSMDbContext>
{
    public ASTSMDbContext CreateDbContext(string[] args)
    {
        // Load configuration from appsettings.json
        IConfigurationRoot configuration = new ConfigurationBuilder()
            .SetBasePath(Directory.GetCurrentDirectory())
            .AddJsonFile("appsettings.json")
            .Build();

        // Get the connection string
        var connectionString = configuration.GetConnectionString("DefaultConnection");

        // Create DbContextOptionsBuilder and set SQL Server provider with connection string
        var optionsBuilder = new DbContextOptionsBuilder<ASTSMDbContext>();
        optionsBuilder.UseSqlServer(connectionString);

        return new ASTSMDbContext(optionsBuilder.Options);
    }
}
