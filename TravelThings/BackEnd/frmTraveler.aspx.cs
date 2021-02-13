using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using TravelThings.DAL.Interfaces;
using TravelThings.DAL.BusinessLogic;
using TravelThings.Helpers;

namespace TravelThings.BackEnd
{
    public partial class frmTraveler : System.Web.UI.Page
    {
        ItransactionAccess dll = new TransactionAccess();
        private string strTransId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Tools.UserId == 0)
                Response.Redirect("~/BackEnd/frmLogin.aspx");
            if (!IsPostBack)
                GetTravelDetails();
           LinkButton li = (LinkButton)Master.FindControl("lbTraveler");
            li.CssClass = "Clicked";
        }

        protected void btnAddJourney_Click(object sender, EventArgs e)
        {
            try
            {
                string strError = ValidateFields();
                if (!string.IsNullOrEmpty(strError))
                {
                    bool blnResult = dll.InsertTransactionDetails(Tools.UserId.ToString(), txtFrom.Text.Trim(), txtTo.Text.Trim(), Convert.ToInt32(txtWeightCanCarry.Text.Trim()), Convert.ToDateTime(txtStartDate.Text.Trim()), Convert.ToDateTime(txtEndDate.Text.Trim()), ddlTravelBy.SelectedItem.Text);
                    if (blnResult)
                    {
                        ClearContols();
                        GetTravelDetails();
                    }
                }
                else
                {
                    Response.Write(Tools.Alert(strError));
                }

            }
            catch (Exception ex)
            {
                Response.Write(Tools.Alert(ex.Message));
            }
        }

        private void ClearContols()
        {
            try
            {
                btnAddJourney.Visible = true;
                btnEditJourney.Visible = false;
                txtFrom.Text = string.Empty;
                txtTo.Text = string.Empty;
                txtStartDate.Text = string.Empty;
                txtEndDate.Text = string.Empty;
                ddlTravelBy.SelectedIndex = 0;
                txtWeightCanCarry.Text = string.Empty;
            }
            catch (Exception ex)
            {
                Response.Write(Tools.Alert(ex.Message));
            }
        }
        private void GetTravelDetails()
        {
            try
            {
                if (Tools.UserId != 0)
                {
                    DataTable dtTravelDetails = new DataTable();
                    dtTravelDetails = dll.GetITransactionDetails(Tools.UserId.ToString());
                    if (dtTravelDetails.Rows.Count > 0)
                    {
                        gvJourney.DataSource = dtTravelDetails;
                        gvJourney.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(Tools.Alert(ex.Message));
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearContols();
        }

        protected void gvJourney_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvJourney.Rows[rowIndex];

                if (e.CommandName == "Select")
                {
                    btnAddJourney.Visible = false;
                    btnEditJourney.Visible = true;
                    Session["strTransId"] = row.Cells[8].Text;
                    txtFrom.Text = row.Cells[2].Text;
                    txtTo.Text = row.Cells[3].Text;
                    if (!string.IsNullOrEmpty(row.Cells[4].Text) && row.Cells[4].Text != "&nbsp;")
                        ddlTravelBy.SelectedItem.Text = row.Cells[4].Text;
                    txtStartDate.Text = Convert.ToDateTime(row.Cells[5].Text).ToString("yyyy-MM-dd");
                    txtEndDate.Text = Convert.ToDateTime(row.Cells[6].Text).ToString("yyyy-MM-dd");
                    if (!string.IsNullOrEmpty(row.Cells[7].Text) && row.Cells[7].Text != "&nbsp;")
                        txtWeightCanCarry.Text = row.Cells[7].Text;
                }
                else if (e.CommandName == "Delete")
                {
                    string strTransId = row.Cells[8].Text;
                    bool blnResult = dll.DeleteTransactionDetails(strTransId);
                    if (blnResult)
                    {
                        GetTravelDetails();
                    }

                }
            }
            catch (Exception ex)
            {
                Response.Write(Tools.Alert(ex.Message));
            }
        }

        protected void btnEditJourney_Click(object sender, EventArgs e)
        {
            try
            {
                string strError = ValidateFields();
                if (!string.IsNullOrEmpty(strError))
                {
                    string strTransId = Session["strTransId"].ToString();
                    if (!string.IsNullOrEmpty(strTransId))
                    {
                        bool blnResult = dll.UpdateTransactionDetails(strTransId, txtFrom.Text.Trim(), txtTo.Text.Trim(), Convert.ToInt32(txtWeightCanCarry.Text.Trim()), Convert.ToDateTime(txtStartDate.Text.Trim()), Convert.ToDateTime(txtEndDate.Text.Trim()), ddlTravelBy.SelectedItem.Text);
                        if (blnResult)
                        {
                            ClearContols();
                            GetTravelDetails();
                        }
                    }
                }
                else
                {
                    Response.Write(Tools.Alert(strError));
                }
            }
            catch (Exception ex)
            {
                Response.Write(Tools.Alert(ex.Message));
            }
        }

        private string ValidateFields()
        {
            string strError = string.Empty;
            if (!string.IsNullOrEmpty(txtFrom.Text.Trim()))
            {
                txtFrom.Focus();
                strError = "Please Enter From Address";
            }
            else if (!string.IsNullOrEmpty(txtTo.Text.Trim()))
            {
                txtTo.Focus();
                strError = "Please Enter To Address";
            }
            else if (ddlTravelBy.SelectedItem.Text == "Select Travel By Vechicle")
            {
                ddlTravelBy.Focus();
                strError = "Please Select Travel By Vechicle";
            }
            else if (!string.IsNullOrEmpty(txtStartDate.Text.Trim()) || txtStartDate.Text == "dd-mm-yyyy")
            {
                txtStartDate.Focus();
                strError = "Please Select To Start Date";
            }
            else if (!string.IsNullOrEmpty(txtEndDate.Text.Trim()) || txtEndDate.Text == "dd-mm-yyyy")
            {
                txtEndDate.Focus();
                strError = "Please Select To End Date";
            }
            else if (!string.IsNullOrEmpty(txtWeightCanCarry.Text.Trim()))
            {
                txtWeightCanCarry.Focus();
                strError = "Please Enter Weight";
            }
            return strError;
        }
    }
}