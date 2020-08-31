using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using ChatbotWeb.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;

namespace ChabotWeb.Controllers
{
    [ApiController]
    public class GetMetadataController : Controller
    {
        private readonly IConfiguration _configuration;

        public GetMetadataController(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        [HttpGet]
        [Route("api/getMetaData")]
        public async Task<IActionResult> getMetaData(string ConversationType)
        {
            string BaseUrl = _configuration.GetSection("ApiURL:baseURL").Value;
            string metaDataUrl = _configuration.GetSection("ApiURL:metaDataURL").Value + ConversationType;

            HttpClient client = new HttpClient();
            client.BaseAddress = new Uri(BaseUrl);
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));

            HttpResponseMessage response = await client.GetAsync(metaDataUrl);
            MetadataModel metadata = new MetadataModel();
            if (response.IsSuccessStatusCode)
            {
                string jsonString = await response.Content.ReadAsStringAsync();
                metadata = JsonConvert.DeserializeObject<MetadataModel>(jsonString);
            }
            return Json(metadata, new JsonSerializerSettings
            {
                Formatting = Formatting.Indented,
            });
        }
    }
}
