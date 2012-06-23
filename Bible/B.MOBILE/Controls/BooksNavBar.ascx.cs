using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Data.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B.UTIL;
using B.DAL;


namespace B.MOBILE.Controls
{

    public partial class BooksNavBar : System.Web.UI.UserControl
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            StringBuilder HTML = new StringBuilder();

            HTML.Append(@"<h2 class=""page-title"">Books Of The Bible</h2>");

            using (var context = new DAL.BibleEntities())
            {

                foreach (var V in context.usp_GetBooks())
                {
                    HTML.Append(@"<ul class=""group""><li><a href=""" + B.UTIL.Url.ReturnURL() + @"/Book/" + V.FriendlyBookURL.ToString() + @"""onclick=""return link(this)"">" + V.DisplayName.ToString() + "</a></li></ul>");   
                }

            }

            BooksNav.InnerHtml = HTML.ToString();

        }

    }

}