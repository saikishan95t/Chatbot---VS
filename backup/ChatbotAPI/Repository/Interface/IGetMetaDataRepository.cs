using ChatbotAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ChatbotAPI.Repository.Interface
{
    public interface IGetMetaDataRepository
    {
        Task<MetadataModel> getMetaData(string ConversationType);
    }
}
