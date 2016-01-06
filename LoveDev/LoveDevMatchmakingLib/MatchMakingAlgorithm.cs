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
    public class MatchMakingAlgorithm
    {
        private UserValues UserValues { get; set; }
        private List<UserValues> MatchedUserGeneralInterestValue { get; set; }
        private List<int> Matches { get; set; }

        static DAL dal;

        public MatchMakingAlgorithm(int UserID)
        {
            this.UserValues = new UserValues(UserID);
            Matches = new List<int>();
            MatchedUserGeneralInterestValue = GetAllUsersValues(UserID);
            dal = new DAL();
        }

        public void CalculateAndSaveMatches()
        {
            foreach (UserValues u in MatchedUserGeneralInterestValue)
            {
                if (u.CompareTo(this.UserValues) == 1)
                {
                    Matches.Add(u.UserID);
                }
            }
            foreach (int m in Matches)
            {
                dal.AddParam("UserID", UserValues.UserID);
                dal.AddParam("OtherUserID", m);
                dal.ExecuteNonQuery("spSaveMatch"); 

            }
        }

        static private List<UserValues> GetAllUsersValues(int UserID)
        {
            dal = new DAL();
            dal.AddParam("UserID", UserID);
            DataSet ds = dal.ExecuteProcedure("spGetAllUsersForMatching");
            List<UserValues> UVList = new List<UserValues>();
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                UVList.Add(new UserValues(int.Parse(row["UserID"].ToString())));
            }
            return UVList;
        }
        // Personality :
        // 10 point difference available between both users. If not users will not be matched.
        //NIKOS PERSONAL OPINOIN:
        //We should add a *5* point leeway in general interests where we could add a "Light match"

    }
}
