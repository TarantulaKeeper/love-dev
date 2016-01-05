using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LoveDevLib;

namespace LoveDev
{
    public partial class Inbox : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Security.CurrentUser != null)
            {
                int userID = Security.CurrentUser.UserID;
            }
            
        }
    }
}