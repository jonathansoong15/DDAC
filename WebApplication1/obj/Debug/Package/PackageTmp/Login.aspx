<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--<h2><%: Title %>.</h2>--%>
    <div class="row medium-8 large-7 columns">
      <div class="blog-post">
        <h3>Login<small></small></h3>
        <form action="Login" method="POST">
<!--            <div class="name-field">H
                <label>Your name <small>required</small>
                  <input type="text" required pattern="[a-zA-Z]+">
                </label>
              </div>-->
            <div class="grid-x grid-padding-x">
              <div class="large-12 medium-12 cell">
                  <asp:TextBox ID="txtUsername" runat="server" type="text" placeholder="Username" name="username" size="20"></asp:TextBox>  
              </div>
              <div class="large-12 medium-12 cell">
                <asp:TextBox ID="txtPassword" runat="server" type="password" placeholder="Password" name="password" size="20"></asp:TextBox>  
              </div>
            </div>
            <div style="text-align: center;">
                <asp:Button CssClass="button" runat="server" OnClick="btnSubmit_Click" ID="btnSubmit" Text="Log In" style="margin:0"/>
            </div>
          </form>
      </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChatbotDatabaseConnectionString %>" SelectCommand="SELECT [Username], [Password] FROM [Student]"></asp:SqlDataSource>
</asp:Content>