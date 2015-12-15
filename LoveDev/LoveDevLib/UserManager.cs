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
            if (ds.Tables[0] != null)
            {
                DataRow DR = ds.Tables[0].Rows[0];

                user = new User(int.Parse(DR["userID"].ToString()), DR["FirstName"].ToString(), DR["LastName"].ToString(), int.Parse(DR["Age"].ToString()), DR["City"].ToString(), DR["Country"].ToString(),
                    DR["Email"].ToString(), int.Parse(DR["GenderID"].ToString()), int.Parse(DR["SexualOrientationID"].ToString()), (bool)DR["IsAdmin"], (bool)DR["IsActive"]);
            }
            else
            {
                user = null;
            }
            return user;
        }

        static public void RegisterUser(string FirstName, string LastName, string Password, int Age, string City, string Country, string Email, int GenderID, int SexualOrientationID)
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
            d.AddParam("SexualOrientation", SexualOrientationID);
            d.ExecuteNonQuery("spRegisterNewUser");
        }
    }
}
