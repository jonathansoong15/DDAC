<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShippingRequestList.aspx.cs" Inherits="WebApplication1.ShippingRequestList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Shipping Requests</h3>
    <asp:GridView ID="datatable" runat="server" OnRowDataBound="datatable_RowDataBound"></asp:GridView>
    <script type="text/javascript" src="https://cdn.datatables.net/v/zf/dt-1.10.16/datatables.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $('#MainContent_datatable').dataTable({
                "paging": true,
                "ordering": true,
                "searching": true
                
            });  

            $("input[type=search]")[0].title = 'Can search in all columns';
        });
    </script>
</asp:Content>
