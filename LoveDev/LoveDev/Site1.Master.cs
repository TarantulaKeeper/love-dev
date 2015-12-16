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

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            bool success = Security.Login(txtEmail.Text, txtPassword.Text);
            if (success)
            {
                Response.Redirect("Home.aspx?message=Login Successful!");
            }
            else
            {
                lblError.Text = "Invalid login, please try again.";
            }
        }
    }
}