using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using ChatbotAPI.Models;
using ChatbotAPI.Repository;
using ChatbotAPI.Repository.Interface;

namespace ChatbotAPI.Controllers
{
    [RoutePrefix("api")]
    public class GetMetaDataController : ApiController
    {

        private readonly IGetMetaDataRepository metaDataRepository;

        public GetMetaDataController()
        {
            metaDataRepository = new GetMetaDataRepository();
        }

        [HttpGet]
        [Route("getMetaData")]
        public async Task<HttpResponseMessage> getMetaData(string ConversationType)
        {
            HttpRequestMessage request = Request;
            MetadataModel metaData = new MetadataModel();
            metaData = await metaDataRepository.getMetaData(ConversationType);
            return GlobalFunctions.CreateResponse<MetadataModel>(request,HttpStatusCode.OK, metaData);
        }
    }
}
