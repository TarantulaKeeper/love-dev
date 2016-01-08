using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL_Project;
using System.Data;

namespace LoveDevLib
{
    static public class UserManager
    {
        static public User getUser(string Email, string Password)
        {
            DAL d = new DAL();
            d.AddParam("Email", Email);
            d.AddParam("Password", Password);
            DataSet ds = d.ExecuteProcedure("spLogin"); 
            return UserFactory(ds);
        }
        static public User getUserByID(int userId)
        {
            DAL d = new DAL();
            d.AddParam("userID", userId);
            DataSet ds = d.ExecuteProcedure("spGetUserByID"); 
            return UserFactory(ds);
        }

        static private User UserFactory(DataSet ds)
        {
            User user;
            if (ds.Tables.Count > 0)
            {
                DataRow DR = ds.Tables[0].Rows[0];

                user = new User(int.Parse(DR["UserID"].ToString()), DR["FirstName"].ToString(), DR["LastName"].ToString(), int.Parse(DR["Age"].ToString()), DR["City"].ToString(), DR["Country"].ToString(),
                    DR["Email"].ToString(), (bool)DR["IsAdmin"], (bool)DR["IsActive"]);
            }
            else
            {
                user = null;
            }
            return user;
        }

        static public List<int> GetMatches(int UserID)
        {
            DAL d = new DAL();
            d.AddParam("UserID", UserID);
            DataSet ds = d.ExecuteProcedure("spGetUserIDMatches");
            int rowCount = ds.Tables[0].Rows.Count;
            List<int> MatchUserIDList = new List<int>();
            if (rowCount > 0)
            {
                for (int i = 0; i < rowCount; i++)
                {
                    MatchUserIDList.Add(int.Parse(ds.Tables[0].Rows[i]["OtherUserID"].ToString()));
                }
            }
            return MatchUserIDList;
        }

        static public void RegisterUser(string FirstName, string LastName, string Password, int Age, string City, string Country, string Email, int GenderID, List<int> Preferences, Guid g)
        {
            DAL d = new DAL();
            d.AddParam("FirstName", FirstName);
            d.AddParam("LastName", LastName);
            d.AddParam("Password", Password);
            d.AddParam("Age", Age);
            d.AddParam("City", City);
            d.AddParam("Country", Country);
            d.AddParam("Email", Email);
            d.AddParam("GenderID", GenderID);
            d.AddParam("Guid", g);
            int UserID = int.Parse(d.ExecuteScalar("spRegisterUser"));
            SendEmailVerification(Email, FirstName + " " + LastName, g);

            foreach (int num in Preferences)
            {
                AddSexualOrientation(UserID, num);
            }
        }
        static public void AddSexualOrientation(int UserID, int GenderID)
        {
            DAL d = new DAL();
            d.AddParam("UserID", UserID);
            d.AddParam("GenderID", GenderID);
            d.ExecuteNonQuery("spAddSexualOrientation");
        }

        static private void SendEmailVerification(string Email, string Name, Guid g)
        {
            SendMail.Send(Email, "Welcome " + Name + "!", "Please click the following link to complete your registration. Thank you for being a part of LoveDev and we hope you enjoy our services! \n"
                + "http://localhost:42384/Index.aspx?guid=" + g);
        }

        static public string VerifyUser(string g)
        {
            DAL d = new DAL();
            d.AddParam("Guid", g);
            string result = d.ExecuteScalar("spVerifyUser");
            if (result == "1")
            {
                return "Account Verified!";
            }
            else
            {
                return "Something went wrong, please try again.";
            }
        }
    }
}
