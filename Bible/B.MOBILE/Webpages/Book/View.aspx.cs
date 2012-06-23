using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B.UTIL;
using B.DAL;


namespace B.MOBILE.Webpages.Book
{

    public partial class View : System.Web.UI.Page
    
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            string[] file = Request.CurrentExecutionFilePath.Split('/');
            string fileName = file[file.Length - 1];
            string Book = fileName.Replace(".aspx", "");
            StringBuilder HTML = new StringBuilder();
            StringBuilder Text = new StringBuilder();

            using (var context = new DAL.BibleEntities())
            {

                foreach (var V in context.usp_GetChapters(Book, int.Parse(Session["BibleID"].ToString())))
                {
                    Text.Append(@"<ul class=""group"">");
                    Text.Append(@"<li><a href=""" + B.UTIL.Url.ReturnURL() + @"/Chapter/" + V.FriendlyChapterURL + @"""onclick=""return link(this)"">" + V.Book.ToString() + " " + V.Chapter.ToString() +  "</a></li>" + "</ul>");
                }

            }

            HTML.Append(@"<div id=""content""><h2 class=""page-title"">" + Book.Replace("+", " ").ToString() + @"</h2><div class=""text-box"">" + Text + "</div></div>");
            BookHTML.InnerHtml = HTML.ToString();

        }

    }

}