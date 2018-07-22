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
    public partial class PortShippingRequestList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadGridViewFromDatabase();
        }

        private void loadGridViewFromDatabase()
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ChatbotDatabaseConnectionString"].ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter("SELECT Shipping_ID, (SELECT PortName FROM Port WHERE PortID = Shipping_Departure_Port) AS 'Departure Port', (SELECT PortName FROM Port WHERE PortID = Shipping_Arrival_Port) AS 'Arrival Port'," +
                "Shipping_Status + ' : ' + (SELECT StatusName FROM Status WHERE StatusID = Shipping_Status) As 'Status', " +
                "Shipping_Date AS 'Date', (SELECT Name FROM Users WHERE ID = Customer_ID) AS 'Requested By' FROM Shipping " +
                "WHERE Shipping_Arrival_Port = " + userloggedin.portID, con);
            DataSet ds = new DataSet();
            da.Fill(ds, "books");

            incomingdatatable.DataSource = ds.Tables[0];
            incomingdatatable.DataBind();

            if (incomingdatatable.Rows.Count > 0)
            {
                incomingdatatable.UseAccessibleHeader = true;
                incomingdatatable.HeaderRow.TableSection = TableRowSection.TableHeader;
            }

            SqlDataAdapter da1 = new SqlDataAdapter("SELECT Shipping_ID, (SELECT PortName FROM Port WHERE PortID = Shipping_Departure_Port) AS 'Departure Port'," +
                "(SELECT PortName FROM Port WHERE PortID = Shipping_Arrival_Port) AS 'Arrival Port', Shipping_Status " +
                "+ ' : ' + (SELECT StatusName FROM Status WHERE StatusID = Shipping_Status) As 'Status', Shipping_Date AS 'Date', " +
                "(SELECT Name FROM Users WHERE ID = Customer_ID) AS 'Requested By' FROM Shipping WHERE Shipping_Departure_Port = " + userloggedin.portID, con);
            DataSet ds1 = new DataSet();
            da1.Fill(ds1, "books");
            outgoingdatatable.DataSource = ds1.Tables[0];
            outgoingdatatable.DataBind();

            if (outgoingdatatable.Rows.Count > 0)
            {
                outgoingdatatable.UseAccessibleHeader = true;
                outgoingdatatable.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void incomingdatatable_RowDataBound(object sender, GridViewRowEventArgs e)
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
    }
}