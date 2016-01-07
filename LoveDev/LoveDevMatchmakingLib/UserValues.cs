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
        public List<int> ValuesList { get; set; }
        public int GenderID { get; set; }
        public List<int> SexualPreferencesList { get; set; }

        static DAL dal;

        public UserValues(int UserID)
        {
            ValuesList = new List<int>();
            SexualPreferencesList = new List<int>();

            this.UserID = UserID;
            dal = new DAL();
            dal.AddParam("UserID", UserID);
            DataSet ds = dal.ExecuteProcedure("spGetUserGeneralInterests");
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                this.ValuesList.Add(Convert.ToInt32(row["generalInterests"]));
            }
        }
        public static int CalculateValues(List<bool> valList)
        {
            int count = 0;
            for (int i = 0; i < valList.Count; i++)
            {
                if (valList[i] == true)
                    count++;
            }
            return count;
        }
        public int CompareTo(UserValues other)
        {
            List<bool> TrueFalseMatchList = new List<bool>();
            int Result = 0;
            int Count = 0;
            foreach (int value in this.ValuesList)
            {
                if (value > other.ValuesList[Count])
                {
                    if (value > other.ValuesList[Count] + 5)
                    {
                        Result = 0;
                    }
                    else
                    {
                        Result = 1;
                    }

                }
                else if (value < other.ValuesList[Count])
                {
                    if (value < other.ValuesList[Count] - 5)
                    {
                        Result = 0;
                    }
                    else
                    {
                        Result = 1;
                    }
                }
                else
                {
                    Result = 1;
                }
                if (Result == 1)
                {
                    TrueFalseMatchList.Add(true);
                }
                else
                {
                    TrueFalseMatchList.Add(false);
                }
                Count++;
            }
            if (CalculateValues(TrueFalseMatchList) >= 3)
            {
                Result = 1;
            }
            else
            {
                Result = 0;
            }
            return Result;
        }
    }
}
