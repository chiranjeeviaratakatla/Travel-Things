<%@ Page Title="" Language="C#" MasterPageFile="~/BackEnd/BackEnd.Master" AutoEventWireup="true" CodeBehind="frmSender.aspx.cs" Inherits="TravelThings.BackEnd.test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%=txtFromAdd.ClientID%>').autocomplete({
                source: 'AddressHandler.ashx'
            });
            $('#<%=txtToAdd.ClientID%>').autocomplete({
                source: 'AddressHandler.ashx'
            });

        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel" style="padding: 10px; margin: 10px">
        <div class="form-group col-sm-12 col-xs-12 col-sm-12">
            <div class="col-xs-6 col-md-3 col-lg-3 col-sm-3">
                <asp:Button Text="Item" BorderStyle="None" ID="Tab1" CssClass="Initial" OnClick="Tab1_Click" runat="server" />
            </div>
            <div class="col-xs-6 col-md-3 col-lg-3 col-sm-3">
                <asp:Button Text="Destination" BorderStyle="None" ID="Tab2" CssClass="Initial" OnClick="Tab2_Click" runat="server" />
            </div>
            <div class="col-xs-6 col-md-3 col-lg-3 col-sm-3">
                <asp:Button Text="Receiver" BorderStyle="None" ID="Tab3" CssClass="Initial" OnClick="Tab3_Click" runat="server" />
            </div>
            <div class="col-xs-6 col-md-3 col-lg-3 col-sm-3">
                <asp:Button Text="Payment" BorderStyle="None" ID="btnPayment" CssClass="Initial" OnClick="btnPayment_Click" runat="server" />
            </div>
        </div>
        <asp:MultiView ID="MainView" runat="server">

            <asp:View ID="View1" runat="server">

                <div class="form-group col-sm-12">
                    <h3>Send your Items</h3>

                    <div class="col-sm-12">
                        <asp:Button ID="btnAddItems" Text="Add Items" runat="server" OnClientClick="return false;" CssClass="btn btn-primary" data-toggle="modal" data-target="#popAddItems" />
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <div class="col-sm-12">
                        <div style="width: 100%; height: 300px; overflow: auto;">
                            <asp:GridView ID="gvItems" runat="server" OnRowCommand="gvItems_RowCommand" Width="100%" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found" CssClass="table table-hover" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:TemplateField HeaderText="Select">
                                        <ItemTemplate>
                                            <asp:Button ID="gvBtnSelect" runat="server" Text="Select" CssClass="btn btn-primary" OnClick="gvBtnSelect_Click" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>" data-toggle="modal" data-target="#popAddItems" />
                                            <asp:HiddenField ID="hfSelectedItemId" runat="server" Value='<%# Eval("I_SlNo") %>' />
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
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:Panel ID="pnlSearchTravelers" runat="server">
                    <div class="form-group col-sm-12">
                        <h3>Send your Items</h3>

                        <div class="col-sm-3">
                            <label>From Address:</label>
                            <asp:TextBox ID="txtFromAdd" runat="server" placeholder="Enter From Address" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-3">
                            <label for="usr">To Address:</label>
                            <asp:TextBox ID="txtToAdd" runat="server" placeholder="Enter To Address" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-3">
                            <label for="usr">Traveler Availble Till Date:</label>
                            <asp:TextBox ID="txtTillDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-3">
                            <span></span>
                            <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" OnClick="btnSearch_Click" Text="Search" />
                            <span></span>
                            <asp:Button ID="btnClear" runat="server" CssClass="btn btn-info" Text="Clear" />
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="pnlTravelerAvailablity" runat="server">
                    <div class="form-group col-sm-12">
                        <div class="col-sm-12">
                            <div style="height: 100%; overflow-x: scroll;">
                                <asp:GridView ID="gvTravelerAvailablity" runat="server" Width="100%" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found" CssClass="table table-hover" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Select">
                                            <ItemTemplate>
                                                <asp:Button ID="gvBtnSelect" runat="server" Text="Select" CssClass="btn btn-primary" OnClick="gvBtnSelect_Click1" />
                                                <asp:HiddenField ID="hfTrancId" runat="server" Value='<%# Eval("TD_Sno") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <%--<asp:BoundField Visible="false" HeaderText="TD_Traveler_Id" DataField="TD_Traveler_Id" />--%>
                                        <%--<asp:BoundField HeaderText="TrasId" DataField="TD_Traveler_Id" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" ></asp:BoundField>--%>
                                        <asp:BoundField HeaderText="Sr No" DataField="SNO" />
                                        <%--<asp:BoundField HeaderText="I_SlNo" DataField="I_SlNo" />--%>
                                        <asp:BoundField HeaderText="Traveler Name" DataField="UD_User_Name" />
                                        <asp:BoundField HeaderText="Start Date" DataField="TD_Strating_Dt" />
                                        <asp:BoundField HeaderText="End Date" DataField="TD_Ending_Dt" />
                                        <asp:BoundField HeaderText="Travel By" DataField="TD_Travel_by" />
                                        <asp:BoundField HeaderText="Weight" DataField="TD_Item_Weight" />
                                        <asp:BoundField HeaderText="From" DataField="TD_Item_From" />
                                        <asp:BoundField HeaderText="To" DataField="TD_Item_To" />
                                        <%--<asp:TemplateField Visible="false">
                                            <ItemTemplate>
                                                
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <span style="font-size: 15px; font-weight: bold; color: Blue;">No Traveler's are Available on this Road. Please try again later! </span>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>
                            <asp:Label ID="lblTrascId" runat="server" Visible="false"></asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="pnlTraveler" Visible="false" runat="server">
                    <div class="form-group col-sm-12">
                        <h3>Traveler Details</h3>
                        <div class="col-sm-3">
                            <label>Traveler Name:</label>
                            <asp:Label ID="lblTravelerNam" runat="server"></asp:Label>
                        </div>
                        <div class="col-sm-3">
                            <label>Traveler From:</label>
                            <asp:Label ID="lblFrom" runat="server"></asp:Label>
                        </div>
                        <div class="col-sm-3">
                            <label>Traveler To:</label>
                            <asp:Label ID="lblTo" runat="server"></asp:Label>
                        </div>
                        <div class="col-sm-3">
                            <label>Start Date:</label>
                            <asp:Label ID="lblStartdate" runat="server"></asp:Label>
                        </div>
                        <div class="col-sm-3">
                            <label>Travel by:</label>
                            <asp:Label ID="lblTravelBy" runat="server"></asp:Label>
                        </div>
                        <div class="col-sm-3">
                            <label>Carry Weight:</label>
                            <asp:Label ID="lblWeight" runat="server"></asp:Label>
                        </div>
                        <div class="col-sm-3">
                            <label>Estimation Amount:</label>
                            <asp:Label ID="lblEstimationAmt" runat="server"></asp:Label>
                        </div>
                        <div class="col-sm-3">
                            <asp:LinkButton ID="lbtnEditTraveler" runat="server" Text="Edit" CssClass="Clicked" OnClick="lbtnEditTraveler_Click">
                                <span class="glyphicon glyphicon-pencil"></span>
                            </asp:LinkButton>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="pnlItemSelection" Visible="false" runat="server">
                    <div class="form-group col-sm-12">
                        <h3>Select Items to Send</h3>

                        <div id="divItemSelection" class="form-group col-sm-12">
                            <div style="width: 100%; height: 180px; overflow: auto;">
                                <asp:GridView ID="gvItemSelection" runat="server" Width="100%" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found" CssClass="table table-hover" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Select">
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chkSelectAll" OnCheckedChanged="chkSelectAll_CheckedChanged" AutoPostBack="true" Checked="true" Text="Select" runat="server" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelect" runat="server" Checked="true" />
                                                <asp:HiddenField ID="hfItemId" runat="server" Value='<%# Eval("I_SlNo") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--<asp:BoundField Visible="false" HeaderText="Slno" DataField="I_SlNo" />--%>
                                        <asp:BoundField HeaderText="Sr No" DataField="SNO" />
                                        <asp:BoundField HeaderText="Item Name" DataField="I_Item_Name" />
                                        <asp:BoundField HeaderText="Description" DataField="I_Item_Desc" />
                                        <asp:BoundField HeaderText="Weight" DataField="I_Weight" />
                                        <asp:BoundField HeaderText="Type" DataField="I_Item_Type" />
                                        <asp:BoundField HeaderText="Remarks" DataField="I_Remarks" />
                                        <%--<asp:TemplateField Visible="false">
                                            <ItemTemplate>
                                                
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <span style="font-size: 12px; font-weight: bold; color: Blue;">No records are available matching your selected filter. Click on "Add" button to enter new data .. </span>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </asp:View>
            <asp:View ID="View3" runat="server">
                <div class="form-group col-sm-12">
                    <h3>Reciver Details</h3>
                    <div class="col-sm-3">
                        <label>Name:</label>
                        <asp:TextBox ID="txtRecName" runat="server" CssClass="form-control" placeholder="Enter Receiver Name"></asp:TextBox>
                        <%--<input type="text" class="form-control" id="pwd">--%>
                    </div>
                    <div class="col-sm-3">
                        <label>Phone Number:</label>
                        <asp:TextBox ID="txtRecPhoneNo" runat="server" CssClass="form-control" placeholder="Enter Receiver Phone No"></asp:TextBox>
                        <%--<input type="text" class="form-control" id="usr">--%>
                    </div>
                    <div class="col-sm-3">
                        <label>Aternative Phone Number:</label>
                        <asp:TextBox ID="txtRecAltPhoneNo" runat="server" CssClass="form-control" placeholder="Enter Receiver Alternative Phone No"></asp:TextBox>
                        <%--<input type="text" class="form-control" id="pwd">--%>
                    </div>
                    <div class="col-sm-3">
                        <label>Email:</label>
                        <asp:TextBox ID="txtRecEmail" runat="server" CssClass="form-control" placeholder="Enter Receiver Email Id"></asp:TextBox>
                        <%--<input type="text" class="form-control" id="usr">--%>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View4" runat="server">
                <div class="form-group col-sm-12">
                    <h3>Item Summary</h3>
                    <div class="form-group col-sm-12">
                        <h4>Item Details</h4>
                        <div class="form-group col-sm-12">
                            <div style="height: 100%; overflow-x: scroll;">
                                <asp:GridView ID="gvItemSummery" runat="server" Width="100%" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found" CssClass="table table-hover" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:BoundField HeaderText="Sr No" DataField="SLNO" />
                                        <asp:BoundField HeaderText="Item Name" DataField="I_Item_Name" />
                                        <asp:BoundField HeaderText="Description" DataField="I_Item_Desc" />
                                        <asp:BoundField HeaderText="Weight" DataField="I_Weight" />
                                        <asp:BoundField HeaderText="Charges" DataField="I_Charges" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <span style="font-size: 12px; font-weight: bold; color: Blue;">No records are available matching your selected filter. Click on "Add" button to enter new data .. </span>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                    <div class="form-group col-sm-12">
                        <h4>Receiver</h4>
                        <div class="col-sm-3">
                            <div class="col-sm-6">
                                <label>Receiver Name:</label>
                            </div>
                            <div class="col-sm-6">
                                <asp:Label ID="lblSmryReceiverName" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="col-sm-6">
                                <label>Receiver Id:</label>
                            </div>
                            <div class="col-sm-6">
                                <asp:Label ID="lblSmryReceiverId" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="col-sm-6">
                                <label>Address:</label>
                            </div>
                            <div class="col-sm-6">
                                <asp:Label ID="lblSmryReceiverAddress" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="col-sm-6">
                                <asp:LinkButton ID="btnReceiverPhone" runat="server" Text="" CssClass="Clicked">
                                <span class='glyphicon glyphicon-earphone'></span>
                                </asp:LinkButton>
                            </div>
                            <div class="col-sm-6">
                                <asp:LinkButton ID="btnReceiverChat" runat="server" Text="" CssClass="Clicked">
                                <span class='glyphicon glyphicon-comment'></span>
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <div class="form-group col-sm-12">
                        <h4>Traveler Details</h4>
                        <div class="col-sm-3">
                            <div class="col-sm-6">
                                <label>Traveler Name:</label>
                            </div>
                            <div class="col-sm-6">
                                <asp:Label ID="lblSmryTravelerName" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="col-sm-6">
                                <label>Start Journey:</label>
                            </div>
                            <div class="col-sm-6">
                                <asp:Label ID="lblSmryStartJourney" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="col-sm-6">
                                <label>End Journey:</label>
                            </div>
                            <div class="col-sm-6">
                                <asp:Label ID="lblSmryEndJourney" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="col-sm-6">
                                <asp:LinkButton ID="btnTravelerPhone" runat="server" Text="" CssClass="Clicked">
                                <span class='glyphicon glyphicon-earphone'></span>
                                </asp:LinkButton>
                            </div>
                            <div class="col-sm-6">
                                <asp:LinkButton ID="btnTravelerChat" runat="server" Text="" CssClass="Clicked">
                                <span class='glyphicon glyphicon-comment'></span>
                                </asp:LinkButton>
                            </div>
                        </div>
                        <div class="col-sm-3">
                        </div>
                    </div>

                    <div class="form-group col-sm-12">
                        <%--<h4>Payment Details</h4>--%>
                        <div class="col-sm-4">
                            <label></label>
                        </div>
                        <div class="col-sm-4">
                            <span class="text-center">
                                <asp:Button ID="btnContinue" runat="server" CssClass="btn btn-primary" Text="Continue to Pay Rs = 120/-" />
                            </span>
                        </div>
                        <div class="col-sm-4">
                            <label></label>
                        </div>
                    </div>
                </div>
            </asp:View>
        </asp:MultiView>
        <div class="form-group col-sm-6">
            <span class="pull-left">
                <asp:Button ID="btnPrevious" runat="server" Text="Previous" CssClass="btn btn-primary" OnClick="btnPrevious_Click" />
            </span>
        </div>
        <div class="form-group col-sm-6">
            <span class="pull-right">
                <asp:Button ID="btnNext" runat="server" Text="Save & Continue" CssClass="btn btn-primary" OnClick="btnNext_Click" />
            </span>
        </div>
    </div>
    <%-- hiden fields --%>
    <%--<asp:Label ID="lblReceiverId" runat="server" Visible="false"></asp:Label>--%>
    <!-- Modal content-->
    <div class="modal fade" id="popAddItems" role="dialog" data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog">
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
