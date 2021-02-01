using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TravelThings.DAL.BusinessLogic;
using TravelThings.DAL.Interfaces;
using System.Data;
using System.Web.Script.Serialization;

namespace TravelThings
{
    /// <summary>
    /// Summary description for AddressHandler
    /// </summary>
    public class AddressHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
       {
            string term = context.Request["term"] ?? "";
            List<string> listAddress = new List<string>();

            IappAccess dll = new AppAccess();
            DataTable dtAddress = dll.GetAreaList(term);
            for (int i = 0; i < dtAddress.Rows.Count; i++)
            {
                listAddress.Add(dtAddress.Rows[i][0].ToString());
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            context.Response.Write(js.Serialize(listAddress));
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}