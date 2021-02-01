<%@ Page Title="" Language="C#" MasterPageFile="~/BackEnd/BackEnd.Master" AutoEventWireup="true" CodeBehind="frmTraveler.aspx.cs" Inherits="TravelThings.BackEnd.frmTraveler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="form-group col-sm-12">
                <h3>
                    <asp:Label ID="lblHeading" runat="server" Text="Start your Journey"></asp:Label>
                </h3>

                <div class="col-sm-4">
                    <label for="usr">From:</label>
                    <asp:TextBox ID="txtFrom" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="col-sm-4">
                    <label for="pwd">To:</label>
                    <asp:TextBox ID="txtTo" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <label for="pwd">Travel By:</label>
                    <span></span>
                    <asp:DropDownList ID="ddlTravelBy" CssClass="btn btn-default dropdown-toggle" Style="width: 100%" runat="server">
                        <asp:ListItem Text="Select Travel By Vechicle"></asp:ListItem>
                        <asp:ListItem Text="Bike"></asp:ListItem>
                        <asp:ListItem Text="Bus"></asp:ListItem>
                        <asp:ListItem Text="Car"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-sm-4">
                </div>
                <div class="col-sm-4">
                </div>
                <%--<div class="form-group col-sm-4">
                    <label for="pwd">Travel By:</label>
                  <asp:DropDownList ID="ddlTravelBy" CssClass="btn btn-default dropdown-toggle" Style="width: 100%" runat="server">
                        <asp:ListItem Text="Select Travel By Vechicle"></asp:ListItem>
                        <asp:ListItem Text="Bike"></asp:ListItem>
                        <asp:ListItem Text="Bus"></asp:ListItem>
                        <asp:ListItem Text="Car"></asp:ListItem>
                    </asp:DropDownList>
                </div>--%>
                <div class="col-sm-4">
                    <label for="pwd">Starting Date:</label>
                    <asp:TextBox ID="txtStartDate" TextMode="Date" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <label for="pwd">Ending Date:</label>
                    <asp:TextBox ID="txtEndDate" TextMode="Date" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <label for="pwd">Weight Can Carry:<span></span>(In KGs)</label>
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
                    <div style="height: 100%; overflow-x: scroll;">
                        <asp:GridView ID="gvJourney" OnRowCommand="gvJourney_RowCommand" runat="server" Width="100%" CssClass="table table-hover" AutoGenerateColumns="false">
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
                                <%--<asp:BoundField HeaderText="TD_Sno" DataField="TD_Sno"/>--%>
                                <asp:BoundField HeaderText="Email ID" DataField="TD_Sno" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"></asp:BoundField>
                                <asp:TemplateField HeaderText="Delete">
                                    <ItemTemplate>
                                        <asp:Button ID="btnDeleteJoureny" runat="server" Text="Delete" CssClass="btn btn-danger" CommandName="Delete" CommandArgument="<%# Container.DataItemIndex %>" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
