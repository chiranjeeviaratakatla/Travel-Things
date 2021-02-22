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
using System.IO;
using System.Drawing;

namespace TravelThings.BackEnd
{
    public partial class frmProfile : System.Web.UI.Page
    {
        IUserAccess dll = new UserAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            //MainView.ActiveViewIndex = 0;
            if (Tools.UserId == 0) { Response.Redirect("~/BackEnd/frmLogin.aspx"); }
            if (!IsPostBack)
            {
                getUserDetails();
                tabProfile.CssClass = "Clicked";
                MainViewProfile.ActiveViewIndex = 0;
                LinkButton li = (LinkButton)Master.FindControl("lbProfile");
                li.CssClass = "Clicked";
                //pnlProfileEdit.Visible = true;
                //pnlProfileView.Enabled = false;
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
                    lblWelUName.Text = dtUserDetails.Rows[0]["UD_User_Name"].ToString();
                    lblUserName.Text = dtUserDetails.Rows[0]["UD_User_Name"].ToString();
                    lblPhoneNo.Text = dtUserDetails.Rows[0]["UD_Phone_No"].ToString();
                    lblAltPhone.Text = dtUserDetails.Rows[0]["UD_Alter_Phone_No"].ToString();
                    lblEmailId.Text = dtUserDetails.Rows[0]["UD_EmailId"].ToString();
                    lblAadharNo.Text = dtUserDetails.Rows[0]["UD_Aadhar_No"].ToString();
                    lblRevards.Text = dtUserDetails.Rows[0]["P_Paid_Amt"].ToString();
                    if (!string.IsNullOrEmpty(dtUserDetails.Rows[0]["UD_PhotoPath"].ToString().Trim()))
                        imgProfilePic.ImageUrl = "~/Images/UserProfilepics/" + dtUserDetails.Rows[0]["UD_PhotoPath"].ToString();
                    else
                        imgProfilePic.ImageUrl = "~/Images/Profile.jpg";

                    if (!string.IsNullOrEmpty(dtUserDetails.Rows[0]["UD_Address"].ToString()))
                    {
                        string[] strAddress = dtUserDetails.Rows[0]["UD_Address"].ToString().Split('#');
                        lblArea.Text = strAddress[0];
                        lblCity.Text = strAddress[1];
                        lblState.Text = strAddress[2];
                        lblPinCode.Text = strAddress[3];
                    }
                    //Edit Password
                    txtName.Text = dtUserDetails.Rows[0]["UD_User_Name"].ToString();
                    txtPhoneNo.Text = dtUserDetails.Rows[0]["UD_Phone_No"].ToString();
                    txtAltPhNo.Text = dtUserDetails.Rows[0]["UD_Alter_Phone_No"].ToString();
                    txtEmailId.Text = dtUserDetails.Rows[0]["UD_EmailId"].ToString();
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
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
                //Response.Write(Tools.Alert(ex.Message));
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string strErrorMsg = Validation();
                if (string.IsNullOrEmpty(strErrorMsg))
                {
                    if (UpdateUserDetails())
                    {
                        //Response.Write(Tools.Alert("Thank you For Registration"));
                        Response.Redirect("~/BackEnd/frmLogin.aspx", false);
                    }
                }
                else
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + strErrorMsg + "', 'warning')", true);
                //Response.Write(Tools.Alert(strErrorMsg));
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
                //Response.Write(Tools.Alert(ex.Message));
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
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
                //Response.Write(Tools.Alert(ex.Message));
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            if (btnEdit.Visible)
            {
                pnlProfileView.Visible = true;
                pnlProfileEdit.Visible = false;
                btnEdit.Visible = false;
            }
            else
            {
                ClearControls();
            }
        }

        protected void chkShowPws_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                if (chkShowPws.Checked)
                {
                    txtOldPsw.TextMode = TextBoxMode.SingleLine;
                    txtNewPsw.TextMode = TextBoxMode.SingleLine;
                    txtConformPsw.TextMode = TextBoxMode.SingleLine;
                }
                else
                {
                    txtOldPsw.TextMode = TextBoxMode.Password;
                    txtNewPsw.TextMode = TextBoxMode.Password;
                    txtConformPsw.TextMode = TextBoxMode.Password;
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
                Response.Write(Tools.Alert(ex.Message));
            }
        }

        protected void tabProfile_Click(object sender, EventArgs e)
        {
            tabProfile.CssClass = "Clicked";
            tabAddress.CssClass = "Initial";
            tabChangePsw.CssClass = "Initial";
            MainViewProfile.ActiveViewIndex = 0;
        }

        protected void tabAddress_Click(object sender, EventArgs e)
        {
            tabProfile.CssClass = "Initial";
            tabAddress.CssClass = "Clicked";
            tabChangePsw.CssClass = "Initial";
            MainViewProfile.ActiveViewIndex = 1;
        }

        protected void tabChangePsw_Click(object sender, EventArgs e)
        {
            tabProfile.CssClass = "Initial";
            tabAddress.CssClass = "Initial";
            tabChangePsw.CssClass = "Clicked";
            MainViewProfile.ActiveViewIndex = 2;
        }

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            pnlProfileView.Visible = false;
            pnlProfileEdit.Visible = true;
            btnSave.Visible = false;
            btnEdit.Visible = true;
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                string strErrorMsg = Validation();
                if (string.IsNullOrEmpty(strErrorMsg))
                {
                    if (UpdateUserDetails())
                    {
                        getUserDetails();
                        pnlProfileView.Visible = true;
                        pnlProfileEdit.Visible = false;
                        btnEdit.Visible = false;
                    }
                }
                else
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + strErrorMsg + "', 'warning')", true);
                //Response.Write(Tools.Alert(strErrorMsg));
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
                // Response.Write(Tools.Alert(ex.Message));
            }
        }

        private bool UpdateUserDetails()
        {
            bool blResult = false;
            try
            {
                string strAddress = string.Empty;
                strAddress = txtArea.Text.Trim() + "#";
                strAddress = strAddress + txtCity.Text.Trim() + "#";
                strAddress = strAddress + txtState.Text.Trim() + "#";
                strAddress = strAddress + txtPinCode.Text.Trim();
                blResult = dll.UpdateUserProfile(Tools.UserId.ToString(), txtName.Text.Trim(), txtAltPhNo.Text.Trim(), txtAahdar.Text.Trim(), txtEmailId.Text.Trim(), "", strAddress);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
                //Response.Write(Tools.Alert(ex.Message));
            }
            return blResult;
        }

        protected void btnChangePsw_Click(object sender, EventArgs e)
        {
            try
            {
                string strErrorMessage = string.Empty;
                if (string.IsNullOrEmpty(txtOldPsw.Text.Trim()) || string.IsNullOrEmpty(txtNewPsw.Text.Trim()) || string.IsNullOrEmpty(txtConformPsw.Text.Trim()))
                {
                    if (string.IsNullOrEmpty(txtOldPsw.Text.Trim()))
                    {
                        strErrorMessage = "Please Enter Old Password";
                        //txtPassword.Focus();
                    }
                    else if (string.IsNullOrEmpty(txtNewPsw.Text.Trim()))
                    {
                        strErrorMessage = "Please Enter New Password";
                        //txtPassword.Focus();
                    }
                    else
                    {
                        strErrorMessage = "Please Enter Conform Password";
                        //txtConPassword.Focus();
                    }
                }

                if (txtNewPsw.Text.Trim() != txtConformPsw.Text.Trim())
                {
                    strErrorMessage = "Password and Confirm Password Must Match";
                    return;
                }
                else
                {
                    if (string.IsNullOrEmpty(strErrorMessage))
                    {
                        string strOldPassword = Tools.Encryptdata(txtOldPsw.Text.Trim());
                        int intConf = Convert.ToInt32(Tools.ExecuteScalar("SELECT COUNT(*) FROM tbl_User_Details WHERE UD_User_Id = '" + Tools.UserId.ToString() + "' AND UD_Password ='" + Tools.Encryptdata(txtOldPsw.Text.Trim()) + "'"));
                        if (intConf == 1)
                        {
                            string strPassword = Tools.Encryptdata(txtNewPsw.Text.Trim());
                            Tools.ExecuteNonQuery("UPDATE tbl_User_Details SET UD_Password = '" + strPassword + "' WHERE UD_User_Id = '" + Tools.UserId.ToString() + "'");
                            ClearPsw();
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Done!', 'Password Changed Successfully', 'success')", true);
                        }
                        else
                        {
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', 'Invalid Old Password', 'warning')", true);
                        }
                    }
                    else
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + strErrorMessage + "', 'warning')", true);
                    //Response.Redirect(Tools.Alert(strErrorMessage));
                }


            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
                // Response.Write(Tools.Alert(ex.Message));
            }
        }

        protected void btnClearPsw_Click(object sender, EventArgs e)
        {
            ClearPsw();
        }

        private void ClearPsw()
        {
            txtOldPsw.Text = string.Empty;
            txtNewPsw.Text = string.Empty;
            txtConformPsw.Text = string.Empty;
            chkShowPws.Checked = false;
        }

        protected void btnChangePhoto_Click(object sender, EventArgs e)
        {
            pnlUploadProfilePic.Visible = true;
            pnlProfileView.Visible = false;
            pnlProfileEdit.Visible = false;

        }

        protected void btnCrop_Click(object sender, EventArgs e)
        {
            try
            {
                string fileName = Path.GetFileName(imgUpload.ImageUrl);
                string filePath = Path.Combine(Server.MapPath("~/Images/UserProfilepics"), fileName);
                string cropFileName = "";
                string cropFilePath = "";
                if (File.Exists(filePath))
                {
                    System.Drawing.Image orgImg = System.Drawing.Image.FromFile(filePath);
                    if (!string.IsNullOrEmpty(W.Value))
                    {
                        Rectangle CropArea = new Rectangle(Convert.ToInt32(X.Value), Convert.ToInt32(Y.Value), Convert.ToInt32(W.Value), Convert.ToInt32(H.Value));

                        Bitmap bitMap = new Bitmap(CropArea.Width, CropArea.Height);
                        using (Graphics g = Graphics.FromImage(bitMap))
                        {
                            g.DrawImage(orgImg, new Rectangle(0, 0, bitMap.Width, bitMap.Height), CropArea, GraphicsUnit.Pixel);
                        }
                        cropFileName = "ImgUser_" + fileName;
                        cropFilePath = Path.Combine(Server.MapPath("~/Images/UserProfilepics"), cropFileName);
                        bitMap.Save(cropFilePath);
                        imgProfilePic.ImageUrl = "~/Images/UserProfilepics/" + cropFileName;
                        Tools.ExecuteNonQuery("UPDATE tbl_User_Details SET UD_PhotoPath = '" + cropFileName + "' WHERE UD_User_Id = " + Tools.UserId.ToString());
                        pnlProfileView.Visible = true;
                        pnlProfileEdit.Visible = false;
                        pnlUploadProfilePic.Visible = false;
                        btnCrop.Visible = false;
                        //Response.Redirect("~/Images/UserProfilepics/" + cropFileName, false);

                    }
                    else
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', 'Please Corp Image.', 'info')", true);
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
            }

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            string uploadFileName = "";
            string uploadFilePath = "";
            if (FileUplod.HasFile)
            {
                string ext = Path.GetExtension(FileUplod.FileName).ToLower();
                if (ext == ".jpg" || ext == ".jpeg" || ext == ".gif" || ext == ".png")
                {
                    uploadFileName = Guid.NewGuid().ToString() + ext;
                    uploadFilePath = Path.Combine(Server.MapPath("~/Images/UserProfilepics"), uploadFileName);
                    try
                    {
                        FileUplod.SaveAs(uploadFilePath);
                        imgUpload.ImageUrl = "~/Images/UserProfilepics/" + uploadFileName;
                        panCrop.Visible = true;
                        btnCrop.Visible = true;
                    }
                    catch (Exception ex)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
                    }
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', 'Selected file type not allowed!', 'warning')", true);
                    //lblMsg.Text = "Selected file type not allowed!";
                }
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', 'Please select file first!', 'warning')", true);
                //lblMsg.Text = "Please select file first!";
            }
        }

        protected void btnCancelImage_Click(object sender, EventArgs e)
        {
            pnlProfileView.Visible = true;
            pnlProfileEdit.Visible = false;
            pnlUploadProfilePic.Visible = false;
            getUserDetails();
        }
    }
}