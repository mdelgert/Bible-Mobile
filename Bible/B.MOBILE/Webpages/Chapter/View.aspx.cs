using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace B.MOBILE.Webpages.Chapter
{

    public partial class View : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            string[] file = Request.CurrentExecutionFilePath.Split('/');
            string fileName = file[file.Length - 1];
            string Url = fileName.Replace(".aspx", "");
            string Chapter = null;
            string Book = null;
            
            StringBuilder HTML = new StringBuilder();
            StringBuilder Verses = new StringBuilder();

            using (var context = new DAL.BibleEntities())
            {
                foreach (var V in context.usp_GetChapter(Url, int.Parse(Session["BibleID"].ToString())))
                {
                    Verses.Append(@"<p><a href=""/Verse/" + V.FriendlyVerseURL + @"""><b>" + V.Book + " " + V.Chapter + ":" + V.Verse + "</b> </a>" + V.VerseText + "</p>");
                    Chapter = V.Chapter.ToString();
                    Book = V.Book.ToString();
                }

            }

            HTML.Append(@"<div id=""content""><h2 class=""page-title"">" + Book + " " + Chapter + @"</h2><div class=""text-box"">" + Verses + "</div></div>");
            ChapterHTML.InnerHtml = HTML.ToString();

        }

    }

}