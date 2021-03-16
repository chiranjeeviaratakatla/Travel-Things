using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TravelThings.Helpers;

namespace TravelThings.Login
{
    public partial class SetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Tools.UserId == 0) { Response.Redirect("~/BackEnd/frmLogin.aspx"); }
            if (!IsPostBack)
            {
                lblWlcmUser.Text = "Welcome " + Tools.UserName;
            }
        }

        protected void btnSetPassowrd_Click(object sender, EventArgs e)
        {
            try
            {
                string strErrorMessage = Validation();
                if (string.IsNullOrEmpty(strErrorMessage))
                {
                    string strOldPassword = Tools.Encryptdata(txtPassword.Text.Trim());
                    int intConf = Convert.ToInt32(Tools.ExecuteScalar("SELECT COUNT(*) FROM tbl_User_Details WHERE UD_User_Id = " + Tools.UserId.ToString()));
                    if (intConf == 1)
                    {
                        string strPassword = Tools.Encryptdata(txtConfirmPsw.Text.Trim());
                        Tools.ExecuteNonQuery("UPDATE tbl_User_Details SET UD_Password = '" + strPassword + "' WHERE UD_User_Id = '" + Tools.UserId.ToString() + "'");
                        //ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Done!', 'Password Set Successfully', 'success')", true);
                        Response.Redirect("~/BackEnd/frmProfile.aspx");
                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', 'Please Register First', 'info')", true);
                    }
                }
                else
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + strErrorMessage + "', 'warning')", true);

            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
            }
        }

        private string Validation()
        {
            string strErrorMessage = string.Empty;
            try
            {
                if (string.IsNullOrEmpty(txtPassword.Text.Trim()) || string.IsNullOrEmpty(txtConfirmPsw.Text.Trim()))
                {
                     if (string.IsNullOrEmpty(txtPassword.Text.Trim()))
                    {
                        strErrorMessage = "Please Enter New Password";
                    }
                    else
                    {
                        strErrorMessage = "Please Enter Conform Password";
                    }
                }
                else if (txtPassword.Text.Trim() != txtConfirmPsw.Text.Trim())
                {
                    strErrorMessage = "Password and Confirm Password Must Match";
                }
                
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
            }
            return strErrorMessage;
        }
    }
}