using System;
using System.Web;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace B.UTIL
{


    public class Url
    {


        public static string ReturnURL()
        {

            string Host = System.Web.HttpContext.Current.Request.Url.Host;
            string Port = System.Web.HttpContext.Current.Request.ServerVariables["SERVER_PORT"];
            if (Port == null || Port == "80" || Port == "443")
            {
                Port = "";
            }
            else
            {
                Port = ":" + Port;
            }

            string Protocol = System.Web.HttpContext.Current.Request.ServerVariables["SERVER_PORT_SECURE"];
            if (Protocol == null || Protocol == "0")
            {
                Protocol = "http://";
            }

            else
            {
                Protocol = "https://";
            }

            string ReturnURL = Protocol + Host + Port;

            return ReturnURL.ToString();

        }

    }


}
