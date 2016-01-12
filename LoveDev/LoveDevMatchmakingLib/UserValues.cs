using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL_Project;
using System.Data;
using LoveDevLib;

namespace LoveDevMatchmakingLib
{
    public class UserValues : IComparable<UserValues>
    {
        public int UserID { get; set; }
        public List<int> ValuesList { get; set; }
        //public int GenderID { get; set; }
        public List<int> SexualPreferencesList { get; set; }

        static DAL dal;

        public UserValues(int UserID)
        {
            dal = new DAL();
            this.UserID = UserID;
            getValuesList(UserID);
            getSexualPreferencesList(UserID);           
        }

        private void getSexualPreferencesList(int UserID)
        {
            SexualPreferencesList = new List<int>();
            dal.AddParam("UserID", UserID);
            DataSet ds = dal.ExecuteProcedure("spGetSexualPreferences"); //proc needed
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                this.SexualPreferencesList.Add(int.Parse(dr["GenderID"].ToString()));
            }
        }
        private void getValuesList(int UserID)
        {
            ValuesList = new List<int>();
            dal.AddParam("UserID", UserID);
            DataSet ds = dal.ExecuteProcedure("spGetUserGeneralInterests");
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                this.ValuesList.Add(Convert.ToInt32(row["generalInterests"]));
            }
        }
        private static int CalculateValues(List<bool> valList)
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
            User user = UserManager.getUserByID(UserID);
            User otherUser = UserManager.getUserByID(other.UserID);
            List<bool> TrueFalseMatchList = new List<bool>();
            int Result = 0;
            int Count = 0;

            if (CheckGenderAndPreferenceCompatibility(otherUser.GenderID,this.SexualPreferencesList) && CheckGenderAndPreferenceCompatibility(user.GenderID,other.SexualPreferencesList))
            {
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
            }
            return Result;
        }

        public bool CheckGenderAndPreferenceCompatibility(int otherGender, List<int> preferences)
        {
            foreach (int num in preferences)
            {
                if (num == otherGender)
                {
                    return true;
                }
            }
            return false;
        }


    }
}
