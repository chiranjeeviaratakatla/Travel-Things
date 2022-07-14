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
    public partial class WebForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //DataTable dt = new DataTable();
                //dt.Columns.AddRange(new DataColumn[4] { new DataColumn("Id"), new DataColumn("Name"), new DataColumn("Country"), new DataColumn("Salary") });
                //dt.Rows.Add(1, "John Hammond", "United States", 70000);
                //dt.Rows.Add(2, "Mudassar Khan", "India", 40000);
                //dt.Rows.Add(3, "Suzanne Mathews", "France", 30000);
                //dt.Rows.Add(4, "Robert Schidner", "Russia", 50000);
                //GridView1.DataSource = dt;
                //GridView1.DataBind();
                Tools tools = new Tools();
                ItransactionAccess dllTranc = new TransactionAccess();
                DataTable dtItemDetails = dllTranc.GetItemDetails(tools.UserId);
                GridView1.DataSource = dtItemDetails;
                GridView1.DataBind();
                //Attribute to show the Plus Minus Button.
                GridView1.HeaderRow.Cells[1].Attributes["data-class"] = "expand";

                //Attribute to hide column in Phone.
                GridView1.HeaderRow.Cells[0].Attributes["data-hide"] = "phone";
                GridView1.HeaderRow.Cells[2].Attributes["data-hide"] = "phone";
                GridView1.HeaderRow.Cells[5].Attributes["data-hide"] = "phone";
                GridView1.HeaderRow.Cells[4].Attributes["data-hide"] = "phone";
                //Adds THEAD and TBODY to GridView.
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}