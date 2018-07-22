<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation = "false" CodeBehind="ClassAttendance.aspx.cs" Inherits="WebApplication1.ClassAttendance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/zf/dt-1.10.16/datatables.css"/>
    <h1>Class <%= Request.QueryString["ClassID"] %> Attendance</h1>
    <h3>Student Attended Class</h3>
    <asp:GridView ID="datatable" runat="server" OnRowDataBound="datatable_RowDataBound"></asp:GridView>
    <h3>Student Absent From Class</h3>
    <asp:GridView ID="absenttable" runat="server" style="width:100%" OnRowDataBound="absenttable_RowDataBound" OnSelectedIndexChanged="absenttable_SelectedIndexChanged"></asp:GridView>
    
    <script type="text/javascript" src="https://cdn.datatables.net/v/zf/dt-1.10.16/datatables.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $('#MainContent_datatable').dataTable({ "paging": true, "ordering": true, "searching": true });
            $('#MainContent_absenttable').dataTable({ "paging": true, "ordering": true, "searching": true });  
            $("input[type=search]")[0].title = 'Can search in all columns';
            $("input[type=search]")[1].title = 'Can search in all columns';
        });
    </script>
</asp:Content>
