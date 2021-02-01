using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using TravelThings.Helpers;
using TravelThings.DAL.BusinessLogic;
using TravelThings.DAL.Interfaces;

namespace TravelThings.BackEnd
{
    public partial class frmProfile : System.Web.UI.Page
    {
        IUserAccess dll = new UserAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Tools.UserId == 0) { Response.Redirect("~/BackEnd/frmLogin.aspx"); }
            if (!IsPostBack)
            {
                getUserDetails();
            }
        }

        private void getUserDetails()
        {
            try
            {
                DataTable dtUserDetails = new DataTable();
                dtUserDetails = dll.GettUserDetails(Tools.UserId.ToString());
                if (dtUserDetails.Rows.Count > 0)
                {
                    txtName.Text = dtUserDetails.Rows[0]["UD_User_Name"].ToString();
                    txtPhoneNo.Text = dtUserDetails.Rows[0]["UD_Phone_No"].ToString();
                    txtAltPhNo.Text = dtUserDetails.Rows[0]["UD_Alter_Phone_No"].ToString();
                    txtAahdar.Text = dtUserDetails.Rows[0]["UD_Aadhar_No"].ToString();
                    if (!string.IsNullOrEmpty(dtUserDetails.Rows[0]["UD_Address"].ToString()))
                    {
                        string[] strAddress = dtUserDetails.Rows[0]["UD_Address"].ToString().Split('#');
                        txtArea.Text = strAddress[0];
                        txtCity.Text = strAddress[1];
                        txtState.Text = strAddress[2];
                        txtPinCode.Text = strAddress[3];
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(Tools.Alert(ex.Message));
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string strErrorMsg = Validation();
                if (string.IsNullOrEmpty(strErrorMsg))
                {
                    string strAddress = string.Empty;
                    strAddress = txtArea.Text.Trim() + "#";
                    strAddress = strAddress + txtCity.Text.Trim() + "#";
                    strAddress = strAddress + txtState.Text.Trim() + "#";
                    strAddress = strAddress + txtPinCode.Text.Trim();
                    string strPassword = Tools.Encryptdata(txtPassword.Text.Trim());
                    bool blResult = dll.UpdateUserProfile(Tools.UserId.ToString(), strPassword, txtName.Text.Trim(), txtAltPhNo.Text.Trim(), txtAahdar.Text.Trim(), strAddress);
                    if (blResult)
                    {
                        //Response.Write(Tools.Alert("Thank you For Registration"));
                        Response.Redirect("~/BackEnd/frmLogin.aspx",false);
                    }
                }
                else
                    Response.Write(Tools.Alert(strErrorMsg));
            }
            catch (Exception ex)
            {
                Response.Write(Tools.Alert(ex.Message));
            }
        }

        private string Validation()
        {
            string strErrorMessage = string.Empty;
            try
            {
                if (string.IsNullOrEmpty(txtName.Text.Trim()))
                {
                    strErrorMessage = "Please Enter Name";
                    txtName.Focus();
                }
                else if (string.IsNullOrEmpty(txtPhoneNo.Text.Trim()))
                {
                    strErrorMessage = "Please Enter Phone No";
                    txtPhoneNo.Focus();
                }
                else if (string.IsNullOrEmpty(txtAahdar.Text.Trim()))
                {
                    strErrorMessage = "Please Enter Aadhar No";
                    txtAahdar.Focus();
                }
                else if (string.IsNullOrEmpty(txtArea.Text.Trim()))
                {
                    strErrorMessage = "Please Enter Area";
                    txtArea.Focus();
                }
                else if (string.IsNullOrEmpty(txtCity.Text.Trim()))
                {
                    strErrorMessage = "Please Enter City";
                    txtCity.Focus();
                }
                else if (string.IsNullOrEmpty(txtState.Text.Trim()))
                {
                    strErrorMessage = "Please Enter State";
                    txtState.Focus();
                }
                else if (string.IsNullOrEmpty(txtPinCode.Text.Trim()))
                {
                    strErrorMessage = "Please Enter Pincode";
                    txtPinCode.Focus();
                }
                else if (string.IsNullOrEmpty(txtPassword.Text.Trim()) || string.IsNullOrEmpty(txtConPassword.Text.Trim()))
                {
                    if (string.IsNullOrEmpty(txtPassword.Text.Trim()))
                    {
                        strErrorMessage = "Please Enter Password";
                        txtPassword.Focus();
                    }
                    else
                    {
                        strErrorMessage = "Please Enter Conform Password";
                        txtConPassword.Focus();
                    }
                }
                else
                {
                    if (txtPassword.Text.Trim() != txtConPassword.Text.Trim())
                    {
                        strErrorMessage = "Password and Confirm Password Must Match";
                        txtPassword.Focus();
                    }
                }

            }
            catch (Exception ex)
            {
                strErrorMessage = ex.Message;
                throw;
            }
            return strErrorMessage;
        }

        private void ClearControls()
        {
            try
            {
                txtName.Text = string.Empty;
                txtAltPhNo.Text = string.Empty;
                txtAahdar.Text = string.Empty;
                txtArea.Text = string.Empty;
                txtCity.Text = string.Empty;
                txtState.Text = string.Empty;
                txtPinCode.Text = string.Empty;
            }
            catch (Exception ex)
            {
                Response.Write(Tools.Alert(ex.Message));
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearControls();
        }

        protected void chkShowPws_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                if (chkShowPws.Checked)
                {
                    txtPassword.TextMode = TextBoxMode.SingleLine;
                    txtConPassword.TextMode = TextBoxMode.SingleLine;
                }
                else
                {
                    txtPassword.TextMode = TextBoxMode.Password;
                    txtConPassword.TextMode = TextBoxMode.Password;
                }
            }
            catch (Exception ex)
            {
                Response.Write(Tools.Alert(ex.Message));
            }
        }
    }
}