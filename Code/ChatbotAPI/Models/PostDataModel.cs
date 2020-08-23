using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ChatbotAPI.Models
{
    public class PostDataModel
    {
        public string questionKey { get; set; }

        public string answerType { get; set; }

        public string answer { get; set; }
    }
}