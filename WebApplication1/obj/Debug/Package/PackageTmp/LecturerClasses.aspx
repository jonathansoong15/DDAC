<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LecturerClasses.aspx.cs" Inherits="WebApplication1.LecturerClasses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/zf/dt-1.10.16/datatables.css"/>
    <h3>Classes</h3>
    <asp:GridView ID="datatable" runat="server" OnRowDataBound="datatable_RowDataBound"></asp:GridView>

    <h3>Insert Special Classes</h3>
        <form method="POST">
            <div class="grid-x grid-padding-x">
                <c:set var="customer" scope="session" />
                <%--<div class="row">
                <div class="large-2 medium-2 columns">
                  <label>Account Type</label>
                  <select id="accounttype" name="type" disabled="true">
                    <option value="A">Administrator</option>
                    <option value="D">Dean</option>
                    <option value="L">Lecturer</option>
                    <option value="S">Student</option>
                  </select>
                  <input id="accounttypehid" name="accounttypehid" type="hidden">
                </div>
                </div>
                <div class="row">
                    <div class="large-2 medium-2 columns">
                      <label>Gender</label>
                      <select name="gender" id="gender">
                        <option value="M">Male</option>
                        <option value="F">Female</option>
                      </select>
                    </div>
                </div>--%>
                <div class="row">
                    <div class="large-6 medium-6 columns">
                        <label>Date</label>
                        <asp:TextBox ID="txtDate" runat="server" type="text" placeholder="Date" size="20"></asp:TextBox>  
                    </div>
                    <div class="large-6 medium-6 columns">
                        <label>Time</label>
                        <asp:TextBox ID="txtTime" runat="server" type="text" placeholder="Time" size="20"></asp:TextBox>  
                    </div>
                </div>
                <div class="row">
                    <div class="large-6 medium-6 columns">
                        <label>Classroom</label>
                        <asp:TextBox ID="txtClassroom" runat="server" type="text" placeholder="Classroomm" size="20"></asp:TextBox>  
                    </div>
                    <div class="large-6 medium-6 columns">
                        <label>Location</label>
                        <asp:TextBox ID="txtLocation" runat="server" type="text" placeholder="Location" size="20"></asp:TextBox>  
                    </div>
                </div>
                <div class="row">
                    <div class="large-6 medium-6 columns">
                        <label>Module</label>
                        <asp:TextBox ID="txtModule" runat="server" type="text" placeholder="Module" size="20"></asp:TextBox>  
                    </div>
                    <div class="large-6 medium-6 columns">
                        <label>Lecturer</label>
                        <asp:TextBox ID="txtLecturer" runat="server" type="text" placeholder="Lecturer" size="40"></asp:TextBox>  
                    </div>
                </div>
                <div class="row">
                    <div class="large-12 medium-12 columns">
                        <label>Intake Code</label>
                        <asp:TextBox ID="txtIntakeCode" runat="server" type="text" placeholder="Intake Code" size="20"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div style="text-align: center;">
                <asp:Button CssClass="button" runat="server" ID="btnInsert" Text="Insert" style="margin:0" OnClick="btnInsert_Click"/>
            </div>
          </form>

    <script type="text/javascript" src="https://cdn.datatables.net/v/zf/dt-1.10.16/datatables.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $('#MainContent_datatable').dataTable({ "paging": true, "ordering": true, "searching": true });
            $("input[type=search]")[0].title = 'Can search in all columns';
        });
    </script>
</asp:Content>
