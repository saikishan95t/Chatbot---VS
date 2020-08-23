using ChatbotAPI.Models;
using ChatbotAPI.Repository;
using ChatbotAPI.Repository.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace ChatbotAPI.Controllers
{
    [RoutePrefix("api")]
    public class PostDataController : ApiController
    {

        private readonly IPostDataRepository postDataRepository;

        public PostDataController()
        {
            postDataRepository = new PostDataRepository();
        }

        [HttpPost]
        [Route("userDetails")]
        public async Task<HttpResponseMessage> postUserDetails(List<PostDataModel> userDetails)
        {
            HttpRequestMessage request = Request;
            int returnValue = await postDataRepository.postUserDetails(userDetails);
            if (returnValue == 0)
                return GlobalFunctions.CreateResponse<MetadataModel>(request, HttpStatusCode.OK, null);
            else
                return GlobalFunctions.CreateResponse<MetadataModel>(request, HttpStatusCode.InternalServerError, null);
        }

        [HttpPost]
        [Route("missingData")]
        public async Task<HttpResponseMessage> postMissingData(List<PostDataModel> missingData)
        {
            HttpRequestMessage request = Request;
            int returnValue = await postDataRepository.postMissingData(missingData);
            if (returnValue == 0)
                return GlobalFunctions.CreateResponse<MetadataModel>(request, HttpStatusCode.OK, null);
            else
                return GlobalFunctions.CreateResponse<MetadataModel>(request, HttpStatusCode.InternalServerError, null);
        }

        [HttpPost]
        [Route("valuation")]
        public async Task<HttpResponseMessage> estimateValue(List<PostDataModel> property)
        {
            HttpRequestMessage request = Request;
            PropertyValueModel value = new PropertyValueModel();
            int returnValue = await postDataRepository.estimateProperty(property);
            value.Value = returnValue;
            return GlobalFunctions.CreateResponse<PropertyValueModel>(request, HttpStatusCode.OK, value);
        }
    }
}
