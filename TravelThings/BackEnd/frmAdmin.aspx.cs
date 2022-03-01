using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TravelThings.Helpers;

namespace TravelThings.BackEnd
{
    public partial class frmAdmin : System.Web.UI.Page
    {
        Tools tools = new Tools();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.IsPostBack)
                {
                    HiddenField UserID = (HiddenField)Master.FindControl("hfUserID");
                    if (string.IsNullOrEmpty(UserID.Value)) { UserID.Value = tools.UserId; }
                    if (string.IsNullOrEmpty(UserID.Value)) { Response.Redirect("~/Login/frmLogin.aspx"); }
                    tabUser.CssClass = "Clicked";
                    MainViewItem.ActiveViewIndex = 0;
                    Session["TabId"] = "0";
                    //getItemDetails(gvItems);
                    LinkButton li = (LinkButton)Master.FindControl("lbAdmin");
                    li.CssClass = "Clicked";
                    //btnPrevious.Visible = false;
                    //btnNext.Visible = true;
                    //GetItemTypes();

                    System.Data.DataTable dt = new System.Data.DataTable();
                    dt.Columns.AddRange(new System.Data.DataColumn[3] {
            new System.Data.DataColumn("Id"),
            new System.Data.DataColumn("Name"),
            new System.Data.DataColumn("Country") });
                    dt.Rows.Add(1, "John Hammond", "United States");
                    dt.Rows.Add(2, "Mudassar Khan", "India");
                    dt.Rows.Add(3, "Suzanne Mathews", "France");
                    dt.Rows.Add(4, "Robert Schidner", "Russia");
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    GridView1.UseAccessibleHeader = true;
                    GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Opps!', '" + ex.Message + "', 'warning')", true);
            }
        }
    }
}