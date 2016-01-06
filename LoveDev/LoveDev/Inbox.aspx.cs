using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LoveDevLib;
using System.Data;
using DAL_Project;


namespace LoveDev
{
    public partial class Inbox : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Security.CurrentUser != null)
            {
                int userID = Security.CurrentUser.UserID;
                LoadUsers(userID);
            }

            else
            {
                Response.Redirect("Home.aspx");
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

        }
    }
}