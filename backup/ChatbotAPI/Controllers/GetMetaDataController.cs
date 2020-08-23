using System;
using System.Configuration;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using ChatbotAPI.Models;
using ChatbotAPI.Repository;
using ChatbotAPI.Repository.Interface;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.WebApiCompatShim;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;

namespace ChatbotAPI.Controllers
{
    [ApiController]
    public class GetMetaDataController : Controller
    {

        private readonly IGetMetaDataRepository metaDataRepository;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public GetMetaDataController(IConfiguration configuration, IHttpContextAccessor httpContextAccessor)
        {
            metaDataRepository = new GetMetaDataRepository(configuration);
            _httpContextAccessor = httpContextAccessor;
        }

        [HttpGet]
        [Route("api/getMetaData")]
        public async Task<HttpResponseMessage> getMetaData(string ConversationType)
        {
            var context = _httpContextAccessor.HttpContext;
            HttpRequestMessageFeature hreqmf = new HttpRequestMessageFeature(context);
            HttpRequestMessage request = hreqmf.HttpRequestMessage;

            MetadataModel metaData = new MetadataModel();
            metaData = await metaDataRepository.getMetaData(ConversationType);
            return GlobalFunctions.CreateResponse<MetadataModel>(request,HttpStatusCode.OK, metaData); ;
        }
    }
}
