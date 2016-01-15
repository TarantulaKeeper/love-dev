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
using LoveDevMatchmakingLib;

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
            SaveUserValues(CalculateUserValues());           
        }

        private List<List<int>> CalculateUserValues()
        {
            List<List<int>> CategoryTotals = new List<List<int>>();
            foreach (Control item in divPage.Controls)
            {
                if (item.GetType() == typeof(HtmlGenericControl))
                {
                    foreach (HtmlGenericControl div in item.Controls)
                    {
                        List<int> values = new List<int>();
                        if (div.GetType() == typeof(HtmlGenericControl))
                        {
                            foreach (Control value in div.Controls)
                            {
                                if (value.GetType() == typeof(TextBox))
                                {
                                    TextBox t = (TextBox)value;
                                    values.Add(int.Parse(t.Text));
                                }
                            }
                            if (values.Count > 0)
                            {
                                CategoryTotals.Add(values);
                            }
                        }
                    }
                }
            }
            return CategoryTotals;
        }

        private void SaveUserValues(List<List<int>> CategoryTotals)
        {
            int x = 1;
            foreach (List<int> list in CategoryTotals)
            {
                d.AddParam("UserID", Security.CurrentUser.UserID);
                d.AddParam("QuestionCategoryID", x);
                d.AddParam("UserCategoryValue", list.Sum());
                d.ExecuteNonQuery("spSaveUserValues");
                x++;
            }
            MatchMakingAlgorithm mma = new MatchMakingAlgorithm(Security.CurrentUser.UserID);
            mma.CalculateAndSaveMatches();
            Response.Redirect("Matches.aspx?message=Quiz Completed Succesfully!");
            
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