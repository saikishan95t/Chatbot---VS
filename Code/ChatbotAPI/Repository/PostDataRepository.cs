using ChatbotAPI.Models;
using ChatbotAPI.Repository.Interface;
using Dapper;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace ChatbotAPI.Repository
{
    public class PostDataRepository : IPostDataRepository
    {
        public async Task<int> postUserDetails(List<PostDataModel> userDetails)
        {
            int returnValue;
            DataTable user = GlobalFunctions.ToDataTable<PostDataModel>(userDetails);
            DynamicParameters param = new DynamicParameters();
            param.Add("@userDetails", user.AsTableValuedParameter("[usr].[UserDetails]"));
            param.Add(name: "@ReturnStatus", dbType: DbType.Int32, direction: ParameterDirection.Output);
            using (var connection = new SqlConnection(ConfigurationManager.ConnectionStrings["iPPiDatabase"].ConnectionString))
            {
                connection.Open();
                await connection.ExecuteAsync("usr.usp_PostUserDetails", param, commandType: CommandType.StoredProcedure);
                connection.Close();
                returnValue = param.Get<int>("@ReturnStatus"); ;
            }
            return returnValue;
        }

        public async Task<int> postMissingData(List<PostDataModel> missingData)
        {
            int returnValue;
            DataTable user = GlobalFunctions.ToDataTable<PostDataModel>(missingData);
            DynamicParameters param = new DynamicParameters();
            param.Add("@missingData", user.AsTableValuedParameter("[usr].[UserDetails]"));
            param.Add(name: "@ReturnStatus", dbType: DbType.Int32, direction: ParameterDirection.Output);
            using (var connection = new SqlConnection(ConfigurationManager.ConnectionStrings["iPPiDatabase"].ConnectionString))
            {
                connection.Open();
                await connection.ExecuteAsync("usr.usp_PostMissingData", param, commandType: CommandType.StoredProcedure);
                connection.Close();
                returnValue = param.Get<int>("@ReturnStatus"); ;
            }
            return returnValue;
        }

        public async Task<int> estimateProperty(List<PostDataModel> property)
        {
            int returnValue;
            DataTable user = GlobalFunctions.ToDataTable<PostDataModel>(property);
            DynamicParameters param = new DynamicParameters();
            param.Add("@propertyDetails", user.AsTableValuedParameter("[usr].[UserDetails]"));
            param.Add(name: "@EstimatedValue", dbType: DbType.Int32, direction: ParameterDirection.Output);
            using (var connection = new SqlConnection(ConfigurationManager.ConnectionStrings["iPPiDatabase"].ConnectionString))
            {
                connection.Open();
                await connection.ExecuteAsync("usr.usp_EstimatePropertyValue", param, commandType: CommandType.StoredProcedure);
                connection.Close();
                returnValue = param.Get<int>("@EstimatedValue"); ;
            }
            return returnValue;
        }

    }
}
