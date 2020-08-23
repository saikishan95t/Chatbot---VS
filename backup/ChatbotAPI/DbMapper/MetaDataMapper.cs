using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ChatbotAPI.DbMapper
{
    public class MetaDataMapper
    {
        public string conversationKey { get; set; }

        public int questionID { get; set; }

        public string questionType { get; set; }

        public string questionKey { get; set; }

        public string questionValue { get; set; }

        public int answerID { get; set; }

        public string answerType { get; set; }

        public string answerKey { get; set; }
        
        public string answerValue { get; set; }
    }
}
