using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;
using ASTSM.Data.Context;
using ASTSM.Data.Repositories.UnitOfWork;
using ASTSM.Utlis.AutoMapper;
using System.Collections.Generic;
using ASTSM.Middleware;
using NLog;
using System.IO;
using System;
using ASTSM.Service.LoggerManager;
using Microsoft.Extensions.FileProviders;
using Microsoft.AspNetCore.Http;
using ASTSM.Service.Employees;
using ASTSM.Service.Fees;
using ASTSM.Service.FeeTypes;
using ASTSM.Service.Grades;
using ASTSM.Service.Privileges;
using ASTSM.Service.RolePrivileges;
using ASTSM.Service.Roles;
using ASTSM.Service.StudentGrades;
using ASTSM.Service.Students;
using ASTSM.Service.DiscountFees;
using ASTSM.Service.DiscountTypes;
using ASTSM.Service.Users;
using Microsoft.Data.SqlClient;
using System.Data;
using ASTSM.Service.Vouchers;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using ASTSM.Service.Projects;

namespace ASTSM
{
    public class Startup
    {
        readonly string allowSpecificOrigins = "";

        public IConfiguration Configuration { get; }

        public Startup(IConfiguration configuration)
        {
            LogManager.LoadConfiguration(String.Concat(Directory.GetCurrentDirectory(), "/nlog.config"));
            Configuration = configuration;
        }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Configuration["Jwt:Key"]));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
            var Issuer = Configuration["Jwt:Issuer"] + "";
            var Audience = Configuration["Jwt:Audience"] + "";

            services.AddAuthentication("Basic");
            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
            .AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    ValidIssuer = Configuration["Jwt:Issuer"],
                    ValidAudience = Configuration["Jwt:Issuer"],
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Configuration["Jwt:Key"]))
                };
            });
            string connectionString = Configuration.GetConnectionString("DefaultConnection");
            


            services.AddDbContext<ASTSMDbContext>(options =>
            {
                if (!options.IsConfigured)
                {
                    var configuration = new ConfigurationBuilder()
                       .SetBasePath(Directory.GetCurrentDirectory())
                       .AddJsonFile("appsettings.json")
                       .Build();
                    options.UseSqlServer(connectionString);
                }
            });

            services.AddScoped<IDbConnection>(c =>
            {
                return new SqlConnection(connectionString);
            });


            services.AddHttpContextAccessor();
            services.AddSingleton<ILoggerManager, LoggerManager>();
            services.AddAutoMapper(typeof(MappingProfile));
            services.AddScoped<IUnitOfWork, UnitOfWork>();
            services.AddScoped<IVoucherService, VoucherService>();
            services.AddScoped<IRoleService, RoleService>();
            services.AddScoped<IPrivilegeService, PrivilegeService>();
            services.AddScoped<IRolePrivilegeService, RolePrivilegeService>();
            services.AddScoped<IDiscountService, DiscountService>();
            services.AddScoped<IDiscountTypeService, DiscountTypeService>();
            services.AddScoped<IEmployeeService, EmployeeService>();
            services.AddScoped<IFeeService, FeeService>();
            services.AddScoped<IFeeTypeService, FeeTypeService>();
            services.AddScoped<IGradeService, GradeService>();
            services.AddScoped<IStudentService, StudentService>();
            services.AddScoped<IStudentGradeService, StudentGradeService>();
            services.AddScoped<IStudentGradeService, StudentGradeService>();
            services.AddScoped<IUserService, UserService>();
            services.AddScoped<IProjectsService, ProjectsService>();
            services.AddScoped<UserSessionService>();
            

            services.AddCors(options =>
            {
                options.AddPolicy(allowSpecificOrigins,
                    builder => builder.AllowAnyOrigin()
                      .AllowAnyMethod()
                      .AllowAnyHeader()
                .Build());
            });

            services.AddControllersWithViews();
            services.AddSession();

            services.AddMvc();
            // Register the Swagger generator, defining 1 or more Swagger documents
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "Your API", Version = "v1" });
                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    Description = @"JWT Authorization header using the Bearer scheme.
                      Enter 'Bearer' [space] and then your token in the text input below.Example: 'Bearer 12345abcdef'",
                    Name = "Authorization",
                    In = ParameterLocation.Header,
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer"
                });
                c.AddSecurityRequirement(new OpenApiSecurityRequirement()
                  {
                    {
                      new OpenApiSecurityScheme
                      {
                        Reference = new OpenApiReference
                          {
                            Type = ReferenceType.SecurityScheme,
                            Id = "Bearer"
                          }
                        },
                        new List<string>()
                      }
                    });
            });

        }
      
        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, ILoggerManager logger)
        {
            app.UseDeveloperExceptionPage();

            app.UseHttpsRedirection();
            // Enable middleware to serve generated Swagger as a JSON endpoint
            app.UseSwagger();

            // Enable middleware to serve swagger-ui (HTML, JS, CSS, etc.), specifying the Swagger JSON endpoint
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "AST School Management V1");
            });
            //app.UseHttpsRedirection();
            //app.UseStaticFiles(new StaticFileOptions()
            //{
            //    FileProvider = new PhysicalFileProvider(Path.Combine(Directory.GetCurrentDirectory(), @"Uploads")),
            //    RequestPath = new PathString("/Uploads")
            //});
            app.UseRouting();
            app.UseCors(builder => builder.AllowAnyHeader().AllowAnyOrigin().AllowAnyMethod());

            app.UseAuthentication();
            app.UseAuthorization();
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapDefaultControllerRoute();
            });
            app.ConfigureExceptionHandler(logger);

            // Enable middleware to serve generated Swagger as a JSON endpoint.




            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
