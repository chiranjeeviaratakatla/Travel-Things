﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BackEnd/BackEnd.Master" AutoEventWireup="true" CodeBehind="frmTraveler.aspx.cs" Inherits="TravelThings.BackEnd.frmTraveler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var txtFrom = "<%=this.txtFrom.ClientID %>";
            $('#' + txtFrom).autocomplete({
                source: 'AddressHandler.ashx'
            });
        });
        $(document).ready(function () {
            var txtTo = "<%=this.txtTo.ClientID %>";
            $('#' + txtTo).autocomplete({
                source: 'AddressHandler.ashx'
            });
        });

    </script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('[id*=gvJourney]').footable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-group col-sm-12 col-lg-12 col-md-12">
        <div class="row">
            <div class="col-sm-12 col-lg-12 col-md-12 col-xs-12">
                <h3>
                    <asp:Label ID="lblHeading" runat="server" Text="Start your Journey"></asp:Label>
                </h3>
            </div>
            <div class="col-sm-4 col-sm-12 col-lg-4 col-md-4 col-xs-12">
                <label for="usr">From:</label>
                <asp:TextBox ID="txtFrom" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-4 col-sm-12 col-lg-4 col-md-4 col-xs-12">
                <label>To:</label>
                <asp:TextBox ID="txtTo" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-4 col-sm-12 col-lg-4 col-md-4 col-xs-12">
                <label>Travel By:</label>
                <asp:DropDownList ID="ddlTravelBy" CssClass="form-control" runat="server">
                </asp:DropDownList>
            </div>
            <div class="col-sm-4 col-sm-12 col-lg-4 col-md-4 col-xs-12">
                <label>Starting Date:</label>
                <asp:TextBox ID="txtStartDate" TextMode="DateTimeLocal" class="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-4 col-sm-12 col-lg-4 col-md-4 col-xs-12">
                <label>Ending Date:</label>
                <asp:TextBox ID="txtEndDate" TextMode="DateTimeLocal" class="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-4 col-sm-12 col-lg-4 col-md-4 col-xs-12">
                <label>Weight Can Carry:<span></span>(In KGs)</label>
                <asp:TextBox ID="txtWeightCanCarry" MaxLength="2" class="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="form-group col-sm-4">
        </div>
        <div class="form-group col-sm-4">
        </div>
        <div class="form-group col-sm-4">
            <asp:Button ID="btnAddJourney" runat="server" Text="Add Journey" OnClick="btnAddJourney_Click" class="btn btn-primary" />
            <asp:Button ID="btnEditJourney" runat="server" Visible="false" OnClick="btnEditJourney_Click" Text="Edit Journey" class="btn btn-warning" />
            <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" class="btn btn-danger" />
        </div>

        <div class="form-group col-sm-12">
            <div class="col-sm-12">
                <div style="overflow: auto;">
                    <asp:GridView ID="gvJourney" OnRowCommand="gvJourney_RowCommand" runat="server" Width="100%" AutoGenerateColumns="false" CssClass="footable">
                        <Columns>
                            <asp:BoundField HeaderText="Sr No" DataField="SNO" />
                            <asp:BoundField HeaderText="From Address" DataField="TD_Item_From" />
                            <asp:BoundField HeaderText="To Address" DataField="TD_Item_To" />
                            <asp:BoundField HeaderText="Travel By" DataField="TD_Travel_by" />
                            <asp:BoundField HeaderText="Start Date" DataField="TD_Strating_Dt" />
                            <asp:BoundField HeaderText="End Date" DataField="TD_Ending_Dt" />
                            <asp:BoundField HeaderText="Weight" DataField="TD_Item_Weight" />
                            <%--<asp:BoundField HeaderText="TD_Sno" DataField="TD_Sno"/>--%>
                            <asp:BoundField HeaderText="TrasId" DataField="TD_Sno" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"></asp:BoundField>
                            <asp:TemplateField HeaderText="Select">
                                <ItemTemplate>
                                    <asp:ImageButton ID="gvBtnEdit" runat="server" ImageUrl="~/Images/Icons/edit.png" CommandName="EditJourney" CommandArgument="<%# Container.DataItemIndex %>" />
                                    <%--<asp:Button ID="gvBtnEdit" runat="server" Text="Edit" CssClass="btn btn-primary" CommandName="EditJourney" CommandArgument="<%# Container.DataItemIndex %>" />--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnDeleteJoureny" runat="server" ImageUrl="~/Images/Icons/delete.png" CommandName="DeleteItem" OnClientClick="return ConfirmDelete(this);" CommandArgument="<%# Container.DataItemIndex %>" />
                                    <%--<asp:Button ID="btnDeleteJoureny" runat="server" Text="Delete" CssClass="btn btn-danger" CommandName="DeleteItem" OnClientClick="return ConfirmDelete(this);" CommandArgument="<%# Container.DataItemIndex %>" />--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
