/*  
 *  Copyright © 2012 Matthew David Elgert - mdelgert@yahoo.com
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU Lesser General Public License as published by
 *  the Free Software Foundation; either version 2.1 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA 
 * 
 *  Project URL: http://biblemobile.codeplex.com/                        
 *  
 */

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