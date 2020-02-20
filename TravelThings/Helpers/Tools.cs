using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TravelThings.Helpers
{
    public static class Tools
    {
        public static string Alert(string Message)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(Message);
            sb.Append("')};");
            sb.Append("</script>");
            //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
            return sb.ToString();
        }

        public static string UserName { get; set; }
        public static int UserId { get; set; }
    }
}