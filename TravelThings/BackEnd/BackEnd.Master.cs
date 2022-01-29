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
    }
}