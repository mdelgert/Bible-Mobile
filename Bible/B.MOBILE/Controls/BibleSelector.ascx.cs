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