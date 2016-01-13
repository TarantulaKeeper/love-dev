using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LoveDevLib;
using DAL_Project;
using System.Data;

namespace LoveDevLib
{
    class ConversationManager
    {
        public static List<Message> Converstion { get; set; }

        public static List<Message> GetConversation(int toUserID, int fromUserID)
        {
            DAL myDAL = new DAL();
            myDAL.AddParam("ToUserID", toUserID);
            myDAL.AddParam("FromUserID", fromUserID);
            DataSet ds = myDAL.ExecuteProcedure("spGetMessages");            

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                Message message = new Message(Convert.ToInt32(row["ToUserID"]), 
                    Convert.ToInt32(row["FromUserID"]), row["ToFirstName"].ToString(), 
                    row["FromFirstName"].ToString(), row["DateSent"].ToString(), 
                    row["Message"].ToString());
                
                
            }

        }
    }
}
