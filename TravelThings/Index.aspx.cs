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
        Tools tools = new Tools();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                tools.UserId = string.Empty;
                tools.UserName = string.Empty;
            }

        }

        private string DataValidation()
        {
            string ErrorMessage = string.Empty;
            if (string.IsNullOrEmpty(txtName.Text))
                ErrorMessage = "Please Enter Name.";
            else if (string.IsNullOrEmpty(txtPhoneNo.Text))
                ErrorMessage = "Please Enter Phone Number.";
            else if (txtPhoneNo.Text.Length != 10)
                ErrorMessage = "Please Enter Valid 10 Digit Phone Number.";

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
                    string strPassword = Tools.Encryptdata(Tools.CreateRandomPassword());
                    DataTable dt = dal.InsertUserDetails(txtName.Text.ToUpper().Trim(), txtPhoneNo.Text.Trim(), "", "", strPassword);
                    if (dt.Rows.Count > 0)
                    {
                        if (dt.Rows[0]["USER_TYPE"].ToString() == "EXISTS")
                        {
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', 'Phone Number Already Registered', 'warning')", true);
                            // ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "ConformLogin()", true);
                        }
                        else
                        {
                            tools.UserId = dt.Rows[0]["UD_User_Id"].ToString();
                            tools.UserName = dt.Rows[0]["UD_User_Name"].ToString();
                            Response.Redirect("~/Login/frmSetPassword.aspx");
                        }
                    }
                }
                else
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ErrorMessage + "', 'warning')", true);
                //Response.Write(Tools.Alert(ErrorMessage));
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
                //Response.Write(Tools.Alert(ex.Message));
            }

        }
    }
}