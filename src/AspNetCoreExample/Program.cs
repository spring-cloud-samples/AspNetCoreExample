using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

namespace AspNetCoreExample
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateWebHostBuilder(args).Build().Run();
        }

        public static IWebHostBuilder CreateWebHostBuilder(string[] args)
        {
            var result = WebHost.CreateDefaultBuilder(args)
                  .UseStartup(Assembly.GetEntryAssembly().FullName);
            
            var port = Environment.GetEnvironmentVariable("PORT");

            if(!string.IsNullOrWhiteSpace(port))
            {
                result.UseUrls($"https://+:{ port }");
            }
            
            return result;
        }
    }
}
