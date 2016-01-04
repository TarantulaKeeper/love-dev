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
        public List<int> UserGeneralInterestValue { get; set; }
        public int UserPersonalityValue { get; set; }


        static DAL dal;

        public UserValues(int UserID)
        {
            dal = new DAL();
            dal.AddParam("UserID", UserID);
            DataSet ds = dal.ExecuteProcedure("spGetUserGeneralInterests");
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                this.UserGeneralInterestValue.Add(Convert.ToInt32(row));
            }
            dal.AddParam("UserID", UserID);
            DataSet dsTwo = dal.ExecuteProcedure("spGetUserPersonalityValue");
            this.UserPersonalityValue = (int)ds.Tables[0].Rows[0]["UserCategoryValue"];
        }
    }
}
