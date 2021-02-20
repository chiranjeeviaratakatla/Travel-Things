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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LinkButton li = (LinkButton)Master.FindControl("lbReciver");
                li.CssClass = "Clicked";
                GetReceivingItems();
            }
        }

        private void GetReceivingItems()
        {
            try
            {
                gvReceiver.DataSource = dll.GetReceivingItem(Tools.UserId.ToString());
                gvReceiver.DataBind();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
            }
        }
    }
}