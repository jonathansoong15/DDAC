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
    public partial class ShippingRequest : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (userloggedin.UserType.Equals("A"))
            {
                btnUpdate.Enabled = true;
                ddlStatus.Enabled = true;
            }
            else if (userloggedin.UserType.Equals("S"))
            {
                btnUpdate.Enabled = true;
                ddlStatus.Enabled = true;
            }
            //if (!Page.IsPostBack)
            //{
            //    ddlStatus.Items.Insert(0, new ListItem("Waiting For Approval", "0"));
            //    ddlStatus.Items.Insert(1, new ListItem("Approved", "1"));
            //    ddlStatus.Items.Insert(2, new ListItem("Rejected", "2"));
            //    ddlStatus.Items.Insert(3, new ListItem("Delivering", "3"));
            //    ddlStatus.Items.Insert(4, new ListItem("Received", "4"));
            //    ddlStatus.Items.Insert(5, new ListItem("Completed", "5"));
            //}
            loadGridViewFromDatabase();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            updateToDatabase();
            
            Response.Redirect("About.aspx");
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
                cmd.Parameters.AddWithValue("@status", hidtest.Text);
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

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            ViewState["currentpage"] = hidtest.Text;
            //Convert.ToInt32(hidtest.Text);
        }
    }
}