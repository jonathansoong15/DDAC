<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DocketReport.aspx.cs" Inherits="WebApplication1.DocketReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/zf/dt-1.10.16/datatables.css"/>
    <h3 runat="server" id ="lblImportClasses">Docket Distribution Report Generator</h3>
    <div class="grid-x grid-padding-x" id="divImportClasses" runat="server">
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
    <a onclick="exportTableToCSV('members.csv')" class="button" style="margin:0" runat="server" id ="btnExportCSV">Export Table To CSV File</a>
    <a onclick="demoFromHTML()" class="button" style="margin:0" runat="server" id ="btnExportPDF">Export Table To PDF File</a>
    <script type="text/javascript" src="https://cdn.datatables.net/v/zf/dt-1.10.16/datatables.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.debug.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
           $('#MainContent_datatable').dataTable({ "paging": true, "ordering": true, "searching": true });  
        $("input[type=search]")[0].title = 'Can search in all columns';
        });
        function downloadCSV(csv, filename) {
            var csvFile;
            var downloadLink;

            // CSV file
            csvFile = new Blob([csv], {type: "text/csv"});

            // Download link
            downloadLink = document.createElement("a");

            // File name
            downloadLink.download = filename;

            // Create a link to the file
            downloadLink.href = window.URL.createObjectURL(csvFile);

            // Hide download link
            downloadLink.style.display = "none";

            // Add the link to DOM
            document.body.appendChild(downloadLink);

            // Click download link
            downloadLink.click();
        }

        function exportTableToCSV(filename) {
            var csv = [];
            var rows = document.querySelectorAll("table tr");
    
            for (var i = 0; i < rows.length; i++) {
                var row = [], cols = rows[i].querySelectorAll("td, th");
        
                for (var j = 0; j < cols.length; j++) 
                    row.push(cols[j].innerText);
        
                csv.push(row.join(","));        
            }

            // Download CSV file
            downloadCSV(csv.join("\n"), filename);
        }

        function demoFromHTML() { 

            var table1 = 
            tableToJson($('#MainContent_datatable').get(0)),
            cellWidth = 35,
            rowCount = 0,
            cellContents,
            leftMargin = 2,
            topMargin = 12,
            topMarginTable = 55,
            headerRowHeight = 13,
            rowHeight = 9,

             l = {
             orientation: 'l',
             unit: 'mm',
             format: 'a3',
             compress: true,
             fontSize: 8,
             lineHeight: 1,
             autoSize: false,
             printHeaders: true
         };

        var doc = new jsPDF(l, '', '', '');

        doc.setProperties({
            title: 'Test PDF Document',
            subject: 'This is the subject',
            author: 'author',
            keywords: 'generated, javascript, web 2.0, ajax',
            creator: 'author'
        });

        doc.cellInitialize();

       $.each(table1, function (i, row)
        {

            rowCount++;

            $.each(row, function (j, cellContent) {

                //if (rowCount == 1) {
                //    doc.margins = 1;
                //    doc.setFont("helvetica");
                //    doc.setFontType("bold");
                //    doc.setFontSize(9);

                //    doc.cell(leftMargin, topMargin, cellWidth, headerRowHeight, cellContent, i)
                //}
                //else if (rowCount == 2) {
                //    doc.margins = 1;
                //    doc.setFont("times ");
                //    doc.setFontType("italic");  // or for normal font type use ------ doc.setFontType("normal");
                //    doc.setFontSize(8);                    

                //    doc.cell(leftMargin, topMargin, cellWidth, rowHeight, cellContent, i); 
                //}
                //else {

                    doc.margins = 1;
                    doc.setFont("courier ");
                    doc.setFontType("bolditalic ");
                    doc.setFontSize(6.5);                    

                    doc.cell(leftMargin, topMargin, cellWidth, rowHeight, cellContent, i);  // 1st=left margin    2nd parameter=top margin,     3rd=row cell width      4th=Row height
                //}
            })
        })

        doc.save('DocketDistributionReport.pdf');  }




        function tableToJson(table) {
        var data = [];

        // first row needs to be headers
        var headers = [];
        for (var i=0; i<table.rows[0].cells.length; i++) {
            headers[i] = table.rows[0].cells[i].innerHTML.toLowerCase().replace(/ /gi,'');
        }

        // go through cells
        for (var i=1; i<table.rows.length; i++) {

            var tableRow = table.rows[i];
            var rowData = {};

            for (var j=0; j<tableRow.cells.length; j++) {

                rowData[ headers[j] ] = tableRow.cells[j].innerHTML;

            }

            data.push(rowData);
        }       

        return data; }
    </script>
</asp:Content>
