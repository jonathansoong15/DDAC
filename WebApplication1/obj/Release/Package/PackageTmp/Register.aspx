<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Registration Form</h3>
        <form method="POST">
            <div class="grid-x grid-padding-x">
                <div class="row">
                    <div class="large-6 medium-6 columns">
                        <label>Account Type</label>
                        <asp:DropDownList ID="ddlAccountType" runat="server" OnSelectedIndexChanged="ddlAccountType_SelectedIndexChanged">
                            <asp:ListItem Enabled="true" Text="Port" Value="S"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Customer" Value="C"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="large-6 medium-6 columns">
                        <label>ID</label>
                        <asp:TextBox ID="txtID" runat="server" type="text" placeholder="ID" size="20"></asp:TextBox>  
                    </div>
                </div>
                <div class="row">
                    <div class="large-12 medium-12 columns">
                        <label>Name</label>
                        <asp:TextBox ID="txtName" runat="server" type="text" placeholder="Name" size="20"></asp:TextBox>  
                    </div>

                </div>
                <div class="row">
                    <div class="large-6 medium-6 columns">
                        <label>Username</label>
                        <asp:TextBox ID="txtUsername" runat="server" type="text" placeholder="Username" size="20"></asp:TextBox>  
                    </div>
                    <div class="large-6 medium-6 columns">
                        <label>Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" type="text" placeholder="Password" size="40"></asp:TextBox>  
                    </div>
                </div>
                <div class="row">
                    <div class="large-6 medium-6 columns">
                        <label>Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" type="text" placeholder="Email" size="200"></asp:TextBox>
                    </div>
                    <div class="large-6 medium-6 columns">
                    </div>
                </div>
                <div class="row" id="divport">
                    <div class="large-6 medium-6 columns">
                        <label>Port ID</label>
                        <asp:TextBox ID="txtPortID" runat="server" type="text" placeholder="Port ID" size="200"></asp:TextBox>
                    </div>
                    <div class="large-6 medium-6 columns">
                        <label>Port Name</label>
                        <asp:TextBox ID="txtPortName" runat="server" type="text" placeholder="Port Name" size="200"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div style="text-align: center;">
                <asp:Button CssClass="button" runat="server" ID="btnInsert" Text="Insert" style="margin:0" OnClick="btnInsert_Click"/>
            </div>
          </form>
    
    <script>
        $('#MainContent_ddlAccountType').change(function() {    
            var item=$(this);
	        if (item.val() == 'C'){
		        $('#divport').hide();
            }else{
		        $('#divport').show();
            }
        });
    </script>
</asp:Content>
