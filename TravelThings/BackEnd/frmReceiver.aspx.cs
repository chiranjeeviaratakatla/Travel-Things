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
                Response.Write(Tools.Alert(ex.Message));
            }
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            //ShowNotification("hello", WarningType.Success);
            ClientScript.RegisterClientScriptBlock(this.GetType(), "k","swal('Good job!', 'You clicked the button!', 'success')", true);
        }

        //protected void ShowMessage(string Message, MessageType type)
        //{
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
        //}


        public enum WarningType
        {
            Success,
            Info,
            Warning,
            Danger
        }

        public void ShowNotification(string message, WarningType type)
        {
            var mainContentHolder = Master.FindControl("ContentPlaceHolder1") as ContentPlaceHolder;
            Panel notificationPanel = new Panel();
            {
                LiteralControl closeButton = new LiteralControl();
                closeButton.Text = "<a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>";

                Label notificationMessage = new Label() { Text = message };

                notificationPanel.Controls.Add(closeButton);
                notificationPanel.Controls.Add(notificationMessage);
            }
            notificationPanel.CssClass = string.Format("alert alert-{0} alert-dismissable", type.ToString().ToLower());
            notificationPanel.Attributes.Add("role", "alert");
            notificationPanel.Attributes.Add("id", "success-alert");
            mainContentHolder.Controls.AddAt(0, notificationPanel);
        }

    }
}