using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TravelThings.DAL.Interfaces;
using TravelThings.DAL.BusinessLogic;
using TravelThings.Helpers;

namespace TravelThings.Web_Forms
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnTraveler_Click(object sender, EventArgs e)
        {
            if(!string.IsNullOrEmpty(txtName.Text.Trim()))
            {
                if(!string.IsNullOrEmpty(txtPhoneNo.Text.Trim()))
                {
                    IUserAccess dal = new UserAccess();
                    string Result = dal.InsertUserDetails(txtName.Text.ToUpper().Trim(), txtPhoneNo.Text.Trim());
                    if (Result != "EXISTS USER")
                        Response.Redirect("");
                    else
                        Response.Redirect("");
                }
            }
        }
    }
}