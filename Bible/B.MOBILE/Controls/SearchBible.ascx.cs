using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B.DAL;

namespace B.MOBILE.Controls
{

    public partial class SearchBible : System.Web.UI.UserControl
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            string strSearch = Request.Form["TxtSearch"];

            if (strSearch != null & strSearch != "")
            {

                StringBuilder HTML = new StringBuilder();
                HTML.Append(@"<table width=""100%"">");

                using (var context = new DAL.BibleEntities())
                {

                    foreach (var V in context.usp_SearchVerses(strSearch, int.Parse(Session["BibleID"].ToString())))
                    {
                        HTML.Append(@"<tr><td><a href=""/Verse/" + V.FriendlyVerseURL + @""">" + V.Book + " " + V.Chapter + ":" + V.Verse + " </a> " + V.VerseText + @"</td></tr>");
                    }

                }

                HTML.Append(@"</table>");
                SearchResults.InnerHtml = HTML.ToString();
            }

        }

    }

}