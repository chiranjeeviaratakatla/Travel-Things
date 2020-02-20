using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TravelThings.DAL.Interfaces;
using TravelThings.DAL.BusinessLogic;
using TravelThings.Helpers;
using System.Data;

namespace TravelThings.Web_Forms
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnTraveler_Click(object sender, EventArgs e)
        {
            try
            {
                string ErrorMessage = string.Empty;
                if (string.IsNullOrEmpty(ErrorMessage = DataValidation()))
                {
                    IUserAccess dal = new UserAccess();
                    DataTable dt = dal.InsertUserDetails(txtName.Text.ToUpper().Trim(), txtPhoneNo.Text.Trim(), btnSender.Text == "I'm a Travelr" ? "Travelr" : "Sender");
                    if (dt.Rows.Count > 0)
                    {
                        Tools.UserId = Convert.ToInt32(dt.Rows[0]["UD_User_Id"].ToString());
                        Tools.UserName = dt.Rows[0]["UD_User_Name"].ToString();
                        //((HyperLink)(this.Master.FindControl("hlLogin"))).Text = Tools.UserName;
                        Response.Redirect("SenderDetails.aspx", false);
                    }
                }
                else
                    Response.Write(Tools.Alert(ErrorMessage));
            }
            catch (Exception ex)
            {
                Response.Write(Tools.Alert(ex.Message));
            }

        }

        private string DataValidation()
        {
            string ErrorMessage = string.Empty;
            if (string.IsNullOrEmpty(txtName.Text))
                ErrorMessage = "Please Enter Name.";
            else if (string.IsNullOrEmpty(txtPhoneNo.Text))
                ErrorMessage = "Please Enter Phone Number.";

            return ErrorMessage;
        }
    }
}