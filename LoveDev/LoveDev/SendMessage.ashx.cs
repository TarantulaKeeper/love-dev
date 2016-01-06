﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DAL_Project;
using LoveDevLib;

namespace LoveDev
{
    /// <summary>
    /// Summary description for SendMessage
    /// </summary>
    public class SendMessage : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DAL myDAL = new DAL();
            context.Response.ContentType = "text/plain";
            myDAL.AddParam("FromUsername", Security.CurrentUser.UserID);
            myDAL.AddParam("ToUsername", context.Request.QueryString["toUserID"]);
            myDAL.AddParam("Message", context.Request.QueryString["Message"]);
            string result = myDAL.ExecuteScalar("spSendMessage");

            context.Response.Write(result);
            context.Response.End();
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