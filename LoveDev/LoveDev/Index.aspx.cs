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
            if (Request.QueryString["message"] != null)
            {
                lblError.Text = Request.QueryString["message"];
            }
            else
            {
                lblError.Text = "";
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
            ddlOrientation.DataSource = d.ExecuteProcedure("spGetSexualOrientations");
            ddlOrientation.DataTextField = "SexualOrientationName";
            ddlOrientation.DataValueField = "SexualOrientationId";
            ddlOrientation.DataBind();
            ddlOrientation.Items.Insert(0, new ListItem("Select an Orientation...","-1"));
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            
            lblError.Text = "Registration Successful!";
            if (fupPhoto.HasFiles)
            {
                string Path = Server.MapPath(".").ToString() + "\\Images\\PROFILE_PHOTOS\\";
                string fileName = fupPhoto.FileName;
                fupPhoto.PostedFile.SaveAs(Path + txtFirstName.Text + "_" + txtLastName.Text);
                UserManager.RegisterUser(txtFirstName.Text, txtLastName.Text, txtPassword.Text, int.Parse(txtAge.Text), txtCity.Text, txtCountry.Text, txtEmail.Text, int.Parse(ddlGender.SelectedValue), int.Parse(ddlOrientation.SelectedValue), "Images/" + fupPhoto.FileName);
            }
            else
            {
                UserManager.RegisterUser(txtFirstName.Text, txtLastName.Text, txtPassword.Text, int.Parse(txtAge.Text), txtCity.Text, txtCountry.Text, txtEmail.Text, int.Parse(ddlGender.SelectedValue), int.Parse(ddlOrientation.SelectedValue));
            }
        }
    }
}