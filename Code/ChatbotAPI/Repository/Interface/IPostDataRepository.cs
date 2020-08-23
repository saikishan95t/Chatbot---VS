using ChatbotAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChatbotAPI.Repository.Interface
{
    public interface IPostDataRepository
    {
        Task<int> postUserDetails(List<PostDataModel> userDetails);
        Task<int> postMissingData(List<PostDataModel> missingData);
        Task<int> estimateProperty(List<PostDataModel> property);
    }
}
