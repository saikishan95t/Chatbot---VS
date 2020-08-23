using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ChatbotAPI.Models
{
    public class QuestionModel
    {
        public string QuestionType { get; set; }

        public string QuestionKey { get; set; }

        public string Question { get; set; }

        public List<AnswerModel> Answers { get; set; }
    }
}
