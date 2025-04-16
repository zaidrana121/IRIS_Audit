using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Options;
using System.IO;
using System.Net;

namespace ASTSM
{
    public class Program
    {
        public static void Main(string[] args)
        {

           

            CreateHostBuilder(args)

            .Build()            
                .Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();//.UseKestrel(options => options.Listen(IPAddress.Loopback, 8889));
                });
    }
}
