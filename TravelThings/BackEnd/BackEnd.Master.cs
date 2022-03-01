using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TravelThings.Helpers;

namespace TravelThings.BackEnd
{
    public partial class BackEnd : System.Web.UI.MasterPage
    {
        Tools tools = new Tools();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {
                lbProfile.Text = tools.UserName;
                hfUserID.Value = tools.UserId;
                //lbDashboard.CssClass = "Clicked";
            }
            //else
            //    ActiveNavigation();
            //if (!Page.IsPostBack && this.IsPostBack)
            //    ActiveNavigation();
        }

        private void ActiveNavigation()
        {
            //Active Navigation Link buttion show
            string eTarget = Request.Params["__EVENTTARGET"].ToString();
            if (eTarget.Contains("lb"))
            {
                string strControlName = eTarget.Remove(0, 6);
                LinkButton clickedButton = (LinkButton)FindControl(strControlName);
                clickedButton.CssClass = "Clicked";
            }
        }

        protected void lbDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/BackEnd/frmDashboard.aspx", false);
        }

        protected void lbSender_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/BackEnd/frmSender.aspx", false);
        }

        protected void lbTraveler_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/BackEnd/frmTraveler.aspx", false);
        }

        protected void lbReports_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/BackEnd/frmReports.aspx", false);
        }

        protected void lbAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/BackEnd/frmAdmin.aspx", false);
        }

        protected void lbProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/BackEnd/frmProfile.aspx", false);
        }

        protected void lbLogout_Click(object sender, EventArgs e)
        {
            hfUserID.Value = null;
            tools.UserId = string.Empty;
            Response.Redirect("~/Index.aspx", false);
        }
    }
}