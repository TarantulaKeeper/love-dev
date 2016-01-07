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

                loadGenders();
                loadSexualOrientations();
            }
            if (Request.QueryString["guid"] != null)
            {
                lblError.Text = UserManager.VerifyUser(Request.QueryString["guid"]);
            }
            if (Request.QueryString["message"] != null)
            {
                lblError.Text = Request.QueryString["message"];
            }

        }

        public void loadGenders()
        {
            DAL d = new DAL();
            ddlGender.DataSource = d.ExecuteProcedure("spGetGenders");
            ddlGender.DataTextField = "GenderName";
            ddlGender.DataValueField = "GenderId";
            ddlGender.DataBind();
            ddlGender.Items.Insert(0, new ListItem("Select a Gender...", "-1"));
        }
        private void loadSexualOrientations()
        {
            DAL d = new DAL();
            cblOrientation.DataSource = d.ExecuteProcedure("spGetSexualOrientations");
            cblOrientation.DataTextField = "SexualOrientationName";
            cblOrientation.DataValueField = "SexualOrientationId";
            cblOrientation.DataBind();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Guid g = Guid.NewGuid();
            lblError.Text = "Registration Successful! Please check your emails to verify account.";
            UserManager.RegisterUser(txtFirstName.Text, txtLastName.Text, txtPassword.Text, int.Parse(txtAge.Text), txtCity.Text, txtCountry.Text, txtEmail.Text, int.Parse(ddlGender.SelectedValue), int.Parse(cblOrientation.SelectedValue), g);
        }

        protected void btnContinue_register_Click(object sender, EventArgs e)
        {
            pnlWelcome.Visible = false;
            pnlRegistration_cont.Visible = true;
        }
    }
}