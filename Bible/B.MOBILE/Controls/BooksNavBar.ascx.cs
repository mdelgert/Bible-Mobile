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