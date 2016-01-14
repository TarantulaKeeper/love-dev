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
                CreatePage();
        }
        private void CreatePage()
        {
            d = new DAL();
            DataSet ds = d.ExecuteProcedure("spGetQuestionCategories");
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                divPage.Controls.Add(CreateCategoryDiv(DR["QuestionCategoryName"].ToString(), int.Parse(DR["QuestionCategoryID"].ToString())));
            }
            HtmlGenericControl div = (HtmlGenericControl)divPage.FindControl("divPolitics");
            div.Style.Add("display", "block");
            HtmlInputButton btn = new HtmlInputButton();
            //btn.Click += new EventHandler(btnSubmit_Click);
            btn.ServerClick += new EventHandler(btnSubmit_Click);
            btn.ID = "btnSubmit";
            btn.Value = "Submit quiz";
            divPage.Controls.Add(btn);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            int i = 1;
            List<int> values = new List<int>();
            foreach( div in divPage.Controls)
            {
                HtmlGenericControl txt = (HtmlGenericControl)div.FindControl("txt" + i);
                values.Add(int.Parse(txt.InnerHtml));
                i++;
            }
        }

        private HtmlGenericControl CreateCategoryDiv(string CategoryName, int CategoryID)
        {
            HtmlGenericControl div = new HtmlGenericControl("div");
            HtmlGenericControl Category = new HtmlGenericControl("h4");
            Category.InnerText = CategoryName;
            div.ID = "div" + CategoryName;
            div.Controls.Add(Category);
            div.Controls.Add(CreateQuestionDiv(CategoryID));
            div.Style.Add("display", "none");
            return div;
        }

        private HtmlGenericControl CreateQuestionDiv(int CategoryID)
        {
            d.AddParam("CategoryID", CategoryID);
            DataSet ds = d.ExecuteProcedure("spGetQuestions");
            HtmlGenericControl div = new HtmlGenericControl("div");
            HtmlInputButton btn = new HtmlInputButton();
            btn.ID = "btnContinue" + CategoryID;
            btn.Value = "Continue";
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                Label lblNever = new Label();
                lblNever.Text = "Never";
                Label lblAlways = new Label();
                lblAlways.Text = "Always";
                Label lblQuestion = new Label();
                lblQuestion.Text = ds.Tables[0].Rows[i]["QuestionString"].ToString() + "?";
                TextBox txt = new TextBox();
                txt.TextMode = TextBoxMode.Range;
                txt.MaxLength = 1;
                txt.ID = "txt" + CategoryID + i;
                div.ID = "divQuestions" + CategoryID;
                div.Controls.Add(lblQuestion);
                div.Controls.Add(lblNever);
                div.Controls.Add(txt);
                div.Controls.Add(lblAlways);
                div.Style.Add("display", "none");
            }
            div.Controls.Add(btn);
            return div;

        }
    }
}