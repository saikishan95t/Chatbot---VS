using ChatbotAPI.Models;
using ChatbotAPI.Repository.Interface;
using System.Threading;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ChatbotAPI.DbMapper;
using Dapper;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using Microsoft.Extensions.Configuration;

namespace ChatbotAPI.Repository
{

    public class GetMetaDataRepository: IGetMetaDataRepository
    {

        public async Task<MetadataModel> getMetaData(string ConversationType)      
        {
            MetadataModel metaData = new MetadataModel();
            List<MetaDataMapper> metaDataMapper;

            using (var connection = new SqlConnection(ConfigurationManager.ConnectionStrings["iPPiDatabase"].ConnectionString))
            {
                connection.Open();
                metaDataMapper = connection.Query<MetaDataMapper>("meta.usp_GetMetaData", new { ConversationType }, commandType: CommandType.StoredProcedure).ToList();
                connection.Close();

                Dictionary<int, QuestionModel> queDict = new Dictionary<int, QuestionModel>();
                metaData.Questions = new List<QuestionModel>();
                QuestionModel question = new QuestionModel();
                AnswerModel answer = new AnswerModel();
                foreach (MetaDataMapper meta in metaDataMapper)
                {
                    metaData.ConversationType = meta.conversationKey;
                    if (!queDict.ContainsKey(meta.questionID))
                    {
                        if(question.Question != null)
                            metaData.Questions.Add(question);
                        question = new QuestionModel();
                        question.QuestionType = meta.questionType;
                        question.QuestionKey = meta.questionKey;
                        question.Question = meta.questionValue;
                        question.Answers = new List<AnswerModel>();
                        queDict.Add(meta.questionID, question);
                    }
                    answer = new AnswerModel();
                    answer.AnswerType = meta.answerType;
                    answer.AnswerKey = meta.answerKey;
                    answer.Answer = meta.answerValue;
                    question.Answers.Add(answer);
                }
                metaData.Questions.Add(question);
            }
            return metaData;
        }
    }
}
