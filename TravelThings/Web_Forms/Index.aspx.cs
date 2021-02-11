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
using TravelThings.BackEnd;

namespace TravelThings.Web_Forms
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!this.IsPostBack)
            {
                Tools.UserId = 0;
                Tools.UserName = string.Empty;
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

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                string ErrorMessage = string.Empty;
                if (string.IsNullOrEmpty(ErrorMessage = DataValidation()))
                {
                    IUserAccess dal = new UserAccess();
                    DataTable dt = dal.InsertUserDetails(txtName.Text.ToUpper().Trim(), txtPhoneNo.Text.Trim(), "", "", "");
                    if (dt.Rows.Count > 0)
                    {
                        Tools.UserId = Convert.ToInt32(dt.Rows[0]["UD_User_Id"].ToString());
                        Tools.UserName = dt.Rows[0]["UD_User_Name"].ToString();
                        Response.Redirect("~/BackEnd/frmProfile.aspx");
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
    }
}