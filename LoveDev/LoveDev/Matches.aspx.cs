using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;
using LoveDevLib;
using System.Data;

namespace LoveDev
{
    public partial class Matches : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["message"] != null)
                {
                    lblQS.Text = Request.QueryString["message"].ToString();
                }
                LoadMatches();
                hfUserLoggedIn.Value = Security.CurrentUser.UserID.ToString();
            }
            
        }

        public void LoadMatches()
        {
            DAL myDAL = new DAL();
            DataSet ds = new DataSet();
            myDAL.AddParam("UserID", Security.CurrentUser.UserID);
            ds = myDAL.ExecuteProcedure("spGetMatchesForThisUserID");

            dlMatches.DataSource = ds;
            dlMatches.DataBind();

        }
    }
}