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
                }
            }
            catch (Exception ex)
            {
                Response.Redirect(Tools.Alert(ex.Message));
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
            string outlookid = ((Label)row.FindControl("TD_Traveler_Id")).Text;
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
            }
            else if (intTabId == 2)//Reciver
            {
                btnPayment.CssClass = "Clicked";
                MainView.ActiveViewIndex = 3;
                Session["TabId"] = 3;
                //InsertRecieverDetails();
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
        private void InsertRecieverDetails()
        {
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
                    if(dtResult.Rows[0]["USER_TYPE"].ToString() == "CREATED")
                    {
                        lblReceiverId.Text = dtResult.Rows[0]["UD_User_Id"].ToString();
                    }
                    else
                    {
                        lblReceiverId.Text = dtResult.Rows[0]["UD_User_Id"].ToString();
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
        }
    }
}