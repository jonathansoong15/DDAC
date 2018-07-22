<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModuleAttendance.aspx.cs" Inherits="WebApplication1.ModuleAttendance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/zf/dt-1.10.16/datatables.css"/>
    <h3 runat="server" id ="lblImportClasses">Module Average Attendance Percentage Report</h3>
    <div class="grid-x grid-padding-x" runat="server">
        <div class="large-12 medium-12 cell">
            <small>Intake</small>
            <asp:TextBox ID="txtIntake" runat="server" type="text" placeholder="Intake" name="Intake" size="20"></asp:TextBox>  
        </div>
        <div style="text-align: center;">
            <asp:Button CssClass="button" runat="server" ID="btnSubmit" Text="Submit" style="margin:0" OnClick="btnSubmit_Click"/>
        </div>
    </div>
    </br>
    <h3 runat="server" id="txtTitle"></h3>
    <div id="content">
        <asp:GridView ID="datatable" runat="server" OnRowDataBound="datatable_RowDataBound"></asp:GridView>
    </div>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/data.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>

    <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

    <script type="text/javascript" src="https://cdn.datatables.net/v/zf/dt-1.10.16/datatables.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.debug.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){ 

            Highcharts.chart('container', {
                data: {
                    table: 'MainContent_datatable'
                },
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'Average Attendance for each Module for Intake ' + $('#MainContent_txtIntake').val()
                },
                yAxis: {
                    allowDecimals: false,
                    title: {
                        text: 'Percentage'
                    },
                    max : 100
                },
                tooltip: {
                    formatter: function () {
                        return '<b>' + this.series.name + '</b><br/>' +
                            this.point.y + ' ' + this.point.name.toLowerCase();
                    }
                }
            });
        });

        $('td:first-child').each(function(){
          var $td = $(this);
          $td.replaceWith('<th>' + $(this).text() + '</th>');
        });
        $('#MainContent_datatable').hide();  
        $("input[type=search]")[0].title = 'Can search in all columns';
        </script>
</asp:Content>
