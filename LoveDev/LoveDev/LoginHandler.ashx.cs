using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LoveDevLib;

namespace LoveDev
{
    /// <summary>
    /// Summary description for LoginHandler
    /// </summary>
    public class LoginHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string email = context.Request.QueryString["Email"];
            string password = context.Request.QueryString["Password"];

            bool success = Security.Login(email,password);
            if (success)
            {
                context.Response.Write("Login Successful!");
            }
            else
            {
                context.Response.Write("Invalid Login");
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}