using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DAL_Project;

namespace LoveDev
{
    /// <summary>
    /// Takes in an Email address, checks database if that email is already used, and returns the url of the appropriate image to display
    /// </summary>
    public class EmailHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string email = context.Request.QueryString["email"];
            DAL myDal = new DAL();
            myDal.AddParam("email", email);
            string result = myDal.ExecuteScalar("spUsernameCheck"); //proc needed
            string imageUrl;
            if (result == "1")
            {
                imageUrl = "Images\\GrnChk.png";
            }
            else
            {
                imageUrl = "Images\\RedX.png";
            }
            context.Response.ContentType = "plain/text";

            context.Response.Write(imageUrl);
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