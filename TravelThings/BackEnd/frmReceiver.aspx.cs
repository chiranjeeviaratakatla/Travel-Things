using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using TravelThings.DAL.BusinessLogic;
using TravelThings.DAL.Interfaces;
using TravelThings.Helpers;

namespace TravelThings.BackEnd
{
    public partial class frmReceiver : System.Web.UI.Page
    {
        ItransactionAccess dll = new TransactionAccess();
        Tools tools = new Tools();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                HiddenField UserID = (HiddenField)Master.FindControl("hfUserID");
                if (string.IsNullOrEmpty(UserID.Value)) { UserID.Value = tools.UserId; }
                if (string.IsNullOrEmpty(UserID.Value)) { Response.Redirect("~/Login/frmLogin.aspx"); }
                LinkButton li = (LinkButton)Master.FindControl("lbReciver");
                li.CssClass = "Clicked";
                GetReceivingItems();
            }
        }

        private void GetReceivingItems()
        {
            try
            {
                gvReceiver.DataSource = dll.GetReceivingItem(tools.UserId);
                gvReceiver.DataBind();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
            }
        }
    }
}