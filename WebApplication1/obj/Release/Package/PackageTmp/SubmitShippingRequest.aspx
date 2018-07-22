<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SubmitShippingRequest.aspx.cs" Inherits="WebApplication1.SubmitShippingRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Submit Shipping Request</h3>
        <form method="POST">
            <div class="grid-x grid-padding-x">
                <div class="row">
                    <div class="large-6 medium-6 columns">
                        <label>Departure Ports</label>
                        <asp:DropDownList ID="ddlDeparturePort" runat="server">
                            <asp:ListItem Enabled="true" Text="Port Klang" Value="1"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Port Kepong" Value="2"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Port Jinjang" Value="3"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Port Hawaii" Value="4"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="large-6 medium-6 columns">
                        <label>Arrival Ports</label>
                        <asp:DropDownList ID="ddlArrivalPort" runat="server">
                            <asp:ListItem Enabled="true" Text="Port Klang" Value="1"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Port Kepong" Value="2"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Port Jinjang" Value="3"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Port Hawaii" Value="4"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row">
                    <div class="large-6 medium-6 columns">
                        <label>Date</label>
                        <asp:TextBox ID="txtDate" runat="server" type="text" placeholder="Date" TextMode="Date" size="20"></asp:TextBox>  
                    </div>
                    <div class="large-6 medium-6 columns">
                        
                    </div>
                </div>
                <div class="row">
                    <div class="large-6 medium-6 columns">
                        <label>Good Size</label>
                        <asp:TextBox ID="txtContainerSize" runat="server" type="text" placeholder="Container Size" size="40"></asp:TextBox>  
                    </div>
                    <div class="large-6 medium-6 columns">
                        
                    </div>
                </div>

                <div class="row">
                    <div class="large-12 medium-12 columns">
                        <label>Remarks</label>
                        <asp:TextBox ID="txtRemarks" runat="server" type="text" TextMode="MultiLine" placeholder="Remarks" size="200"></asp:TextBox>  
                    </div>
                    
                </div>
            </div>
            <div style="text-align: center;">
                <asp:Button CssClass="button" runat="server" ID="btnInsert" Text="Insert" style="margin:0" OnClick="btnInsert_Click"/>
            </div>
          </form>
</asp:Content>
