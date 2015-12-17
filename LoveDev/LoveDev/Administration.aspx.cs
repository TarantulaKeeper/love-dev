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
            if (Security.CurrentUser == null || !Security.CurrentUser.IsAdmin)
            {
                Response.Redirect("Index.aspx?Must be logged in to view that page");
            }
        }
    }
}