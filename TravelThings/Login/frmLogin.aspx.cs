using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TravelThings.Helpers;
using TravelThings.DAL.BusinessLogic;
using TravelThings.DAL.Interfaces;
using System.Data;

namespace TravelThings.BackEnd
{
    public partial class frmLogin : System.Web.UI.Page
    {
        IUserAccess dll = new UserAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["userid"] != null)
                    txtPhoneNo.Text = Request.Cookies["userid"].Value;
                if (Request.Cookies["pwd"] != null)
                    txtPassword.Attributes.Add("value", Request.Cookies["pwd"].Value);
                if (Request.Cookies["userid"] != null && Request.Cookies["pwd"] != null)
                    chkRemeber.Checked = true;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string strErrorMsg = ValidationControls();
                if (string.IsNullOrEmpty(strErrorMsg))
                {
                    string strPassword = Tools.Encryptdata(txtPassword.Text.Trim());
                    DataTable dtUserDetails = dll.ConfirmCredentials(txtPhoneNo.Text.Trim(), strPassword);
                    if (dtUserDetails.Rows[0][0].ToString() != "FALSE")
                    {
                        if (chkRemeber.Checked == true)
                        {
                            Response.Cookies["userid"].Value = txtPhoneNo.Text.Trim();
                            Response.Cookies["pwd"].Value = txtPassword.Text.Trim();
                            Response.Cookies["userid"].Expires = DateTime.Now.AddDays(15);
                            Response.Cookies["pwd"].Expires = DateTime.Now.AddDays(15);
                        }
                        else
                        {
                            Response.Cookies["userid"].Expires = DateTime.Now.AddDays(-1);
                            Response.Cookies["pwd"].Expires = DateTime.Now.AddDays(-1);
                        }
                        //Response.Redirect("user.aspx");
                        Tools.UserId = Convert.ToInt32(dtUserDetails.Rows[0]["UD_User_Id"].ToString());
                        Tools.UserName = dtUserDetails.Rows[0]["UD_User_Name"].ToString();
                        Response.Redirect("~/BackEnd/frmDashboard.aspx");
                    }
                    else
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', 'Phone Number or Password is Incorrect!', 'warning')", true);
                    //Response.Write(Tools.Alert("Phone Number or Password is Incorrect!"));
                }
                else
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + strErrorMsg + "', 'warning')", true);
               // Response.Write(Tools.Alert(strErrorMsg));
            }
            catch
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', 'Something went Wrong. Please try Again!', 'warning')", true);
                //Response.Write(Tools.Alert(ex.Message));
            }
        }

        private string ValidationControls()
        {
            string strErrorMessage = string.Empty;
            try
            {
                if (string.IsNullOrEmpty(txtPhoneNo.Text.Trim()))
                    strErrorMessage = "Please Enter Phone No";
                else if(txtPhoneNo.Text.Length <9 || txtPhoneNo.Text.Length >11)
                    strErrorMessage = "Please enter 10 digit Phone No";
                else if (string.IsNullOrEmpty(txtPassword.Text.Trim()))
                    strErrorMessage = "Please Enter Passwords";
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
                //Response.Write(Tools.Alert(ex.Message));
            }
            return strErrorMessage;
        }
    }
}