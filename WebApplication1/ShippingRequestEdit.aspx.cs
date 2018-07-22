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
    public partial class ShippingRequestEdit : System.Web.UI.Page
    {
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            if (userloggedin.UserType.Equals("A"))
            {
                btnUpdate.Enabled = true;
                ddlStatus.Enabled = true;
                txtContainerID.Enabled = true;
            }
            else if (userloggedin.UserType.Equals("S"))
            {
                btnUpdate.Enabled = true;
                ddlStatus.Enabled = true;
                txtContainerID.Enabled = true;
            }
            loadGridViewFromDatabase();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            updateToDatabase();

            var uriBuilder = new UriBuilder(HttpContext.Current.Request.Url);
            uriBuilder.Path = "/ShippingRequestEdit.aspx";
            var query = HttpUtility.ParseQueryString(uriBuilder.Query);
            query["ShippingID"] = Request.QueryString["ShippingID"];
            uriBuilder.Query = query.ToString();
            
            Response.Redirect(uriBuilder.ToString());
        }
        private void loadGridViewFromDatabase()
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ChatbotDatabaseConnectionString"].ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Shipping WHERE Shipping_ID = " + Request.QueryString["ShippingID"], con);
            DataSet ds = new DataSet();
            da.Fill(ds, "books");

            foreach (DataRow myRow in ds.Tables[0].Rows)
            {
                ddlDeparturePort.SelectedValue = myRow[1].ToString();
                ddlArrivalPort.SelectedValue = myRow[2].ToString();
                txtDate.Text = myRow[3].ToString();
                ddlStatus.SelectedValue = myRow[4].ToString();
                txtShippingCost.Text = myRow[5].ToString();
                txtRemarks.Text = myRow[6].ToString();
                if (!myRow[8].ToString().Equals(""))
                {
                    txtContainerID.Text = myRow[8].ToString();
                }
                txtContainerSize.Text = myRow[9].ToString();
            }
        }

        private void updateToDatabase()
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ChatbotDatabaseConnectionString"].ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Shipping SET Shipping_Status = @status, Container_ID = @Container_ID WHERE Shipping_ID = @shippingid", con);
                cmd.Parameters.AddWithValue("@status", ddlStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@Container_ID", txtContainerID.Text);
                cmd.Parameters.AddWithValue("@shippingid", Request.QueryString["ShippingID"]);

                if (cmd.ExecuteNonQuery() == 1)
                {
                    //lblMsg.Text = "Updated Successfully!";
                }
                else
                {
                    //lblMsg.Text = "Sorry! Could not update";
                }
            }
            catch (Exception ex)
            {
                //lblMsg.Text = "Error --> " + ex.Message;
            }
            finally
            {
                con.Close();
            }
        }
    }
}