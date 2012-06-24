<%--/*  
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
 */--%>

<%@ Page Language="C#" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Web.Configuration" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    class DataItem
    {
        public string Loc { get; set; }
        public string Priority { get; set; }
        public string Lastmod { get; set; }
        public string Changefreq { get; set; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

        List<DataItem> items = new List<DataItem>();

        string connectionstring = WebConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        using (SqlConnection con = new SqlConnection())
        {
            con.ConnectionString = connectionstring;
            const string sql = @"EXEC [dbo].[usp_GetSiteMap] @SiteURL='http://www.sendbible.com'";
            SqlCommand cmd = new SqlCommand(sql, con) { CommandType = CommandType.Text };
            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {

                    string loc = reader["loc"].ToString();
                    string priority = reader["priority"].ToString();
                    string lastmod = reader["lastmod"].ToString();
                    string changefreq = reader["changefreq"].ToString();

                    items.Add(new DataItem()
                    {
                        Loc = loc,
                        Priority = priority,
                        Lastmod = lastmod,
                        Changefreq = changefreq
                    });

                }
                reader.Close();
            }
            catch (SqlException err)
            {
                throw new ApplicationException("Data Error (Sections):" + err.Message);
            }
            finally
            {
                con.Close();
            }
        }

        Response.Clear();
        Response.ContentType = "text/xml; charset=utf-8";

        XmlTextWriter writer = new XmlTextWriter(Response.OutputStream, Encoding.UTF8);
        writer.Formatting = Formatting.Indented;
        writer.WriteStartDocument();

        writer.WriteStartElement("urlset");
        writer.WriteAttributeString("xmlns", "http://www.sitemaps.org/schemas/sitemap/0.9");

        foreach (DataItem item in items)
        {
            DateTime LM = DateTime.Parse(item.Lastmod);
            writer.WriteStartElement("url");
            writer.WriteElementString("loc", item.Loc);
            writer.WriteElementString("lastmod", LM.ToString("yyyy-MM-dd"));
            writer.WriteElementString("changefreq", item.Changefreq);
            writer.WriteElementString("priority", item.Priority);
            writer.WriteEndElement();
        }

        writer.WriteEndElement();
        writer.WriteEndDocument();
        writer.Flush();
        writer.Close();
        Response.End();
    }

</script>
