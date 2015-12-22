using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DAL_Project;

namespace LoveDevLib
{
    static public class Security
    {
        //Properties
        static public User CurrentUser
        {
            get
            {
                User user = (User)System.Web.HttpContext.Current.Session["User"];
                if (System.Web.HttpContext.Current.Session["User"] != null)
                {
                    user = UserManager.getUserByID(user.UserID);
                    System.Web.HttpContext.Current.Session["User"] = user;
                }
                return user;
            }
        }

        //Methods
        static public bool Login(string Email, string Password)
        {
            User user = UserManager.getUser(Email, Password);
            if (user != null)
            {
                System.Web.HttpContext.Current.Session["User"] = user;
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
            System.Web.HttpContext.Current.Session.Abandon();
        }
    }
}
