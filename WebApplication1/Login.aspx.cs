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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(userloggedin.loggedin == true)
            {
                userloggedin.loggedin = false;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (("admin").Equals(txtUsername.Text) && ("admin").Equals(txtPassword.Text))
            {
                userloggedin.loggedin = true;
                userloggedin.UserType = "A";
                userloggedin.userid = "0";
                Response.Redirect("About.aspx");
                return;
            }
            else
            {
                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ChatbotDatabaseConnectionString"].ConnectionString);
                SqlDataAdapter da = new SqlDataAdapter("select username,password,type,id,PortID from users", con);
                DataSet ds = new DataSet();
                da.Fill(ds, "books");
                string type = "";
                string userid = "";
                string portid = "";
                int loginstatus = 0;
                foreach (DataRow myRow in ds.Tables[0].Rows)
                {
                    if (myRow[0].ToString().Replace(" ", "").Equals(txtUsername.Text) && myRow[1].ToString().Replace(" ", "").Equals(txtPassword.Text))
                    {
                        loginstatus = 1;
                        type = myRow[2].ToString();
                        userid = myRow[3].ToString();
                        portid = myRow[4].ToString();
                        break;
                    }
                    else if (myRow[0].ToString().Replace(" ", "").Equals(txtUsername.Text) && !(myRow[1].ToString().Replace(" ", "").Equals(txtPassword.Text)))
                    {
                        loginstatus = 2;
                        break;
                    }
                }
                //GridView1.DataSource = ds.Tables[0];
                //GridView1.DataBind();
                if (loginstatus == 0)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Wrong username and password!');</script>");
                }
                else if (loginstatus == 1)
                {
                    userloggedin.loggedin = true;
                    userloggedin.UserType = type;
                    userloggedin.userid = userid;
                    if (type.Equals("S"))
                    {
                        userloggedin.portID = portid;
                    }
                    else
                    {
                        userloggedin.portID = null;
                    }
                    Response.Redirect("About.aspx");
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Wrong password!');</script>");
                }
            }
        }
    }
}