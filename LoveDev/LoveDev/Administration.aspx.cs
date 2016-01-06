using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LoveDevLib;

namespace LoveDev
{
    public partial class Administration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Security.CurrentUser == null)
            {
                Response.Redirect("Index.aspx?message=Must be logged in to view that page");
            }
            else if (!Security.CurrentUser.IsActive)
            {
                if (!Security.CurrentUser.IsAdmin)
                {
                    Response.Redirect("Index.aspx?message=Must be an administrator to view that page");
                }
                Response.Redirect("Index.aspx?message=Check emails and verify account to view that page");
            }
        }
    }
}