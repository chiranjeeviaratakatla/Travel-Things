using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using TravelThings.DAL.BusinessLogic;
using TravelThings.DAL.Interfaces;
using TravelThings.Helpers;
using System.Drawing;

namespace TravelThings.BackEnd
{
    public partial class test : System.Web.UI.Page
    {
        ItransactionAccess dllTranc = new TransactionAccess();
        IUserAccess dllUser = new UserAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Tools.UserId == 0)
                    Response.Redirect("~/Login/frmLogin.aspx");
                if (!this.IsPostBack)
                {
                    tabItem.CssClass = "Clicked";
                    MainViewItem.ActiveViewIndex = 0;
                    Session["TabId"] = "0";
                    getItemDetails(gvItems);
                    LinkButton li = (LinkButton)Master.FindControl("lbSender");
                    li.CssClass = "Clicked";
                    btnPrevious.Visible = false;
                    btnNext.Visible = true;
                    GetItemTypes();
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
            }
        }

        private void GetItemTypes()
        {
            try
            {
                DataTable dtItemTypes = dllTranc.GetAllItemTyps();
                ddlItemType.DataSource = dtItemTypes;
                ddlItemType.DataTextField = "I_Description";
                ddlItemType.DataValueField = "I_Type_ID";
                ddlItemType.DataBind();
                ListItem item = new ListItem();
                item.Text = "Select Item Type";
                item.Value = "-1";

                this.ddlItemType.Items.Insert(0, item);
            }
            catch
            {
                throw;
            }
        }

        protected void tabItem_Click(object sender, EventArgs e)
        {
            tabItem.CssClass = "Clicked";
            tabDestination.CssClass = "Initial";
            tabReceiver.CssClass = "Initial";
            btnPayment.CssClass = "Initial";
            MainViewItem.ActiveViewIndex = 0;
            Session["TabId"] = "0";
            btnPrevious.Visible = false;
        }

        protected void tabDestination_Click(object sender, EventArgs e)
        {
            tabItem.CssClass = "Initial";
            tabDestination.CssClass = "Clicked";
            tabReceiver.CssClass = "Initial";
            btnPayment.CssClass = "Initial";
            MainViewItem.ActiveViewIndex = 1;
            Session["TabId"] = "1";
            btnPrevious.Visible = true;
        }

        protected void tabReceiver_Click(object sender, EventArgs e)
        {
            tabItem.CssClass = "Initial";
            tabDestination.CssClass = "Initial";
            tabReceiver.CssClass = "Clicked";
            btnPayment.CssClass = "Initial";
            MainViewItem.ActiveViewIndex = 2;
            Session["TabId"] = "2";
            btnPrevious.Visible = true;
        }

        protected void btnPayment_Click(object sender, EventArgs e)
        {
            tabItem.CssClass = "Initial";
            tabDestination.CssClass = "Initial";
            tabReceiver.CssClass = "Initial";
            btnPayment.CssClass = "Clicked";
            MainViewItem.ActiveViewIndex = 3;
            Session["TabId"] = "3";
            btnPrevious.Visible = true;
        }

        private void getItemDetails(GridView gv)
        {
            try
            {
                DataTable dtItemDetails = dllTranc.GetItemDetails(Tools.UserId.ToString());
                gv.DataSource = dtItemDetails;
                gv.DataBind();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
                //Response.Redirect(Tools.Alert(ex.Message));
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dtTravelers = dllTranc.GetAvailableTravelers(Tools.UserId.ToString(), txtFromAdd.Text.Trim(), txtToAdd.Text.Trim(), txtTillDate.Text.Trim());
                gvTravelerAvailablity.DataSource = dtTravelers;
                gvTravelerAvailablity.DataBind();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
                //Response.Redirect(Tools.Alert(ex.Message));
            }
        }

        protected void btnItemSave_Click(object sender, EventArgs e)
        {
            SaveItem(false);
        }

        private void SaveItem(bool blnShowPopUp)
        {
            try
            {
                string strErrorMsg = ValidateItem();
                if (string.IsNullOrEmpty(strErrorMsg))
                {
                    DataTable dtItemDetails = dllTranc.InsertItemDetails(Tools.UserId.ToString(), txtItemName.Text.Trim(), txtItemDesc.Text.Trim(), txtWeight.Text.Trim(), Convert.ToInt32(ddlItemType.SelectedValue), txtRemarks.Text.Trim());
                    gvItems.DataSource = dtItemDetails;
                    gvItems.DataBind();
                    ClearItems();
                    if (!blnShowPopUp)
                    {
                        pnlItem.Visible = false;
                        MainViewItem.Visible = true;
                        pnlNav.Visible = true;
                    }
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + strErrorMsg + "', 'warning')", true);
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
            }
        }

        private string ValidateItem()
        {
            string strErrorMsg = string.Empty;
            try
            {
                if (string.IsNullOrEmpty(txtItemName.Text.Trim()))
                    strErrorMsg = "Please Enter Item Name";
                else if (string.IsNullOrEmpty(txtWeight.Text.Trim()) || Convert.ToInt32(txtWeight.Text.Trim()) < 0)
                    strErrorMsg = "Please Enter Valid Item Weight in KG's";
                else if (ddlItemType.SelectedItem.Text == "Select Item Type")
                    strErrorMsg = "Please Select Item Type";
            }
            catch (Exception ex)
            {
                strErrorMsg = ex.Message;
                throw;
            }
            return strErrorMsg;
        }

        private void ClearItems()
        {
            txtItemName.Text = string.Empty;
            txtItemDesc.Text = string.Empty;
            txtWeight.Text = string.Empty;
            ddlItemType.SelectedIndex = 0;
            txtRemarks.Text = string.Empty;
        }

        protected void gvBtnSelect_Click1(object sender, EventArgs e)
        {
            try
            {
                if (Session["PreviousRowIndex"] != null)
                {
                    var previousRowIndex = (int)Session["PreviousRowIndex"];
                    GridViewRow PreviousRow = gvTravelerAvailablity.Rows[previousRowIndex];
                    //PreviousRow.ForeColor = Color.White;
                    PreviousRow.Attributes.Add("style", "background-image: linear-gradient(to right,#37a0bc00 0%,#273f7f00 100%);color: black;");
                }

                GridViewRow row = (GridViewRow)((Button)sender).NamingContainer;
                //row.BackColor = Color.Blue;
                //row.Attributes.Add("onmouseover", "this.style.cursor='hand';this.style.backgroundColor='yellow'");
                row.ForeColor = Color.White;
                row.Attributes.Add("style", "background-image: linear-gradient(to right,#37a0bc 0%,#273f7f 100%); color: white;");
                Session["PreviousRowIndex"] = row.RowIndex;
                pnlTraveler.Visible = true;
                lblTravelerNam.Text = row.Cells[2].Text;
                lblStartdate.Text = row.Cells[3].Text;
                lblFrom.Text = row.Cells[7].Text;
                lblTo.Text = row.Cells[8].Text;
                lblTravelBy.Text = row.Cells[5].Text;
                lblWeight.Text = row.Cells[6].Text;
                lblTrascId.Text = ((HiddenField)row.FindControl("hfTrancId")).Value.ToString();
                pnlSearchTravelers.Visible = false;
                pnlTravelerAvailablity.Visible = false;
                pnlItemSelection.Visible = true;
                getItemDetails(gvItemSelection);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
                //Response.Write(Tools.Alert(ex.Message));
            }

        }

        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            tabItem.CssClass = "Initial";
            tabDestination.CssClass = "Initial";
            tabReceiver.CssClass = "Initial";
            btnPayment.CssClass = "Initial";
            int intTabId = Convert.ToInt32(Session["TabId"]);
            if (intTabId == 0)//Items add
            {
                //btnPayment.CssClass = "Clicked";
                //MainViewItem.ActiveViewIndex = 3;
                //Session["TabId"] = 3;
                btnContinue.Visible = true;
            }

            else if (intTabId == 1)//Destination
            {
                tabItem.CssClass = "Clicked";
                MainViewItem.ActiveViewIndex = 0;
                Session["TabId"] = 0;
                btnPrevious.Visible = false;
            }
            else if (intTabId == 2)//Reciver
            {
                tabDestination.CssClass = "Clicked";
                MainViewItem.ActiveViewIndex = 1;
                Session["TabId"] = 1;
                btnContinue.Visible = true;
            }
            if (intTabId == 3)//Payment
            {
                tabReceiver.CssClass = "Clicked";
                MainViewItem.ActiveViewIndex = 2;
                Session["TabId"] = 2;
                btnNext.Visible = true;
                btnContinue.Visible = true;
            }

        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            tabItem.CssClass = "Initial";
            tabDestination.CssClass = "Initial";
            tabReceiver.CssClass = "Initial";
            btnPayment.CssClass = "Initial";
            int intTabId = Convert.ToInt32(Session["TabId"]);
            if (intTabId == 0)//Items add
            {
                tabDestination.CssClass = "Clicked";
                MainViewItem.ActiveViewIndex = 1;
                Session["TabId"] = 1;
                btnPrevious.Visible = true;
            }

            else if (intTabId == 1)//Destination
            {
                tabReceiver.CssClass = "Clicked";
                MainViewItem.ActiveViewIndex = 2;
                Session["TabId"] = 2;
                //AssignTreaveler();
                AssignItems();
                btnPrevious.Visible = true;
            }
            else if (intTabId == 2)//Reciver
            {
                string strReceiverId = InsertRecieverDetails();
                if (!string.IsNullOrEmpty(strReceiverId))
                    AssignTreaveler(strReceiverId);
                else
                    return;
                btnPayment.CssClass = "Clicked";
                MainViewItem.ActiveViewIndex = 3;
                btnNext.Visible = false;
                Session["TabId"] = 3;
                if (!string.IsNullOrEmpty(lblTrascId.Text.Trim()))
                    GetPaymentSummery();
                else
                    return;
                btnPrevious.Visible = true;
            }
            else if (intTabId == 3)//Payment
            {
                //tabItem.CssClass = "Clicked";
                //MainViewItem.ActiveViewIndex = 0;
                //Session["TabId"] = 0;
                btnPrevious.Visible = true;
            }

        }

        protected void lbtnEditTraveler_Click(object sender, EventArgs e)
        {
            pnlSearchTravelers.Visible = true;
            pnlTravelerAvailablity.Visible = true;
            pnlTraveler.Visible = false;
            pnlItemSelection.Visible = false;
        }
        private string InsertRecieverDetails()
        {
            string strReceiverId = string.Empty;
            try
            {
                //string strErrorMsg = Validation();
                //if (string.IsNullOrEmpty(strErrorMsg))
                //{

                string strPassword = Tools.CreateRandomPassword();
                strPassword = Tools.Encryptdata(strPassword);
                DataTable dtResult = dllUser.InsertUserDetails(txtRecName.Text.Trim(), txtRecPhoneNo.Text.Trim(), txtRecAltPhoneNo.Text.Trim(), txtRecEmail.Text.Trim(), strPassword);
                if (dtResult.Rows.Count > 0)
                {
                    if (dtResult.Rows[0]["USER_TYPE"].ToString() == "CREATED")
                    {
                        strReceiverId = dtResult.Rows[0]["UD_User_Id"].ToString();
                    }
                    else
                    {
                        strReceiverId = dtResult.Rows[0]["UD_User_Id"].ToString();
                    }
                }

                //}
                //else
                //    Response.Write(Tools.Alert(strErrorMsg));
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
                //Response.Write(Tools.Alert(ex.Message));
            }
            return strReceiverId;
        }

        private void AssignTreaveler(string strReceiver)
        {
            try
            {
                dllTranc.AssignTraveler(lblTrascId.Text.Trim(), Tools.UserId.ToString(), strReceiver);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
                //Response.Write(Tools.Alert(ex.Message));
            }
        }
        private void AssignItems()
        {
            try
            {
                Tools.ExecuteNonQuery("DELETE FROM tbl_Item_Transaction_Details WHERE UTD_Sno = '" + lblTrascId.Text.Trim() + "'");
                foreach (GridViewRow row in gvItemSelection.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        CheckBox c = (CheckBox)row.FindControl("chkSelect");
                        if (c.Checked)
                        {
                            string strItemId = ((HiddenField)row.FindControl("hfItemId")).Value.ToString();
                            dllTranc.AssignItems(lblTrascId.Text.Trim(), strItemId);
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
                //Response.Write(Tools.Alert(ex.Message));
            }
        }

        private void GetPaymentSummery()
        {
            try
            {
                DataSet dsPaymentSummery = dllTranc.GetPaymentSummery(lblTrascId.Text.Trim());
                if (dsPaymentSummery.Tables.Count > 0)
                {
                    //Receiver Summery
                    lblSmryReceiverId.Text = dsPaymentSummery.Tables[0].Rows[0]["UD_User_Id"].ToString();
                    lblSmryReceiverName.Text = dsPaymentSummery.Tables[0].Rows[0]["UD_User_Name"].ToString();
                    lblSmryReceiverAddress.Text = dsPaymentSummery.Tables[0].Rows[0]["TD_Item_To"].ToString();
                    //Traveler Summery
                    lblSmryTravelerName.Text = dsPaymentSummery.Tables[1].Rows[0]["UD_User_Name"].ToString();
                    lblSmryStartJourney.Text = dsPaymentSummery.Tables[1].Rows[0]["TD_Strating_Dt"].ToString();
                    lblSmryEndJourney.Text = dsPaymentSummery.Tables[1].Rows[0]["TD_Ending_Dt"].ToString();
                    //Item Summery
                    gvItemSummery.DataSource = dsPaymentSummery.Tables[2];
                    gvItemSummery.DataBind();
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
                //Response.Write(Tools.Alert(ex.Message));
            }
        }

        protected void chkSelectAll_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                CheckBox chkSelectAll = (CheckBox)gvItemSelection.HeaderRow.FindControl("chkSelectAll");
                foreach (GridViewRow row in gvItemSelection.Rows)
                {
                    CheckBox chkSelect = (CheckBox)row.FindControl("chkSelect");
                    if (chkSelectAll.Checked == true)
                        chkSelect.Checked = true;
                    else
                        chkSelect.Checked = false;
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
                //Response.Write(Tools.Alert(ex.Message));
            }
        }

        protected void gvBtnSelect_Click(object sender, EventArgs e)
        {
            try
            {
                GridViewRow row = (GridViewRow)((Button)sender).NamingContainer;
                string strItemId = ((HiddenField)row.FindControl("hfTrancId")).Value.ToString();

            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
                //Response.Write(Tools.Alert(ex.Message));
            }
        }

        protected void gvItems_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvItems.Rows[rowIndex];
                HiddenField hfItemId = (HiddenField)gvItems.Rows[rowIndex].FindControl("hfSelectedItemId");
                if (e.CommandName == "EditItem")
                {
                    pnlItem.Visible = true;
                    pnlNav.Visible = false;
                    MainViewItem.Visible = false;
                    txtItemName.Text = row.Cells[2].Text;
                    txtItemDesc.Text = row.Cells[3].Text;
                    txtWeight.Text = row.Cells[4].Text;
                    ddlItemType.SelectedItem.Text = row.Cells[5].Text;
                    txtRemarks.Text = row.Cells[6].Text;
                }
                else if (e.CommandName == "DeleteItem")
                {
                    bool blnResult = Tools.ExecuteNonQuery("DELETE FROM tbl_Item_Details WHERE I_SlNo =" + hfItemId.Value);
                    if (blnResult)
                        getItemDetails(gvItems);
                    else
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', 'Please Try Again!', 'warning')", true);

                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
                //Response.Write(Tools.Alert(ex.Message));
            }
        }

        protected void btnAddItems_Click(object sender, EventArgs e)
        {
            pnlItem.Visible = true;
            MainViewItem.Visible = false;
            pnlNav.Visible = false;
        }

        protected void btnCloseModel_Click(object sender, EventArgs e)
        {
            pnlItem.Visible = false;
            MainViewItem.Visible = true;
            pnlNav.Visible = true;
            ClearItems();
        }

        protected void btnContinueItem_Click(object sender, EventArgs e)
        {
            SaveItem(true);
            ClearItems();
        }
    }
}