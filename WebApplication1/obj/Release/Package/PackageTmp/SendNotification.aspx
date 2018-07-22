<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SendNotification.aspx.cs" Inherits="WebApplication1.SendNotification" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row medium-8 large-7 columns">
      <div class="blog-post">
        <h3>Send Notification<small></small></h3>
        <form action="Login" method="POST">
<!--            <div class="name-field">H
                <label>Your name <small>required</small>
                  <input type="text" required pattern="[a-zA-Z]+">
                </label>
              </div>-->

            <div class="grid-x grid-padding-x">
                <div class="large-12 medium-12 cell">
                  <asp:TextBox ID="txtIntake" runat="server" type="text" placeholder="Intake" name="intake" size="20"></asp:TextBox>  
              </div>
              <div class="large-12 medium-12 cell">
                  <asp:TextBox ID="txtTitle" runat="server" type="text" placeholder="Title" name="title" size="20"></asp:TextBox>  
              </div>
              <div class="large-12 medium-12 cell">
                <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" placeholder="Message" name="message" size="100"></asp:TextBox>  
              </div>
            </div>
            <div style="text-align: center;">
                <asp:Button CssClass="button" runat="server" ID="btnSubmit" Text="Publish" style="margin:0" OnClick="btnSubmit_Click"/>
            </div>
          </form>
      </div>
    </div>
    <script src="https://www.gstatic.com/firebasejs/5.0.3/firebase.js"></script>
        <script>
          // Initialize Firebase
          var config = {
            apiKey: "AIzaSyBMj4AJENhzu1e_5ggGRNRzG-P3NwH0ZRk",
            authDomain: "schedulerecyclerview.firebaseapp.com",
            databaseURL: "https://schedulerecyclerview.firebaseio.com",
            projectId: "schedulerecyclerview",
            storageBucket: "schedulerecyclerview.appspot.com",
            messagingSenderId: "831363976488"
          };
          firebase.initializeApp(config);
        </script>
</asp:Content>
