using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace ChatbotAPI
{
    public class Startup
    {
        private readonly IConfiguration _configuration;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public Startup(IConfiguration configuration, IHttpContextAccessor httpContextAccessor, IServiceProvider service)
        {
            _configuration = configuration;
            _httpContextAccessor = httpContextAccessor;
            var hostingEnv = service.GetService<IHttpContextAccessor>();
        }

        public IConfiguration Configuration { get; }
        public IHttpContextAccessor HttpContext { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();
            //services.AddHttpContextAccessor();
            services.AddSingleton<Microsoft.AspNetCore.Http.IHttpContextAccessor, Microsoft.AspNetCore.Http.HttpContextAccessor>();
            //services.TryAddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            var sp = services.BuildServiceProvider();

            // This will succeed.
            var httpContextService = sp.GetService<IHttpContextAccessor>();
            // This will fail (return null), as IBarService hasn't been registered yet.
            var barService = sp.GetService<IHttpContextAccessor>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            var serviceProvider = app.ApplicationServices;
            var hostingEnv = serviceProvider.GetService<IHttpContextAccessor>();

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
