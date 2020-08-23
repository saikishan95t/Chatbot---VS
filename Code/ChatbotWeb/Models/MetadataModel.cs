using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ChatbotWeb.Models
{
    public class MetadataModel
    {
        public string ConversationType { get; set; }

        public List<QuestionModel> Questions { get; set; }
    }
}
