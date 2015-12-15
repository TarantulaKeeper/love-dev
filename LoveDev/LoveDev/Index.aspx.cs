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
                loadGenders();
                loadSexualOrientations();
            }
        }

        public void loadGenders()
        {
            DAL d = new DAL();
            ddlGender.DataSource = d.ExecuteProcedure("spGetGenders");
            ddlGender.DataTextField = "GenderName";
            ddlGender.DataValueField = "GenderId";
            ddlGender.DataBind();
        }
        private void loadSexualOrientations()
        {
            DAL d = new DAL();
            ddlOrientation.DataSource = d.ExecuteProcedure("spGetSexualOrientations");
            ddlOrientation.DataTextField = "SexualOrientationName";
            ddlOrientation.DataValueField = "SexualOrientationId";
            ddlOrientation.DataBind();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            UserManager.RegisterUser(txtFirstName.Text, txtLastName.Text, txtPassword.Text, int.Parse(txtAge.Text), txtCity.Text, txtCountry.Text, txtEmail.Text, int.Parse(ddlGender.SelectedValue), int.Parse(ddlOrientation.SelectedValue));
            lblError.Text = "Registration Successful!";
        }
    }
}