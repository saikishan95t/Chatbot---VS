using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using ChabotWeb.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;

namespace ChabotWeb.Controllers
{
    [ApiController]
    public class PostDataController : Controller
    {
        private readonly IConfiguration _configuration;

        public PostDataController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [HttpPost]
        [Route("api/userDetails")]
        public async Task<HttpResponseMessage> postUserDetails(List<PostDataModel> userDetails)
        {
            string BaseUrl = _configuration.GetSection("ApiURL:baseURL").Value;
            string postUserURL = _configuration.GetSection("ApiURL:userDetailsURL").Value; ;

            HttpClient client = new HttpClient();
            client.BaseAddress = new Uri(BaseUrl);
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
            var content = new StringContent(JsonConvert.SerializeObject(userDetails), Encoding.UTF8, "application/json");
            HttpResponseMessage response = await client.PostAsync(postUserURL, content);
            if (response.IsSuccessStatusCode)
            {

            }
            return response;
        }

        [Route("api/missingData")]
        public async Task<HttpResponseMessage> postMissingData(List<PostDataModel> userDetails)
        {
            string BaseUrl = _configuration.GetSection("ApiURL:baseURL").Value;
            string postUserURL = _configuration.GetSection("ApiURL:missingDataURL").Value; ;

            HttpClient client = new HttpClient();
            client.BaseAddress = new Uri(BaseUrl);
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
            var content = new StringContent(JsonConvert.SerializeObject(userDetails), Encoding.UTF8, "application/json");
            HttpResponseMessage response = await client.PostAsync(postUserURL, content);
            if (response.IsSuccessStatusCode)
            {

            }
            return response;
        }

        [Route("api/valuation")]
        public async Task<IActionResult> estimateValue(List<PostDataModel> property)
        {
            string BaseUrl = _configuration.GetSection("ApiURL:baseURL").Value;
            string postUserURL = _configuration.GetSection("ApiURL:valuationURL").Value; ;

            HttpClient client = new HttpClient();
            client.BaseAddress = new Uri(BaseUrl);
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
            var content = new StringContent(JsonConvert.SerializeObject(property), Encoding.UTF8, "application/json");
            HttpResponseMessage response = await client.PostAsync(postUserURL, content);
            PropertyValueModel value = new PropertyValueModel();
            if (response.IsSuccessStatusCode)
            {
                string jsonString = await response.Content.ReadAsStringAsync();
                value = JsonConvert.DeserializeObject<PropertyValueModel>(jsonString);
            }
            return Json(value, new JsonSerializerSettings
            {
                Formatting = Formatting.Indented,
            });
        }

        [Route("api/userQuery")]
        public async Task<HttpResponseMessage> postUserQuery(List<PostDataModel> query)
        {
            string BaseUrl = _configuration.GetSection("ApiURL:baseURL").Value;
            string postUserURL = _configuration.GetSection("ApiURL:userQueryURL").Value; ;

            HttpClient client = new HttpClient();
            client.BaseAddress = new Uri(BaseUrl);
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
            var content = new StringContent(JsonConvert.SerializeObject(query), Encoding.UTF8, "application/json");
            HttpResponseMessage response = await client.PostAsync(postUserURL, content);
            if (response.IsSuccessStatusCode)
            {

            }
            return response;
        }

        [Route("api/feedback")]
        public async Task<HttpResponseMessage> postFeedback(List<PostDataModel> feedback)
        {
            string BaseUrl = _configuration.GetSection("ApiURL:baseURL").Value;
            string postUserURL = _configuration.GetSection("ApiURL:feedbackURL").Value; ;

            HttpClient client = new HttpClient();
            client.BaseAddress = new Uri(BaseUrl);
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
            var content = new StringContent(JsonConvert.SerializeObject(feedback), Encoding.UTF8, "application/json");
            HttpResponseMessage response = await client.PostAsync(postUserURL, content);
            if (response.IsSuccessStatusCode)
            {

            }
            return response;
        }

    }
}
