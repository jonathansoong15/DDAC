<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentModuleAttendance.aspx.cs" Inherits="WebApplication1.StudentModuleAttendance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="grid-x grid-padding-x">
                <div class="large-2 medium-2 cell">
                  
                  <input id="accounttypehid" name="accounttypehid" type="hidden" value="">
                </div>
                <div class="row">
                    <div class="large-6 medium-6 columns">
                        <label>Name</label>
                        <asp:TextBox ID="txtName" runat="server" size="20" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="large-6 medium-6 columns">
                        <label>Intake</label>
                        <asp:TextBox ID="txtIntake" runat="server" size="20" Enabled="false"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="large-12 medium-12 columns">
                        <label>Module</label>
                        <asp:TextBox ID="txtModule" runat="server" size="20" Enabled="false"></asp:TextBox>
                    </div>
                </div>
                <h2>Classes Attended</h2>
                <asp:GridView ID="attendancetable" runat="server" style="width:100%"></asp:GridView>
                </br>
                <h2>Classes Absent</h2>
                <asp:GridView ID="classmissedtable" runat="server" style="width:100%"></asp:GridView>
            </div>
</asp:Content>
