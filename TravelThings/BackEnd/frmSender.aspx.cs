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
            if (Tools.UserId == 0)
                Response.Redirect("~/BackEnd/frmLogin.aspx");
            if (!this.IsPostBack)
            {
                Tab1.CssClass = "Clicked";
                MainView.ActiveViewIndex = 0;
                Session["TabId"] = "0";
                getItemDetails(gvItems);
                LinkButton li = (LinkButton)Master.FindControl("lbSender");
                li.CssClass = "Clicked";
            }
        }

        protected void Tab1_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Clicked";
            Tab2.CssClass = "Initial";
            Tab3.CssClass = "Initial";
            btnPayment.CssClass = "Initial";
            MainView.ActiveViewIndex = 0;
            Session["TabId"] = "0";
        }

        protected void Tab2_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Clicked";
            Tab3.CssClass = "Initial";
            btnPayment.CssClass = "Initial";
            MainView.ActiveViewIndex = 1;
            Session["TabId"] = "1";
        }

        protected void Tab3_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Initial";
            Tab3.CssClass = "Clicked";
            btnPayment.CssClass = "Initial";
            MainView.ActiveViewIndex = 2;
            Session["TabId"] = "2";
        }

        protected void btnPayment_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Initial";
            Tab3.CssClass = "Initial";
            btnPayment.CssClass = "Clicked";
            MainView.ActiveViewIndex = 3;
            Session["TabId"] = "3";
        }

        private void getItemDetails(GridView gv)
        {
            try
            {

                DataTable dtItemDetails = dllTranc.GetItemDetails(Tools.UserId.ToString());
                if (dtItemDetails.Rows.Count > 0)
                {
                    gv.DataSource = dtItemDetails;
                    gv.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Redirect(Tools.Alert(ex.Message));
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
                Response.Redirect(Tools.Alert(ex.Message));
            }
        }

        protected void btnItemSave_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dtItemDetails = dllTranc.InsertItemDetails(Tools.UserId.ToString(), txtItemName.Text.Trim(), txtItemDesc.Text.Trim(), txtWeight.Text.Trim(), ddlItemType.SelectedItem.Text, txtRemarks.Text.Trim());
                if (dtItemDetails.Rows.Count > 0)
                {
                    gvItems.DataSource = dtItemDetails;
                    gvItems.DataBind();
                    //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "HidePopup", "$('#popAddItems').modal('hide')", true);

                }
            }
            catch (Exception ex)
            {
                Response.Write(Tools.Alert(ex.Message));
            }
        }

        protected void gvBtnSelect_Click1(object sender, EventArgs e)
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

        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Initial";
            Tab3.CssClass = "Initial";
            btnPayment.CssClass = "Initial";
            int intTabId = Convert.ToInt32(Session["TabId"]);
            if (intTabId == 0)
            {
                btnPayment.CssClass = "Clicked";
                MainView.ActiveViewIndex = 3;
                Session["TabId"] = 3;
            }

            else if (intTabId == 1)
            {
                Tab1.CssClass = "Clicked";
                MainView.ActiveViewIndex = 0;
                Session["TabId"] = 0;
            }
            else if (intTabId == 2)
            {
                Tab2.CssClass = "Clicked";
                MainView.ActiveViewIndex = 1;
                Session["TabId"] = 1;
            }
            if (intTabId == 3)
            {
                Tab3.CssClass = "Clicked";
                MainView.ActiveViewIndex = 2;
                Session["TabId"] = 2;
                btnNext.Visible = true;
            }

        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Initial";
            Tab3.CssClass = "Initial";
            btnPayment.CssClass = "Initial";
            int intTabId = Convert.ToInt32(Session["TabId"]);
            if (intTabId == 0)//Items add
            {
                Tab2.CssClass = "Clicked";
                MainView.ActiveViewIndex = 1;
                Session["TabId"] = 1;
            }

            else if (intTabId == 1)//Traveler Avilability
            {
                Tab3.CssClass = "Clicked";
                MainView.ActiveViewIndex = 2;
                Session["TabId"] = 2;
                //AssignTreaveler();
                AssignItems();
            }
            else if (intTabId == 2)//Reciver
            {
                string strReceiverId = InsertRecieverDetails();
                if (!string.IsNullOrEmpty(strReceiverId))
                    AssignTreaveler(strReceiverId);
                else
                    return;
                btnPayment.CssClass = "Clicked";
                MainView.ActiveViewIndex = 3;
                btnNext.Visible = false;
                Session["TabId"] = 3;
                if (!string.IsNullOrEmpty(lblTrascId.Text.Trim()))
                    GetPaymentSummery();
                else
                    return;
            }
            else if (intTabId == 3)//Payment
            {
                Tab1.CssClass = "Clicked";
                MainView.ActiveViewIndex = 0;
                Session["TabId"] = 0;
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
                Response.Write(Tools.Alert(ex.Message));
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
                Response.Write(Tools.Alert(ex.Message));
            }
        }
        private void AssignItems()
        {
            try
            {
                Tools.ExecuteQuery("DELETE FROM tbl_Item_Transaction_Details WHERE UTD_Sno = '" + lblTrascId.Text.Trim() + "'");
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
                Response.Write(Tools.Alert(ex.Message));
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
                Response.Write(Tools.Alert(ex.Message));
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
                Response.Write(Tools.Alert(ex.Message));
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
                Response.Write(Tools.Alert(ex.Message));
            }
        }

        protected void gvItems_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvItems.Rows[rowIndex];

                if (e.CommandName == "Select")
                {
                    txtItemName.Text = row.Cells[3].Text;
                    //txtTo.Text = row.Cells[3].Text;
                    //if (!string.IsNullOrEmpty(row.Cells[4].Text) && row.Cells[4].Text != "&nbsp;")
                    //    ddlTravelBy.SelectedItem.Text = row.Cells[4].Text;
                    //txtStartDate.Text = Convert.ToDateTime(row.Cells[5].Text).ToString("yyyy-MM-dd");
                    //txtEndDate.Text = Convert.ToDateTime(row.Cells[6].Text).ToString("yyyy-MM-dd");
                    //if (!string.IsNullOrEmpty(row.Cells[7].Text) && row.Cells[7].Text != "&nbsp;")
                    //    txtWeightCanCarry.Text = row.Cells[7].Text;
                }
                else if (e.CommandName == "Delete")
                {
                    
                }
            }
            catch (Exception ex)
            {
                Response.Write(Tools.Alert(ex.Message));
            }
        }
    }
}