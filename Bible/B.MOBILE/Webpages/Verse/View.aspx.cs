using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace B.MOBILE.Webpages.Verse
{

    public partial class View : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            string[] file = Request.CurrentExecutionFilePath.Split('/');
            string fileName = file[file.Length - 1];
            string Url = fileName.Replace(".aspx", "");
            StringBuilder HTML = new StringBuilder();
            StringBuilder Verses = new StringBuilder();
            string Chapter = null;
            string Book = null;
            string Bible = null;
            string VerseID = null;

            using (var context = new DAL.BibleEntities())
            {
                foreach (var V in context.usp_GetVerse(Url, int.Parse(Session["BibleID"].ToString())))
                {
                    Verses.Append(@"<p><a href=""/Verse/" + V.FriendlyVerseURL + @"""><b>" + V.Book + " " + V.Chapter + ":" + V.Verse + "</b> </a>" + V.VerseText + " <b>(" + V.BibleName + ")</b></p>");
                    Chapter = V.Chapter.ToString();
                    Book = V.Book.ToString();
                    VerseID = V.Verse.ToString();

                    if (Bible == null)
                    {
                        Bible = V.BibleName.ToString();
                    }

                }

            }

            HTML.Append(@"<div id=""content""><h2 class=""page-title"">" + Book + " " + Chapter + @"</h2><div class=""text-box"">" + Verses + "</div></div>");
            BibleHTML.InnerHtml = HTML.ToString();

            //############################################### SEO BEGIN ######################################################
            this.Page.Title = "SendBible.com " + Bible + " " + Book + " " + Chapter + ":" + VerseID;
            HtmlHead head = this.Master.Page.Header;
            HtmlMeta meta = new HtmlMeta();
            meta.Name = "keywords";
            StringBuilder Keywords = new StringBuilder();
            Keywords.Append(Bible + ", ");
            Keywords.Append(Book + " " + Chapter + ":" + VerseID + ", ");
            Keywords.Append("Bible");
            meta.Content = Keywords.ToString();
            head.Controls.Add(meta);
            //############################################### SEO END  ######################################################
        }

    }

}