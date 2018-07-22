<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentAttendance.aspx.cs" Inherits="WebApplication1.StudentAttendance" %>
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
                <asp:GridView ID="datatable" runat="server" style="width:100%" OnRowDataBound="datatable_RowDataBound"></asp:GridView>

</asp:Content>
