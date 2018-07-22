using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class ShippingRequestList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadGridViewFromDatabase();
        }

        protected void datatable_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                return;
            }
            

            var uriBuilder = new UriBuilder(HttpContext.Current.Request.Url);
            uriBuilder.Path = "/ShippingRequestEdit.aspx";
            var query = HttpUtility.ParseQueryString(uriBuilder.Query);
            query["ShippingID"] = e.Row.Cells[0].Text;
            uriBuilder.Query = query.ToString();

            e.Row.Cells[0].Text = "<a href='" + uriBuilder.ToString() + "'>" + e.Row.Cells[0].Text + "</a>";
        }

        private void loadGridViewFromDatabase()
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ChatbotDatabaseConnectionString"].ConnectionString);
            SqlDataAdapter da;

            if (userloggedin.UserType.Equals("C"))
            {
                da = new SqlDataAdapter("SELECT Shipping_ID, (SELECT PortName FROM Port WHERE PortID = Shipping_Departure_Port) AS 'Departure Port', " +
                    "(SELECT PortName FROM Port WHERE PortID = Shipping_Arrival_Port) AS 'Arrival Port', (SELECT StatusName FROM Status WHERE StatusID = Shipping_Status) As 'Status', " +
                "Shipping_Date AS 'Date', (SELECT Name FROM Users WHERE ID = Customer_ID) AS 'Requested By' FROM Shipping s WHERE Customer_ID = '" + userloggedin.userid + "'", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT Shipping_ID, (SELECT PortName FROM Port WHERE PortID = Shipping_Departure_Port) AS 'Departure Port', " +
                    "(SELECT PortName FROM Port WHERE PortID = Shipping_Arrival_Port) AS 'Arrival Port', (SELECT StatusName FROM Status WHERE StatusID = Shipping_Status) As 'Status', " +
                "Shipping_Date AS 'Date', (SELECT Name FROM Users WHERE ID = Customer_ID) AS 'Requested By' FROM Shipping s", con);
            }
            
            DataSet ds = new DataSet();
            da.Fill(ds, "books");

            datatable.DataSource = ds.Tables[0];
            datatable.DataBind();

            if (datatable.Rows.Count > 0)
            {
                datatable.UseAccessibleHeader = true;
                datatable.HeaderRow.TableSection = TableRowSection.TableHeader;
                datatable.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }
    }
}