<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentAttendanceReport.aspx.cs" Inherits="WebApplication1.StudentAttendanceReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/zf/dt-1.10.16/datatables.css"/>
    <h3>Check Student Attendance Report</h3>
    <div ></div>
    <div class="grid-x grid-padding-x">
        <div class="large-12 medium-12 cell">
            <small>Student ID</small>
            <asp:TextBox ID="txtStudentID" runat="server" type="text" placeholder="Student ID" name="Student ID" size="20"></asp:TextBox>  
        </div>
        <div style="text-align: center;">
            <asp:Button CssClass="button" runat="server" ID="btnImport" Text="Submit" style="margin:0" OnClick="btnImport_Click"/>
        </div>
    </div>
</asp:Content>
