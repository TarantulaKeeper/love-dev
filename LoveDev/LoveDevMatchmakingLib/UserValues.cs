using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL_Project;
using System.Data;
namespace LoveDevMatchmakingLib
{
    class UserValues
    {
        public int UserGeneralInterestValue { get; set; }
        public int UserPersonalityValue { get; set; }

        static DAL dal;

        public UserValues(int UserID)
        {
            dal = new DAL();
            dal.AddParam("UserID", UserID);
            DataSet ds = dal.ExecuteProcedure("spGetUserGeneralInterests");
            this.UserGeneralInterestValue = (int)ds.Tables[0].Rows[0]["generalInterests"];
            dal.AddParam("UserID", UserID);
            DataSet dsTwo = dal.ExecuteProcedure("spGetUserPersonalityValue");
            this.UserPersonalityValue = (int)ds.Tables[0].Rows[0]["UserCategoryValue"];
        }
    }
}
