using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Routing;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace B.MOBILE
{

    public class Global : System.Web.HttpApplication
    {

        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteTable.Routes.MapPageRoute("BookRoute", "Book/{Name}", "~/Webpages/Book/View.aspx");
            RouteTable.Routes.MapPageRoute("ChapterRoute", "Chapter/{Name}", "~/Webpages/Chapter/View.aspx");
            RouteTable.Routes.MapPageRoute("VerseRoute", "Verse/{Name}", "~/Webpages/Verse/View.aspx");
            RouteTable.Routes.MapPageRoute("Sitemap", "Sitemap.xml", "~/SitemapXML.aspx");
        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown

        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }

        void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started

        }

        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.

        }

    }
}
