using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL_Project;
using System.Data;

namespace LoveDevMatchmakingLib
{
    public static class UsersToMatch
    {
        static public DAL dal;

        static public List<UserValues> GetAllUsers()
        {
            dal = new DAL();
            dal.AddParam("UserID", 1); //Security.CurrentUser.UserID);
            DataSet ds = dal.ExecuteProcedure("spGetAllUsersForMatching"); 
            List<UserValues> UVList = new List<UserValues>();
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                UVList.Add(new UserValues(int.Parse(row["UserID"].ToString())));
            }
            return UVList;
        }
    }
}
