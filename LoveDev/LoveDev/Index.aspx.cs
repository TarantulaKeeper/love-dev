using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LoveDevLib;
using DAL_Project;

namespace LoveDev
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Security.CurrentUser != null)
                {
                    Response.Redirect("Home.aspx?message=Already Logged In");
                }
                loadGenders(ddlGender);
                loadGenders(cblOrientation);
            }
            if (Request.QueryString["guid"] != null)
            {
                lblQS.Text = UserManager.VerifyUser(Request.QueryString["guid"]);
            }
            if (Request.QueryString["message"] != null)
            {
                lblQS.Text = Request.QueryString["message"];
            }
        }
        public void loadGenders(ListControl l)
        {
            DAL d = new DAL();
            l.DataSource = d.ExecuteProcedure("spGetGenders");
            l.DataTextField = "GenderName";
            l.DataValueField = "GenderId";
            l.DataBind();
            if (l is DropDownList)
            {
                l.Items.Insert(0, new ListItem("Select a Gender...", "-1"));
            }
        }
        private void loadSexualOrientations() //currently discontinued
        {
            DAL d = new DAL();
            cblOrientation.DataSource = d.ExecuteProcedure("spGetGenders");
            cblOrientation.DataTextField = "SexualOrientationName";
            cblOrientation.DataValueField = "SexualOrientationId";
            cblOrientation.DataBind();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Guid g = Guid.NewGuid();
            List<int> Preferences = new List<int>();
            foreach(ListItem item in cblOrientation.Items)
            {
                if (item.Selected)
                {
                    Preferences.Add(int.Parse(item.Value));
                }
            }
            lblError.Text = "Registration Successful! Please check your emails to verify account.";
            UserManager.RegisterUser(txtFirstName.Text, txtLastName.Text, txtPassword.Text, int.Parse(txtAge.Text), txtCity.Text, txtCountry.Text, txtEmail.Text, int.Parse(ddlGender.SelectedValue),Preferences, g);
        }

        protected void btnContinue_register_Click(object sender, EventArgs e)
        {
            pnlWelcome.Visible = false;
            pnlRegistration_cont.Visible = true;
        }
    }
}