<%@ Page Title="" Language="C#" MasterPageFile="~/BackEnd/BackEnd.Master" AutoEventWireup="true" CodeBehind="frmReports.aspx.cs" Inherits="TravelThings.BackEnd.frmReports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-group col-sm-12">
        <h3>
            <asp:Label ID="lblHeading" runat="server" Text="Start your Journey"></asp:Label>
        </h3>

      
        <div class="col-sm-4">
            <label>Select Transaction:</label>
            <span></span>
            <asp:DropDownList ID="ddlTransaction" CssClass="btn btn-default dropdown-toggle" Style="width: 100%" runat="server">
                <asp:ListItem Text="Select Item"></asp:ListItem>
                <asp:ListItem Text="All"></asp:ListItem>
                <asp:ListItem Text="Send Item"></asp:ListItem>
                <asp:ListItem Text="Receive Item"></asp:ListItem>
                <asp:ListItem Text="Travel Details"></asp:ListItem>
            </asp:DropDownList>
        </div>
        
        <div class="col-sm-4">
            <label>Starting Date:</label>
            <asp:TextBox ID="txtStartDate" TextMode="Date" class="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="col-sm-4">
            <label>Ending Date:</label>
            <asp:TextBox ID="txtEndDate" TextMode="Date" class="form-control" runat="server"></asp:TextBox>
        </div>
       
    </div>
    <div class="form-group col-sm-4">
    </div>
    <div class="form-group col-sm-4">
    </div>
    <div class="form-group col-sm-4">
        <asp:Button ID="btnAddJourney" runat="server" Text="Search" class="btn btn-primary" />
        <asp:Button ID="btnEditJourney" runat="server" Visible="false" Text="Edit Journey" class="btn btn-warning" />
        <asp:Button ID="btnClear" runat="server" Text="Clear" class="btn btn-danger" />
    </div>

    <div class="form-group col-sm-12">
        <div class="col-sm-12">
            <div style="width: 100%; height: 250px; overflow: auto;">
                <asp:GridView ID="gvJourney"  runat="server" Width="100%" CssClass="table table-hover" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderText="Select">
                            <ItemTemplate>
                                <asp:Button ID="gvBtnSelect" runat="server" Text="Select" CssClass="btn btn-primary" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Sr No" DataField="SNO" />
                        <asp:BoundField HeaderText="From Address" DataField="TD_Item_From" />
                        <asp:BoundField HeaderText="To Address" DataField="TD_Item_To" />
                        <asp:BoundField HeaderText="Travel By" DataField="TD_Travel_by" />
                        <asp:BoundField HeaderText="Start Date" DataField="TD_Strating_Dt" />
                        <asp:BoundField HeaderText="End Date" DataField="TD_Ending_Dt" />
                        <asp:BoundField HeaderText="Weight" DataField="TD_Item_Weight" />
                        <asp:BoundField HeaderText="TrasId" DataField="TD_Sno" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"></asp:BoundField>
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:Button ID="btnDeleteJoureny" runat="server" Text="Delete" CssClass="btn btn-danger" CommandName="DeleteItem" CommandArgument="<%# Container.DataItemIndex %>" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>
