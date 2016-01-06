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
                else if (!Security.CurrentUser.IsActive)
                {
                    Response.Redirect("Index.aspx?message=Check emails and verify account to view that page");
                }
            }
        }
    }
}