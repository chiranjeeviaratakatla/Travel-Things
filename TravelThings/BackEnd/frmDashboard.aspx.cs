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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Tools.UserId == 0) { Response.Redirect("~/BackEnd/frmLogin.aspx"); }
            if (!IsPostBack)
            {
                LinkButton li = (LinkButton)Master.FindControl("lbDashboard");
                li.CssClass = "Clicked";
                GetTravelerDetails();
            }
        }

        private void GetTravelerDetails()
        {
            try
            {
                DataTable dtTravelerApproval = dllTransc.GetTravelerApprovals(Tools.UserId.ToString());
                gvTravelRequist.DataSource = dtTravelerApproval;
                gvTravelRequist.DataBind();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
            }
        }
    }
}