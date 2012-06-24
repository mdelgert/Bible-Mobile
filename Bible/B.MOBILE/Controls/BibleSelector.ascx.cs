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
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace B.MOBILE.Controls
{

    public partial class BibleSelector : System.Web.UI.UserControl
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["BibleID"] == null)
            {
                Session["BibleID"] = "4";
            }

            if (Session["BibleID"] != null & !Page.IsPostBack)
            {
                DropDownListBible.SelectedValue = Session["BibleID"].ToString();
            }

        }

        protected void DropDownListBible_SelectedIndexChanged(object sender, EventArgs e)
        {
            int BibleID = int.Parse(DropDownListBible.SelectedValue.ToString());
            Session["BibleID"] = BibleID;
        }

    }

}