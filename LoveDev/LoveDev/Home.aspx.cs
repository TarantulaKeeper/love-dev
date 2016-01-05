using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LoveDevLib;

namespace LoveDev
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Security.CurrentUser == null)
                {
                    Response.Redirect("Index.aspx?message=Must be logged in to view that page");
                }
            }
        }

        protected void btnMailMessage_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inbox.aspx");
        }
    }
}