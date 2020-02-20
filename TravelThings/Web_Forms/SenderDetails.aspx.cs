using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TravelThings.DAL.Interfaces;
using TravelThings.DAL.BusinessLogic;
using System.Data;
using TravelThings.Helpers;

namespace TravelThings.Web_Forms
{
    public partial class SenderDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtArea_TextChanged(object sender, EventArgs e)
        {
            txtSource.Text = GetArea(txtSource.Text);
        }
        
        protected void txtDestination_TextChanged(object sender, EventArgs e)
        {
            txtDestination.Text = GetArea(txtDestination.Text);
        }

        private string GetArea(string inputArea)
        {
            string Area = string.Empty;
            try
            {
                IappAccess dll = new AppAccess();
                Area = dll.GetArea(inputArea.Trim());
            }
            catch (Exception ex)
            {
                Response.Write(Tools.Alert(ex.Message));
            }
            return Area;
        }

        protected void btnGetTravelers_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                IappAccess dll = new AppAccess();
                dt = dll.GetTravelrDetails(txtSource.Text.Trim(),txtDestination.Text.Trim(),Convert.ToDateTime(txtStartingDt.Text.Trim()));
                if (dt.Rows.Count > 0)
                {
                    gvAvilableTravelerList.DataSource = dt;
                    gvAvilableTravelerList.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write(Tools.Alert(ex.Message));
            }
        }

        protected void btnGetBackToHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }
    }
}