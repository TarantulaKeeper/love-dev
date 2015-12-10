using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Data;
using DAL_Project;

namespace LoveDevLib
{
    static public class Security
    {
        static public User CurrentUser
        {
            get
            {
                User user = (User)HttpContext.Current.Session["User"];
                if (HttpContext.Current.Session["User"] != null)
                {
                    user = getUserByID(user.UserID);
                    HttpContext.Current.Session["User"] = user;
                }
                return user;
            }
        }
        static public bool Login(string Email, string Password)
        {
            User user = getUser(Email, Password);
            if (user != null)
            {
                HttpContext.Current.Session["User"] = user;
                return true;
            }
            else
            {
                //This does an insert into a failed login table in the database
                //DAL d = new DAL();
                //d.AddParam("Email", Email);
                //d.AddParam("password", Password);
                //d.ExecuteNonQuery("spAddFailedLogin");
                return false;
            }
        }
        static public void Logout()
        {
            HttpContext.Current.Session.Abandon();
        }

        static public void RegisterUser(string FirstName, string LastName, int Age, string City, string Country, string Email, int GenderID, int SexualOrientationID, bool IsActive)
        {
            DAL d = new DAL();
            d.AddParam("FirstName", FirstName);
            d.AddParam("LastName", LastName);
            d.AddParam("Age", Age);
            d.AddParam("City", City);
            d.AddParam("Country", Country);
            d.AddParam("Email", Email);
            d.AddParam("GenderID", GenderID);
            d.AddParam("SexualOrientation", SexualOrientationID);
            d.AddParam("IsActive", IsActive);
            d.ExecuteNonQuery("spRegisterNewUser");
        }

        static private User getUser(string Email, string Password)
        {
            DAL d = new DAL();
            d.AddParam("Email", Email);
            d.AddParam("Password", Password);
            DataSet ds = d.ExecuteProcedure("spLogin");
            return UserFactory(ds);
        }
        static private User getUserByID(int userId)
        {
            DAL d = new DAL();
            d.AddParam("userID", userId);
            DataSet ds = d.ExecuteProcedure("spGetUserById");
            return UserFactory(ds);
        }

        static private User UserFactory(DataSet ds)
        {
            DataRow DR = ds.Tables[0].Rows[0];
            return new User(DR["FirstName"].ToString(), DR["LastName"].ToString(), int.Parse(DR["Age"].ToString()), DR["City"].ToString(), DR["Country"].ToString(), DR["Email"].ToString(), int.Parse(DR["GenderID"].ToString()), int.Parse(DR["SexualOrientationID"].ToString()), (bool)DR["IsAdmin"], (bool)DR["IsActive"]);
        }
    }
}
