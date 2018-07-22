<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShippingRequest.aspx.cs" Inherits="WebApplication1.ShippingRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Edit Shipping Request</h3>
        <form method="POST">
            <div class="grid-x grid-padding-x">
                <div class="row">
                    <div class="large-6 medium-6 columns">
                        <label>Departure Ports</label>
                        <asp:DropDownList ID="ddlDeparturePort" runat="server" Enabled="false">
                            <asp:ListItem Enabled="true" Text="Port Klang" Value="1"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Port Kepong" Value="2"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Port Jinjang" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="large-6 medium-6 columns">
                        <label>Arrival Ports</label>
                        <asp:DropDownList ID="ddlArrivalPort" runat="server" Enabled="false">
                            <asp:ListItem Enabled="true" Text="Port Klang" Value="1"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Port Kepong" Value="2"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Port Jinjang" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row">
                    <div class="large-6 medium-6 columns">
                        <label>Date</label>
                        <asp:TextBox ID="txtDate" runat="server" type="text" Enabled="false" placeholder="Date" TextMode="Date" size="20"></asp:TextBox>  
                    </div>
                    <div class="large-6 medium-6 columns">
                        <label>Shipping Status</label>
                        <asp:DropDownList ID="ddlStatus" runat="server" Enabled="false" onchange="dropdown()" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                            <asp:ListItem Enabled="true" Text="Waiting For Approval" Value="0"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Approved" Value="1"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Rejected" Value="2"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Delivering" Value="3"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Received" Value="4"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Completed" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox ID="hidtest" runat="server" type="hidden" placeholder="" size="20" ></asp:TextBox>  
                    </div>
                </div>
                <div class="row">
                    <div class="large-6 medium-6 columns">
                        <label>Shipping Cost</label>
                        <asp:TextBox ID="txtShippingCost" runat="server" type="text" Enabled="false" placeholder="" size="20"></asp:TextBox>  
                    </div>
                    <div class="large-6 medium-6 columns">
                        
                    </div>
                </div>
                <div class="row">
                    <div class="large-6 medium-6 columns">
                        <label>Container ID</label>
                        <asp:TextBox ID="txtContainerID" runat="server" type="text" placeholder="Container ID" size="20"></asp:TextBox> 
                    </div>
                    <div class="large-6 medium-6 columns">
                        <label>Container Size</label>
                        <asp:TextBox ID="txtContainerSize" runat="server" type="text" Enabled="false" placeholder="Good Size" size="40"></asp:TextBox>  
                    </div>
                </div>

                <div class="row">
                    <div class="large-12 medium-12 columns">
                        <label>Remarks</label>
                        <asp:TextBox ID="txtRemarks" runat="server" type="text" Enabled="false" TextMode="MultiLine" placeholder="Remarks" size="200"></asp:TextBox>  
                    </div>
                </div>
            </div>
            <div style="text-align: center;">
                <asp:Button CssClass="button" runat="server" ID="btnUpdate" Text="Update" style="margin:0" OnClick="btnUpdate_Click" Enabled="false"/>
            </div>
          </form>
    <script type="text/javascript">

        

        function dropdown()
        {
            var ddlreport;var ddltext;
 

            var hidvalue;

            ddlreport = document.getElementById("<%=ddlStatus.ClientID%>");
            ddltext = ddlreport.selectedIndex;

            document.getElementById("MainContent_hidtest").value = ddltext;
    }
</script>
</asp:Content>
