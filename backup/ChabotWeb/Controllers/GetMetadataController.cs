using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ChabotWeb.Controllers
{
    [ApiController]
    public class GetMetadataController : Controller
    {
        [HttpGet]
        [Route("api/getMetaData")]
        public async Task<HttpResponseMessage> getMetaData(string ConversationType)
        {
            string BaseUrl = "https://localhost:44398";
            string metaDataUrl = "/api/getMetaData?ConversationType=" + ConversationType;

            HttpClient client = new HttpClient();
            client.BaseAddress = new Uri(BaseUrl);
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));

            HttpResponseMessage response = await client.GetAsync(metaDataUrl);
            if (response.IsSuccessStatusCode)
            {
                
            }
            return response;
        }
    }
}
