using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using DAL_Project;
using LoveDevLib;

namespace LoveDev
{
    public partial class Matchmaker : System.Web.UI.Page
    {
        static DAL d;
        protected void Page_Load(object sender, EventArgs e)
        {
            d = new DAL();
            DataSet ds = d.ExecuteProcedure("spGetQuestionCategories");
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                Page.Controls.Add(CreateDiv(DR["QuestionCategoryName"].ToString(), int.Parse(DR["QuestionCategoryID"].ToString())));
            }
        }

        private HtmlGenericControl CreateDiv(string CategoryName, int CategoryID)
        {
            d.AddParam("CategoryID", CategoryID);
            DataSet ds = d.ExecuteProcedure("sp")
            HtmlGenericControl div = new HtmlGenericControl("div");
            div.ID = "div" +CategoryName;
            div.InnerHtml = CategoryName;
            return div;
        }
    }
}