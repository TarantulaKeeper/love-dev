using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LoveDevLib;

namespace LoveDev
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Security.CurrentUser != null)
            {
                
                SetLinksVisible(true);
            }
            else
            {
                SetLinksVisible(false);
            }
        }

        private void SetLinksVisible(bool b)
        {
            btnSignIn.Visible = !b;
            lnkHome.Visible = b;
            lnkUserProfile.Visible = b;
            btnSignOut.Visible = b;
            if (b && Security.CurrentUser.IsAdmin)
            {
                lnkAdministration.Visible = true;
            }
            else
            {
                lnkAdministration.Visible = false;
            }
        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            Security.Logout();
            Response.Redirect("Index.aspx");
            
        }
    }
}