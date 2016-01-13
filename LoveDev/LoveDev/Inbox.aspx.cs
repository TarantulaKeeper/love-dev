﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LoveDevLib;
using System.Data;
using DAL_Project;
using System.Web.UI.HtmlControls;


namespace LoveDev
{
    public partial class Inbox : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Security.CurrentUser == null)
            {
                Response.Redirect("Index.aspx?message=Must be logged in to view that page");
            }
            else if (!Security.CurrentUser.IsActive)
            {
                Response.Redirect("Index.aspx?message=Check emails and verify account to view that page");
            }
            else
            {
                int userID = Security.CurrentUser.UserID;
                LoadUsers(userID);
            }

        }

        public void LoadUsers(int userID)
        {
            DAL myDAL = new DAL();
            DataSet ds = new DataSet();
            myDAL.AddParam("UserID", userID);
            ds = myDAL.ExecuteProcedure("spGetUsersForInbox");

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                ListItem user = new ListItem(Convert.ToString(row["FirstName"]), Convert.ToString(row["UserID"]));
                lstboxUsers.Items.Add(user);
            }          
        }

        protected void lstboxUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            string fromUserID = lstboxUsers.SelectedValue.ToString();
            string toUserID = Security.CurrentUser.UserID.ToString();

            // Getting the user information from SQL 

            User fromUser = UserManager.getUserByID(Convert.ToInt32(fromUserID));
            User toUser = UserManager.getUserByID(Convert.ToInt32(toUserID));

            // Getting messages

            DAL myDAL = new DAL();
            DataSet ds = new DataSet();
            myDAL.AddParam("FromUserID", fromUserID);
            myDAL.AddParam("ToUserID", toUserID);
            ds = myDAL.ExecuteProcedure("spGetMessages");

            int counter = 0;

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                
            }

            //foreach (DataRow row in ds.Tables[0].Rows)
            //{
            //    HtmlGenericControl messageDIV = new HtmlGenericControl("div");
            //    HtmlGenericControl dateDIV = new HtmlGenericControl("div");
            //    Image imgProfilePicture = new Image();

            //    messageDIV.ID = "messageDIV" + counter;
            //    dateDIV.ID = "dateDIV" + counter;
            //    imgProfilePicture.ID = "imgProfilePicture" + counter;

            //    messageDIV.InnerText = row["Message"].ToString();
            //    dateDIV.InnerText = row["DateSent"].ToString();

            //    if (row["FromUserID"].ToString() == fromUserID)
            //    {
            //        imgProfilePicture.ImageUrl = fromUser.UserPhoto;
            //    }

            //    else
            //    {
            //        imgProfilePicture.ImageUrl = toUser.UserPhoto;
            //    }

            //    divContainer.Controls.Add(messageDIV);
            //    divContainer.Controls.Add(dateDIV);
            //    divContainer.Controls.Add(imgProfilePicture);

            //    counter = counter + 1;
            //}
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            DAL myDAL = new DAL();
            string toUserID = lstboxUsers.SelectedValue;
            string message = txtboxReply.Value;

            myDAL.AddParam("ToUserID", toUserID);
            myDAL.AddParam("FromUserID", Security.CurrentUser.UserID);
            myDAL.AddParam("Message", message);
            myDAL.ExecuteNonQuery("spSendMessage");
            Response.Redirect("Inbox.aspx");            
        }
    }
}