<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PortShippingRequestList.aspx.cs" Inherits="WebApplication1.PortShippingRequestList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/zf/dt-1.10.16/datatables.css"/>
    <h1>Shipping Requests</h1>
    <h3>Incoming Shipping Requests</h3>
    <asp:GridView ID="incomingdatatable" runat="server" OnRowDataBound="incomingdatatable_RowDataBound"></asp:GridView>
    <h3>Outgoing Shipping Requests</h3>
    <asp:GridView ID="outgoingdatatable" runat="server" style="width:100%" OnRowDataBound="incomingdatatable_RowDataBound"></asp:GridView>
    
    <script type="text/javascript" src="https://cdn.datatables.net/v/zf/dt-1.10.16/datatables.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $('#MainContent_incomingdatatable').dataTable({ "paging": true, "ordering": true, "searching": true });
            $('#MainContent_outgoingdatatable').dataTable({ "paging": true, "ordering": true, "searching": true });  
            $("input[type=search]")[0].title = 'Can search in all columns';
            $("input[type=search]")[1].title = 'Can search in all columns';
        });
    </script>
</asp:Content>
