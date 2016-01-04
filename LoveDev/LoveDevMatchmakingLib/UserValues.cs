using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL_Project;
using System.Data;
namespace LoveDevMatchmakingLib
{
  public class UserValues : IComparable<UserValues>
    {
        public int UserID { get; set; }
        public List<int> UserGeneralInterestValue { get; set; }
        public int UserPersonalityValue { get; set; }


        static DAL dal;

        public UserValues(int UserID)
        {
            this.UserID = UserID;
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

        public int CompareTo(UserValues other)
        {
            List<bool> TrueFalseMatchList = new List<bool>();
            int Result = 0;
            int Count = 0;
            foreach (int value in this.UserGeneralInterestValue)
            {
                if (value > other.UserGeneralInterestValue[Count])
                {
                    if(value > other.UserGeneralInterestValue[Count] + 5)
                    {
                        Result = 0;
                    }
                    else
                    {
                        Result = 1;
                    }

                }
                else if(value < other.UserGeneralInterestValue[Count])
                {
                    if(value < other.UserGeneralInterestValue[Count] - 5)
                    {
                        Result = 0;
                    }
                    else
                    {
                        Result = 1;
                    }
                }
                if (Result == 1)
                {
                    TrueFalseMatchList.Add(true);
                }
                else
                {
                    TrueFalseMatchList.Add(false);
                }
            }
            if (TrueFalseMatchList.Count(true) > 3)
            {

            }
        }
    }
}
