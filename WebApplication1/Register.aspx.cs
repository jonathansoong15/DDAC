using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            insertClass();
            insertPort();
            Response.Redirect("Login.aspx");
        }

        private void insertClass()
        {


            if (ddlAccountType.SelectedValue.Equals("C"))
            {
                txtPortID.Text = "";
            }

            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ChatbotDatabaseConnectionString"].ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO [dbo].[Users] ([ID],[Type],[Name],[Username],[Password],[Email],[PortID]) " +
                    "VALUES(@ID, @Type, @Name, @Username, @Password, @Email, @PortID)", con);
                cmd.Parameters.AddWithValue("@ID", txtID.Text);
                cmd.Parameters.AddWithValue("@Type",ddlAccountType.SelectedValue);
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@PortID", txtPortID.Text);

                int count = cmd.ExecuteNonQuery();
                if (count == 1)
                {
                    //Class added!
                }
                else
                {
                    //Class cant be added
                }
            }
            catch (Exception ex)
            {
            }
            finally
            {
                con.Close();
            }
        }

        private void insertPort()
        {
            if (ddlAccountType.SelectedValue.Equals("C"))
            {
                txtPortID.Text = "";
                txtPortName.Text = "";
            }

            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ChatbotDatabaseConnectionString"].ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO [dbo].[Port] ([PortID],[PortName],[PortLocation]) " +
                    "VALUES(@PortID, @PortName, @PortLocation)", con);
                cmd.Parameters.AddWithValue("@PortID", txtPortID.Text);
                cmd.Parameters.AddWithValue("@PortName", txtPortName.Text);
                cmd.Parameters.AddWithValue("@PortLocation", txtPortName.Text.Replace("Port ", ""));

                int count = cmd.ExecuteNonQuery();
                if (count == 1)
                {
                    //Class added!
                }
                else
                {
                    //Class cant be added
                }
            }
            catch (Exception ex)
            {
            }
            finally
            {
                con.Close();
            }
        }

        protected void ddlAccountType_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }
}