using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TravelThings.DAL.BusinessLogic;
using TravelThings.DAL.Interfaces;
using TravelThings.Helpers;

namespace TravelThings.BackEnd
{
    public partial class tabTest : System.Web.UI.Page
    {
        ItransactionAccess dll = new TransactionAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                TabName.Value = Request.Form[TabName.UniqueID];
            }
            //if (Tools.UserId == 0)
            //    Response.Redirect("~/BackEnd/frmLogin.aspx");
            //if (!IsPostBack)
            //    getItemDetails();
        }

        //protected void btnTest_Click(object sender, EventArgs e)
        //{
        //    //lblMsg.Text = "Success....";
        //}

        //protected void txtName_TextChanged(object sender, EventArgs e)
        //{
        //    //txtName.Text = "Nadeem Qusroo";
        //}

        //protected void btnItemSave_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        DataTable dtItemDetails = dll.InsertItemDetails(Tools.UserId.ToString(), txtItemName.Text.Trim(), txtItemDesc.Text.Trim(), txtWeight.Text.Trim(), ddlItemType.SelectedItem.Text, txtRemarks.Text.Trim());
        //        if (dtItemDetails.Rows.Count > 0)
        //        {
        //            gvItems.DataSource = dtItemDetails;
        //            gvItems.DataBind();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Redirect(Tools.Alert(ex.Message));
        //    }
        //}

        //private void getItemDetails()
        //{
        //    try
        //    {

        //        DataTable dtItemDetails = dll.GetItemDetails(Tools.UserId.ToString());
        //        if (dtItemDetails.Rows.Count > 0)
        //        {
        //            gvItems.DataSource = dtItemDetails;
        //            gvItems.DataBind();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Redirect(Tools.Alert(ex.Message));
        //    }
        //}

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dtTravelers = dll.GetAvailableTravelers(txtFromAdd.Text.Trim(), txtToAdd.Text.Trim(), txtTillDate.Text.Trim());
                gvTravelerAvailablity.DataSource = dtTravelers;
                gvTravelerAvailablity.DataBind();
            }
            catch (Exception ex)
            {
                Response.Redirect(Tools.Alert(ex.Message));
            }
        }
    }
}