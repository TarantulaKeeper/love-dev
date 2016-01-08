using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LoveDevLib;
using DAL_Project;
using System.Data;

namespace LoveDev
{
    public partial class UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Security.CurrentUser == null)
            {
                Response.Redirect("Index.aspx?Must be logged in to view that page");
            }
            if(!IsPostBack)
            {
                LoadUserInfo();
            }
        }

        private void LoadUserInfoForEditing()
        {
            DAL myDal = new DAL();
            DataSet ds = new DataSet();
            myDal.AddParam("UserID", Security.CurrentUser.UserID);
            ds = myDal.ExecuteProcedure("spGetUserByID");
            tbFirstName.Text = ds.Tables[0].Rows[0]["FirstName"].ToString();
            tbLastName.Text = ds.Tables[0].Rows[0]["LastName"].ToString();
            tbAge.Text = ds.Tables[0].Rows[0]["Age"].ToString();
            tbCity.Text = ds.Tables[0].Rows[0]["City"].ToString();
            tbCountry.Text = ds.Tables[0].Rows[0]["Country"].ToString();
            txtareaUserBio.InnerText = ds.Tables[0].Rows[0]["Bio"].ToString();

        }

        private void LoadUserInfo()
        {
            DAL myDal = new DAL();
            DataSet ds = new DataSet();
            myDal.AddParam("UserID", Security.CurrentUser.UserID);
            ds = myDal.ExecuteProcedure("spGetUserByID");
            imgProfilePhoto.ImageUrl = ds.Tables[0].Rows[0]["UserPhoto"].ToString();
            lblFirstName.Text = ds.Tables[0].Rows[0]["FirstName"].ToString();
            lblLastName.Text = ds.Tables[0].Rows[0]["LastName"].ToString();
            lblAge.Text = ds.Tables[0].Rows[0]["Age"].ToString();
            lblCity.Text = ds.Tables[0].Rows[0]["City"].ToString();
            lblCountry.Text = ds.Tables[0].Rows[0]["Country"].ToString();
            txtareaUserBio.InnerText = ds.Tables[0].Rows[0]["Bio"].ToString();
            
        }

        protected void btnSaveBasicInformation_Click(object sender, EventArgs e)
        {
            DAL myDal = new DAL();
            myDal.AddParam("UserID", Security.CurrentUser.UserID);
            myDal.AddParam("FirstName", tbFirstName.Text);
            myDal.AddParam("LastName", tbLastName.Text);
            myDal.AddParam("Age", tbAge.Text);
            myDal.AddParam("City", tbCity.Text);
            myDal.AddParam("Country", tbCountry.Text);
            myDal.AddParam("Bio", txtareaEditBio.InnerText);
            myDal.ExecuteProcedure("spEditUserData");
            LoadUserInfo();
        }

        protected void btnSaveProfilePhoto_Click(object sender, EventArgs e)
        {

            DAL myDal = new DAL();
            string Path = Server.MapPath(".").ToString() + "\\PROFILE_PHOTOS\\";
            string fileName = fuProfilePhoto.FileName;
           fuProfilePhoto.PostedFile.SaveAs(Path + fileName);
            myDal.AddParam("UserPhoto", @"PROFILE_PHOTOS/" + fileName);
            myDal.AddParam("UserID", Security.CurrentUser.UserID);
            myDal.ExecuteProcedure("spEditUserProfilePicture");
            LoadUserInfo();
            pnlProfilePhotoEdit.Visible = false;
        }

        protected void imgbtnEditBasicInfo_Click(object sender, ImageClickEventArgs e)
        {
            LoadUserInfoForEditing();
            pnlBasicInformationEdit.Visible = true;
            pnlBasicInformation.Visible = false;
            
        }

        protected void imgbtnEditProfilePhoto_Click(object sender, ImageClickEventArgs e)
        {
            pnlProfilePhotoEdit.Visible = true;
        }


    }
}