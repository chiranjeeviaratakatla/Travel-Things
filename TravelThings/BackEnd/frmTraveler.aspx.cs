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
using System.Globalization;
using System.Net;
using System.IO;
using System.Text;

namespace TravelThings.BackEnd
{
    public partial class frmTraveler : System.Web.UI.Page
    {
        ItransactionAccess dll = new TransactionAccess();
        Tools tools = new Tools();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    HiddenField UserID = (HiddenField)Master.FindControl("hfUserID");
                    if (string.IsNullOrEmpty(UserID.Value)) { UserID.Value = tools.UserId; }
                    if (string.IsNullOrEmpty(UserID.Value)) { Response.Redirect("~/Login/frmLogin.aspx"); }
                    GetTravelDetails();
                    gvJourney.HeaderRow.Cells[2].Attributes["data-class"] = "expand";

                    //Attribute to hide column in Phone.
                    gvJourney.HeaderRow.Cells[1].Attributes["data-hide"] = "phone";
                    gvJourney.HeaderRow.Cells[0].Attributes["data-hide"] = "phone";
                    gvJourney.HeaderRow.Cells[3].Attributes["data-hide"] = "phone";
                    gvJourney.HeaderRow.Cells[4].Attributes["data-hide"] = "phone";
                    gvJourney.HeaderRow.Cells[5].Attributes["data-hide"] = "phone";
                    gvJourney.HeaderRow.Cells[6].Attributes["data-hide"] = "phone";
                    gvJourney.HeaderRow.Cells[7].Attributes["data-hide"] = "phone";
                    //Adds THEAD and TBODY to GridView.
                    gvJourney.HeaderRow.TableSection = TableRowSection.TableHeader;

                    GetVehicleDetails();
                    LinkButton li = (LinkButton)Master.FindControl("lbTraveler");
                    li.CssClass = "Clicked";
                    txtStartDate.Text = DateTime.Now.ToLocalTime().ToString("yyyy-MM-ddTHH:mm");
                    txtEndDate.Text = DateTime.Today.AddDays(1).ToLocalTime().ToString("yyyy-MM-ddTHH:mm");
                    txtStartDate.Attributes["min"] = DateTime.Now.ToLocalTime().ToString("yyyy-MM-ddTHH:mm");
                    txtEndDate.Attributes["min"] = DateTime.Now.ToLocalTime().ToString("yyyy-MM-ddTHH:mm");
                    txtStartDate.Attributes["max"] = DateTime.Today.AddDays(90).ToLocalTime().ToString("yyyy-MM-ddTHH:mm");
                    txtEndDate.Attributes["max"] = DateTime.Today.AddDays(90).ToLocalTime().ToString("yyyy-MM-ddTHH:mm");
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
            }
        }

        protected void btnAddJourney_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = GetCoordinates(txtFrom.Text);
                //string strError = ValidateFields();
                //if (string.IsNullOrEmpty(strError))
                //{

                //    bool blnResult = dll.InsertTransactionDetails(tools.UserId, txtFrom.Text.Trim(), txtTo.Text.Trim(), Convert.ToInt32(txtWeightCanCarry.Text.Trim()), Convert.ToDateTime(txtStartDate.Text.Trim()), Convert.ToDateTime(txtEndDate.Text.Trim()), ddlTravelBy.SelectedItem.Text);
                //    if (blnResult)
                //    {
                //        ClearContols();
                //        GetTravelDetails();
                //    }
                //}
                //else
                //{
                //    //Response.Write(Tools.Alert(strError));
                //    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + strError + "', 'warning')", true);
                //}

            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
                //Response.Write(Tools.Alert(ex.Message));
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
                txtStartDate.Text = DateTime.Now.ToLocalTime().ToString("yyyy-MM-ddTHH:mm");
                txtEndDate.Text = DateTime.Today.AddDays(1).ToLocalTime().ToString("yyyy-MM-ddTHH:mm");
                txtStartDate.Attributes["min"] = DateTime.Now.ToLocalTime().ToString("yyyy-MM-ddTHH:mm");
                txtEndDate.Attributes["min"] = DateTime.Now.ToLocalTime().ToString("yyyy-MM-ddTHH:mm");
                txtStartDate.Attributes["max"] = DateTime.Today.AddDays(90).ToLocalTime().ToString("yyyy-MM-ddTHH:mm");
                txtEndDate.Attributes["max"] = DateTime.Today.AddDays(90).ToLocalTime().ToString("yyyy-MM-ddTHH:mm");
                ddlTravelBy.SelectedItem.Text = "Select Travel By Vechicle";
                txtWeightCanCarry.Text = string.Empty;
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
                //Response.Write(Tools.Alert(ex.Message));
            }
        }
        private void GetVehicleDetails()
        {
            try
            {
                DataTable dtVehicleDetails = new DataTable();
                dtVehicleDetails = dll.GetAllVehicle();
                if (dtVehicleDetails.Rows.Count > 0)
                {
                    ddlTravelBy.DataSource = dtVehicleDetails;
                    ddlTravelBy.DataTextField = "V_Name";
                    ddlTravelBy.DataValueField = "V_ID";

                    ddlTravelBy.DataBind();
                    ListItem item = new ListItem();
                    item.Text = "Select Travel By Vechicle";
                    item.Value = "-1";

                    this.ddlTravelBy.Items.Insert(0, item);
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
            }
        }
        private void GetTravelDetails()
        {
            try
            {
                if (!string.IsNullOrEmpty(tools.UserId))
                {
                    DataTable dtTravelDetails = new DataTable();
                    dtTravelDetails = dll.GetITransactionDetails(tools.UserId);
                    if (dtTravelDetails.Rows.Count > 0)
                    {
                        gvJourney.DataSource = dtTravelDetails;
                        gvJourney.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
                //Response.Write(Tools.Alert(ex.Message));
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

                if (e.CommandName == "EditJourney")
                {
                    btnAddJourney.Visible = false;
                    btnEditJourney.Visible = true;
                    Session["strTransId"] = row.Cells[8].Text;
                    txtFrom.Text = row.Cells[2].Text;
                    txtTo.Text = row.Cells[3].Text;
                    if (!string.IsNullOrEmpty(row.Cells[4].Text) && row.Cells[4].Text != "&nbsp;")
                        ddlTravelBy.SelectedItem.Text = row.Cells[4].Text;
                    txtStartDate.Text = DateTime.ParseExact(row.Cells[5].Text, "yyyy-MM-dd H:mm:ss tt", CultureInfo.InvariantCulture).ToLocalTime().ToString("yyyy-MM-ddTHH:mm");
                    txtEndDate.Text = Convert.ToDateTime(row.Cells[6].Text).ToLocalTime().ToString("yyyy-MM-ddTHH:mm");
                    if (!string.IsNullOrEmpty(row.Cells[7].Text) && row.Cells[7].Text != "&nbsp;")
                        txtWeightCanCarry.Text = row.Cells[7].Text;
                }
                else if (e.CommandName == "DeleteItem")
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
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
                //Response.Write(Tools.Alert(ex.Message));
            }
        }

        protected void btnEditJourney_Click(object sender, EventArgs e)
        {
            try
            {
                string strError = ValidateFields();
                if (string.IsNullOrEmpty(strError))
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
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + strError + "', 'warning')", true);
                    //Response.Write(Tools.Alert(strError));
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
                //Response.Write(Tools.Alert(ex.Message));
            }
        }

        private string ValidateFields()
        {
            
            string strError = string.Empty;
            if (string.IsNullOrEmpty(txtFrom.Text.Trim()))
            {
                txtFrom.Focus();
                strError = "Please Enter From Address";
            }
            else if (!Tools.CheckAddressExists(txtFrom.Text.Trim()))
            {
                txtFrom.Focus();
                strError = "Invalid From Address";
            }
            else if (string.IsNullOrEmpty(txtTo.Text.Trim()))
            {
                txtTo.Focus();
                strError = "Please Enter To Address";
            }
            else if (!Tools.CheckAddressExists(txtTo.Text.Trim()))
            {
                txtFrom.Focus();
                strError = "Invalid To Address";
            }
            else if (ddlTravelBy.SelectedItem.Text == "Select Travel By Vechicle")
            {
                ddlTravelBy.Focus();
                strError = "Please Select Travel By Vechicle";
            }
            else if (string.IsNullOrEmpty(txtStartDate.Text.Trim()) || txtStartDate.Text == "dd-mm-yyyy")
            {
                txtStartDate.Focus();
                strError = "Please Select Start Date";
            }
            else if (string.IsNullOrEmpty(txtEndDate.Text.Trim()) || txtEndDate.Text == "dd-mm-yyyy")
            {
                txtEndDate.Focus();
                strError = "Please Select End Date";
            }
            else if (Convert.ToDateTime(txtStartDate.Text) < Convert.ToDateTime(DateTime.Now.ToString("dd-MM-yyyy")))
            {
                txtEndDate.Focus();
                txtStartDate.Text = DateTime.Today.ToString("yyyy-MM-dd");
                strError = "Start Date Con not be Past Date";
            }
            else if (Convert.ToDateTime(txtStartDate.Text) > Convert.ToDateTime(txtEndDate.Text))
            {
                txtEndDate.Focus();
                strError = "End Date Con not be Less then Start Date";
            }
            else if (string.IsNullOrEmpty(txtWeightCanCarry.Text.Trim()))
            {
                txtWeightCanCarry.Focus();
                strError = "Please Enter Weight";
            }
            return strError;
        }
        private DataTable GetCoordinates(string address)
        {
            string url = "http://maps.google.com/maps/api/geocode/xml?address=" + address + "&sensor=false";
            WebRequest request = WebRequest.Create(url);
            DataTable dtCoordinates = new DataTable();
            using (WebResponse response = (HttpWebResponse)request.GetResponse())
            {
                using (StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8))
                {
                    DataSet dsResult = new DataSet();
                    dsResult.ReadXml(reader);
                    
                    dtCoordinates.Columns.AddRange(new DataColumn[4] { new DataColumn("Id", typeof(int)),
                    new DataColumn("Address", typeof(string)),
                    new DataColumn("Latitude",typeof(string)),
                    new DataColumn("Longitude",typeof(string)) });
                    foreach (DataRow row in dsResult.Tables["result"].Rows)
                    {
                        string geometry_id = dsResult.Tables["geometry"].Select("result_id = " + row["result_id"].ToString())[0]["geometry_id"].ToString();
                        DataRow location = dsResult.Tables["location"].Select("geometry_id = " + geometry_id)[0];
                        dtCoordinates.Rows.Add(row["result_id"], row["formatted_address"], location["lat"], location["lng"]);
                    }
                }
                return dtCoordinates;
            }
        }
    }
}