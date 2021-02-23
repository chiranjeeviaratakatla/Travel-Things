using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelThings.BackEnd
{
    public partial class frmReports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    LinkButton li = (LinkButton)Master.FindControl("lbReports");
                    li.CssClass = "Clicked";
                    if (Request.QueryString["Item"] != null)
                    {
                        string searchBy = Request.QueryString["Item"].ToString();
                        GetReports(searchBy);
                    }
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
            }
        }

        private void GetReports(string strSearchBy)
        {
            try
            {
                if (strSearchBy == "Sender")
                {
                    ddlTransaction.SelectedItem.Text = "Send Item";
                }
                else if (strSearchBy == "Received")
                {
                    ddlTransaction.SelectedItem.Text = "Receive Item";
                }
                else if (strSearchBy == "Travel")
                {
                    ddlTransaction.SelectedItem.Text = "Travel Details";
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
            }
        }
    }
}