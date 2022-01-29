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

namespace TravelThings.BackEnd
{
    public partial class frmDashboard : System.Web.UI.Page
    {
        ItransactionAccess dllTransc = new TransactionAccess();
        IappAccess dllApp = new AppAccess();
        Tools tools = new Tools();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(tools.UserId)) { Response.Redirect("~/Login/frmLogin.aspx"); }
            if (!IsPostBack)
            {
                LinkButton li = (LinkButton)Master.FindControl("lbDashboard");
                li.CssClass = "Clicked";
                GetTravelerDetails();
                GetDashBoardDetails();
            }
        }

        private void GetDashBoardDetails()
        {
            try
            {
                DataTable dtDashBoard = dllApp.GetDashboardDetails(tools.UserId);
                if (dtDashBoard.Rows.Count > 0)
                {
                    lblTravelRequest.Text = dtDashBoard.Rows[0]["REQUEST"].ToString();
                    lblSentItems.Text = dtDashBoard.Rows[0]["SEND"].ToString();
                    lblReceivedItems.Text = dtDashBoard.Rows[0]["RECEIVED"].ToString();
                    lblTravelerDetails.Text = dtDashBoard.Rows[0]["TRAVELER"].ToString();
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
            }
        }

        private void GetTravelerDetails()
        {
            try
            {
                DataTable dtTravelerApproval = dllTransc.GetTravelerApprovals(tools.UserId);
                gvTravelRequist.DataSource = dtTravelerApproval;
                gvTravelRequist.DataBind();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
            }
        }

        protected void lbSendItems_Click(object sender, EventArgs e)
        {
            if (lblSentItems.Text.Trim() != "0")
                Response.Redirect("~/BackEnd/frmReports.aspx?Item=Sender", true);
            else
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', 'No Records Found.', 'info')", true);
        }

        protected void lbReceivedItem_Click(object sender, EventArgs e)
        {
            if (lblReceivedItems.Text.Trim() != "0")
                Response.Redirect("~/BackEnd/frmReports.aspx?Item=Received", true);
            else
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', 'No Records Found.', 'info')", true);
        }

        protected void lbTravelDetails_Click(object sender, EventArgs e)
        {
            if (lblTravelerDetails.Text.Trim() != "0")
                Response.Redirect("~/BackEnd/frmReports.aspx?Item=Travel", true);
            else
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', 'No Records Found.', 'info')", true);
        }

        protected void lbTravelRequest_Click(object sender, EventArgs e)
        {
            try
            {
                if (lblTravelRequest.Text.Trim() != "0")
                {
                    pnlDashboard.Visible = false;
                    pnlTravelRequest.Visible = true;
                    //GetTravelerDetails();
                    GetDashBoardDetails();
                }
                else
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', 'No Records Found.', 'info')", true);

            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
            }
        }

        protected void btnBackToDashboard_Click(object sender, EventArgs e)
        {
            try
            {
                pnlDashboard.Visible = true;
                pnlTravelRequest.Visible = false;
                GetDashBoardDetails();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
            }
        }
    }
}