using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(userloggedin.loggedin == true)
            {
                lblLogin.Text = "Logout";
                if (userloggedin.UserType.Equals("S"))
                {
                    menubar.InnerHtml =
                    "<li><a runat='server' href='/ '>Home</a></li>" +
                    "<li><a runat= 'server' href = '/About' >About</a ></li>" +
                    "<li><a runat ='server' href = '/PortShippingRequestList'>Shipping Requests</a ></li>";
                }
                else if (userloggedin.UserType.Equals("A"))
                {
                    menubar.InnerHtml =
                    "<li><a runat='server' href='/ '>Home</a></li>" +
                    "<li><a runat ='server' href = '/ShippingRequestList'>Shipping Requests</a ></li>";
                }
                else if (userloggedin.UserType.Equals("C"))
                {
                    menubar.InnerHtml =
                    "<li><a runat='server' href='/ '>Home</a></li>" +
                    "<li><a runat ='server' href = '/ShippingRequestList'>View Submitted Shipping Requests</a ></li>" +
                    "<li><a runat ='server' href = '/SubmitShippingRequest'>Shipping Request Submission Form</a ></li>";
                }
                else if (userloggedin.UserType.Equals("P"))
                {
                    menubar.InnerHtml =
                    "<li><a runat='server' href='/ '>Home</a></li>" +
                    "<li><a runat ='server' href = '/PortShippingRequestList'>Shipping Requests</a ></li>";
                }
            }
        }
    }
    static class userloggedin
    {
        public static Boolean loggedin;
        public static string UserType;
        public static string userid;
        public static string portID;
    }
}