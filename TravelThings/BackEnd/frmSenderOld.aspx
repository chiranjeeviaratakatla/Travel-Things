<%@ Page Title="" Language="C#" MasterPageFile="~/BackEnd/BackEnd.Master" AutoEventWireup="true" CodeBehind="frmSenderOld.aspx.cs" Inherits="TravelThings.BackEnd.frmSender" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--<script>
        $(document).ready(function () {
            $(".nav-tabs a").click(function () {
                $(this).tab('show');
            });
        });
    </script>--%>

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            var txtFromAdd = "<%=this.txtFromAdd.ClientID %>";
            $('#' + txtFromAdd).autocomplete({
                source: 'AddressHandler.ashx'
            });
        });
        $(document).ready(function () {
            var txtToAdd = "<%=this.txtToAdd.ClientID %>";
            $('#' + txtToAdd).autocomplete({
                source: 'AddressHandler.ashx'
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="width: 100%; height: 515px; overflow-y: scroll;">
        <div id="dvTab">
            <div class="container">
                <ul class="nav nav-pills">
                    <li class="active" style="background-color: cadetblue;"><a data-toggle="tab" href="#home">Items</a></li>
                    <li style="background-color: cadetblue;"><a data-toggle="tab" href="#menu1">Destination</a></li>
                    <li style="background-color: cadetblue;"><a data-toggle="tab" href="#menu2">Receiver</a></li>
                    <%--<li><a data-toggle="tab" href="#menu3">Menu 3</a></li>--%>
                </ul>

                <div class="tab-content">
                    <div id="home" class="tab-pane fade in active">
                        <div class="form-group col-sm-12">
                            <h3>Send your Items</h3>
                        </div>
                        <div class="col-sm-12">
                            <%--  --%><asp:Button ID="btnAddItems" Text="Add Items" runat="server" OnClientClick="return false;" CssClass="btn btn-primary" data-toggle="modal" data-target="#popAddItems" />
                            <%--<span></span>--%>
                            <%--<button type="button" class="btn btn-warning">Remove</button>--%>
                        </div>
                        <div class="col-sm-12">
                            <div style="height: 100%; overflow-x: scroll;">
                                <asp:GridView ID="gvItems" runat="server" Width="100%" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found" CssClass="table table-hover" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Select">
                                            <ItemTemplate>
                                                <asp:Button ID="gvBtnSelect" runat="server" Text="Select" CssClass="btn btn-primary" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField Visible="false" HeaderText="Slno" DataField="I_SlNo" />
                                        <asp:BoundField HeaderText="Sr No" DataField="SNO" />
                                        <asp:BoundField HeaderText="Item Name" DataField="I_Item_Name" />
                                        <asp:BoundField HeaderText="Description" DataField="I_Item_Desc" />
                                        <asp:BoundField HeaderText="Weight" DataField="I_Weight" />
                                        <asp:BoundField HeaderText="Type" DataField="I_Item_Type" />
                                        <asp:BoundField HeaderText="Remarks" DataField="I_Remarks" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <span style="font-size: 12px; font-weight: bold; color: Blue;">No records are available matching your selected filter. Click on "Add" button to enter new data .. </span>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                    <div id="menu1" class="tab-pane fade">
                        <div class="form-group col-sm-12">
                            <h3>Send your Items</h3>
                        </div>
                        <div class="form-group col-sm-3">
                            <label for="pwd">From Address:</label>
                            <asp:TextBox ID="txtFromAdd" runat="server" TextMode="Search" placeholder="Enter From Address" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group col-sm-3">
                            <label for="usr">To Address:</label>
                            <asp:TextBox ID="txtToAdd" runat="server" TextMode="Search" placeholder="Enter To Address" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group col-sm-3">
                            <label for="usr">Traveler Availble Till Date:</label>
                            <asp:TextBox ID="txtTillDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group col-sm-3">
                            <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" OnClick="btnSearch_Click" Text="Search" />
                            <span></span>
                            <asp:Button ID="btnClear" runat="server" CssClass="btn btn-info" Text="Clear" />
                        </div>
                        <div class="form-group col-sm-12">
                            <div style="height: 100%; overflow-x: scroll;">
                                <asp:GridView ID="gvTravelerAvailablity" runat="server" Width="100%" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found" CssClass="table table-hover" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Select">
                                            <ItemTemplate>
                                                <asp:Button ID="gvBtnSelect" runat="server" Text="Select" CssClass="btn btn-primary" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField Visible="false" HeaderText="TD_Traveler_Id" DataField="TD_Traveler_Id" />
                                        <asp:BoundField HeaderText="Sr No" DataField="SNO" />
                                        <asp:BoundField HeaderText="Traveler Name" DataField="UD_User_Name" />
                                        <asp:BoundField HeaderText="Start Date" DataField="TD_Strating_Dt" />
                                        <asp:BoundField HeaderText="End Date" DataField="TD_Ending_Dt" />
                                        <asp:BoundField HeaderText="Travel By" DataField="TD_Travel_by" />
                                        <asp:BoundField HeaderText="From" DataField="TD_Item_From" />
                                        <asp:BoundField HeaderText="To" DataField="TD_Item_To" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <span style="font-size: 15px; font-weight: bold; color: Blue;">No Traveler's are Available on this Road. Please try again later! </span>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                    <div id="menu2" class="tab-pane fade">

                        <div class="form-group col-sm-12">
                            <h3>Reciver Details</h3>
                        </div>
                        <div class="form-group col-sm-4">
                            <label for="pwd">Name:</label>
                            <input type="text" class="form-control" id="pwd">
                        </div>
                        <div class="form-group col-sm-4">
                            <label for="usr">Phone Number:</label>
                            <input type="text" class="form-control" id="usr">
                        </div>
                        <div class="form-group col-sm-4">
                            <label for="pwd">Aternative Phone Number:</label>
                            <input type="text" class="form-control" id="pwd">
                        </div>
                        <div class="form-group col-sm-4">
                            <label for="pwd">Aadhar Number:</label>
                            <input type="text" class="form-control" id="pwd">
                        </div>
                        <div class="form-group col-sm-4">
                            <label for="usr">Email:</label>
                            <input type="text" class="form-control" id="usr">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="popAddItems" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add Item </h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid text-center">
                        <div class="col-sm-6">
                            <label>Item Name :</label>
                            <asp:TextBox ID="txtItemName" runat="server" CssClass="form-control" placeholder="Enter Item Name"></asp:TextBox>
                            <%--<input type="text" class="form-control" id="pwd">--%>
                        </div>
                        <div class="col-sm-6">
                            <label>Description :</label>
                            <asp:TextBox ID="txtItemDesc" runat="server" CssClass="form-control" placeholder="Enter Item Description"></asp:TextBox>
                            <%--<input type="text" class="form-control" id="pwd">--%>
                        </div>
                        <div class="col-sm-6">
                            <label>Weight :</label>
                            <asp:TextBox ID="txtWeight" runat="server" TextMode="Number" CssClass="form-control" placeholder="Enter Item Weight"></asp:TextBox>
                            <%--<input type="text" class="form-control" id="pwd">--%>
                        </div>
                        <div class="col-sm-6">
                            <label>Item Type :</label>
                            <asp:DropDownList ID="ddlItemType" class="btn btn-default dropdown-toggle" runat="server" Width="100%">
                                <asp:ListItem Text="Select Item Type"></asp:ListItem>
                                <asp:ListItem Text="Papers"></asp:ListItem>
                                <asp:ListItem Text="Files"></asp:ListItem>
                                <asp:ListItem Text="Electronic"></asp:ListItem>
                                <asp:ListItem Text="Metal"></asp:ListItem>
                                <asp:ListItem Text="Glass"></asp:ListItem>
                                <asp:ListItem Text="Plastic"></asp:ListItem>
                                <asp:ListItem Text="Clothes"></asp:ListItem>
                                <asp:ListItem Text="Sensitive"></asp:ListItem>
                                <asp:ListItem Text="Hardware"></asp:ListItem>
                                <asp:ListItem Text="Other"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<div class="dropdown" ">
							<button class="btn btn-default dropdown-toggle" type="button"  data-toggle="dropdown">Please Select Tutorials
							<span class="caret"></span></button>
							<ul class="dropdown-menu">
							  <li><a href="#">Normal</a></li>
							  <li class="disabled"><a href="#">Disabled</a></li>
							  <li class="active"><a href="#">Active</a></li>
							  <li><a href="#">Normal</a></li>
							</ul>
						</div>--%>
                        </div>
                        <div class="col-sm-12">
                            <label>Remarks :</label>
                            <asp:TextBox ID="txtRemarks" runat="server" CssClass="form-control" placeholder="Enter Item Remarks"></asp:TextBox>
                            <%--<input type="text" class="form-control" id="pwd">--%>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnItemSave" runat="server" Text="Save" OnClick="btnItemSave_Click" CssClass="btn btn-primary" />
                    <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="btn btn-default" data-dismiss="modal" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
