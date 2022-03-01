<%@ Page Title="" Language="C#" MasterPageFile="~/BackEnd/BackEnd.Master" AutoEventWireup="true" CodeBehind="frmSender.aspx.cs" Inherits="TravelThings.BackEnd.test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel" style="padding: 10px; margin: 10px">
        <div class="form-group col-sm-12 col-xs-12 col-sm-12">
            <div class="row">
                <div class="col-xs-6 col-md-3 col-lg-3 col-lg-3">
                    <asp:Button Text="Item" BorderStyle="None" ID="tabItem" CssClass="Initial" OnClick="tabItem_Click" runat="server" Enabled="false" />
                </div>
                <div class="col-xs-6 col-md-3 col-lg-3 col-lg-3">
                    <asp:Button Text="Destination" BorderStyle="None" ID="tabDestination" CssClass="Initial" OnClick="tabDestination_Click" runat="server" Enabled="false" />
                </div>
                <div class="col-xs-6 col-md-3 col-lg-3 col-lg-3">
                    <asp:Button Text="Receiver" BorderStyle="None" ID="tabReceiver" CssClass="Initial" OnClick="tabReceiver_Click" runat="server" Enabled="false" />
                </div>
                <div class="col-xs-6 col-md-3 col-lg-3 col-lg-3">
                    <asp:Button Text="Payment" BorderStyle="None" ID="btnPayment" CssClass="Initial" OnClick="btnPayment_Click" runat="server" Enabled="false" />
                </div>
            </div>
        </div>
        <asp:Panel ID="pnlItem" runat="server" Visible="false">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="col-xs-6">
                            <h4 class="modal-title">Add Item </h4>
                        </div>
                        <div class="col-xs-6">
                            <span class="pull-right">
                                <asp:Button ID="btnCloseModelX" runat="server" Text="X" OnClick="btnCloseModel_Click" />
                            </span>
                        </div>
                        <div class="col-xs-12">
                            <asp:Label ID="lblError" runat="server" Text="error" CssClass="form-control" Visible="false"></asp:Label>
                        </div>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid text-center">
                            <div class="col-sm-6">
                                <label>Item Name :</label>

                                <asp:TextBox ID="txtItemName" runat="server" CssClass="form-control" placeholder="Enter Item Name"></asp:TextBox>
                            </div>
                            <div class="col-sm-6">
                                <label>Description :</label>
                                <asp:TextBox ID="txtItemDesc" runat="server" CssClass="form-control" placeholder="Description (Optional)"></asp:TextBox>
                            </div>

                            <div class="col-sm-6">
                                <label>Item Type :</label>
                                <asp:DropDownList ID="ddlItemType" class="btn btn-default dropdown-toggle" runat="server" Width="100%">
                                </asp:DropDownList>
                            </div>
                            <div class="col-sm-6">
                                <label>Weight :</label>
                                <asp:TextBox ID="txtWeight" runat="server" MaxLength="2" CssClass="form-control" placeholder="Enter Item Weight" onkeypress="return onlyNumbers(event)"></asp:TextBox>
                            </div>
                            <div class="col-sm-12">
                                <label>Remarks :</label>
                                <asp:TextBox ID="txtRemarks" runat="server" CssClass="form-control" placeholder="Remarks (Optional)"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnContinueItem" runat="server" Text="Continue" CssClass="btn btn-primary" OnClick="btnContinueItem_Click" />
                        <asp:Button ID="btnItemSave" runat="server" Text="Save" OnClick="btnItemSave_Click" OnClientClick="return validate();" CssClass="btn btn-primary" data-keyboard="false" />
                        <asp:Button ID="btnCloseModel" runat="server" Text="Close" CssClass="btn btn-default" OnClick="btnCloseModel_Click" />
                    </div>
                </div>
            </div>
        </asp:Panel>
        <asp:MultiView ID="MainViewItem" runat="server">

            <asp:View ID="View1" runat="server">

                <div class="form-group col-sm-12">
                    <h3>Send your Items</h3>

                    <div class="col-sm-12">
                        <asp:Button ID="btnAddItems" Text="Add Items" runat="server" CssClass="btn btn-primary" OnClick="btnAddItems_Click" /><%--data-toggle="modal" data-target="#popAddItems" --%>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <div class="col-sm-12">
                        <div style="width: 100%; height: 250px; overflow-y: auto;">
                            <asp:GridView ID="gvItems" runat="server" OnRowCommand="gvItems_RowCommand" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found" CssClass="table" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:TemplateField HeaderText="Select">
                                        <ItemTemplate>
                                            <asp:Button ID="gvBtnSelect" runat="server" Text="Edit" CssClass="btn btn-primary" CommandName="EditItem" CommandArgument="<%# Container.DataItemIndex %>" />
                                            <asp:HiddenField ID="hfSelectedItemId" runat="server" Value='<%# Eval("I_SlNo") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Sr No" DataField="SNO" />
                                    <asp:BoundField HeaderText="Item Name" DataField="I_Item_Name" />
                                    <asp:BoundField HeaderText="Description" DataField="I_Item_Desc" />
                                    <asp:BoundField HeaderText="Weight" DataField="I_Weight" />
                                    <asp:BoundField HeaderText="Type" DataField="I_Item_Type" />
                                    <asp:BoundField HeaderText="Remarks" DataField="I_Remarks" />
                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <asp:Button ID="btnDeleteItem" runat="server" Text="Delete" CssClass="btn btn-danger" CommandName="DeleteItem" OnClientClick="return ConfirmDelete(this);" CommandArgument="<%# Container.DataItemIndex %>" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <span style="font-size: 12px; font-weight: bold; color: Blue;">No records are available. Click on "Add Items" button to enter new data. </span>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:Panel ID="pnlSearchTravelers" runat="server">
                    <div class="form-group col-sm-12">
                        <div class="row">
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
                    </div>
                </asp:Panel>
                <asp:Panel ID="pnlTravelerAvailablity" runat="server">
                    <div class="form-group col-sm-12">
                        <div class="col-sm-12">
                            <%--<div style="height: 100%; overflow-x: scroll;">--%>
                            <asp:GridView ID="gvTravelerAvailablity" runat="server" Width="100%" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found" CssClass="table table-hover" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:TemplateField HeaderText="Select">
                                        <ItemTemplate>
                                            <asp:Button ID="gvBtnSelect" runat="server" Text="Select" CssClass="btn btn-primary" OnClick="gvBtnSelect_Click1" />
                                            <asp:HiddenField ID="hfTrancId" runat="server" Value='<%# Eval("TD_Sno") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Sr No" DataField="SNO" />
                                    <asp:BoundField HeaderText="Traveler Name" DataField="UD_User_Name" />
                                    <asp:BoundField HeaderText="Start Date" DataField="TD_Strating_Dt" />
                                    <asp:BoundField HeaderText="End Date" DataField="TD_Ending_Dt" />
                                    <asp:BoundField HeaderText="Travel By" DataField="TD_Travel_by" />
                                    <asp:BoundField HeaderText="Weight" DataField="TD_Item_Weight" />
                                    <asp:BoundField HeaderText="From" DataField="TD_Item_From" />
                                    <asp:BoundField HeaderText="To" DataField="TD_Item_To" />
                                </Columns>
                                <EmptyDataTemplate>
                                    <span style="font-size: 15px; font-weight: bold; color: Blue;">No Traveler's are Available on this Road. Please try again later! </span>
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <%--</div>--%>
                            <asp:Label ID="lblTrascId" runat="server" Visible="false"></asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="pnlTraveler" Visible="false" runat="server">
                    <div class="form-group col-sm-12">
                        <div class="row">
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
                                <i class="fa fa-pencil" aria-hidden="true"></i>
                                <%--<span class="glyphicon glyphicon-pencil"></span>--%>
                                </asp:LinkButton>
                            </div>
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
                </asp:Panel>
            </asp:View>
            <asp:View ID="View3" runat="server">
                <div class="form-group col-sm-12">
                    <div class="row">
                        <h3>Reciver Details</h3>
                        <div class="col-sm-3">
                            <label>Name:</label>
                            <asp:TextBox ID="txtRecName" runat="server" CssClass="form-control" placeholder="Enter Receiver Name"></asp:TextBox>
                        </div>
                        <div class="col-sm-3">
                            <label>Phone Number:</label>
                            <asp:TextBox ID="txtRecPhoneNo" runat="server" CssClass="form-control" placeholder="Enter Receiver Phone No" MaxLength="10" onkeypress="return onlyNumbers(event)"></asp:TextBox>
                        </div>
                        <div class="col-sm-3">
                            <label>Aternative Phone Number:</label>
                            <asp:TextBox ID="txtRecAltPhoneNo" runat="server" CssClass="form-control" placeholder="Enter Receiver Alternative Phone No" MaxLength="10" onkeypress="return onlyNumbers(event)"></asp:TextBox>
                        </div>
                        <div class="col-sm-3">
                            <label>Email:</label>
                            <asp:TextBox ID="txtRecEmail" runat="server" CssClass="form-control" placeholder="Enter Receiver Email Id"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View4" runat="server">
                <div class="form-group col-sm-12">
                    <div class="row">
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
                                    <i class="far fa-comment-dots"></i>
                                    </asp:LinkButton>
                                </div>
                                <div class="col-sm-6">
                                    <asp:LinkButton ID="btnTravelerChat" runat="server" Text="" CssClass="Clicked">
                                    <i class="far fa-comments"></i>
                                    </asp:LinkButton>
                                </div>
                            </div>
                            <div class="col-sm-3">
                            </div>
                        </div>

                        <div class="form-group col-sm-12">
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
                </div>
            </asp:View>
        </asp:MultiView>
        <asp:Panel ID="pnlNav" runat="server">
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
        </asp:Panel>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {

            $('#<%=txtFromAdd.ClientID%>').autocomplete({
                source: 'AddressHandler.ashx'
            });
            $('#<%=txtToAdd.ClientID%>').autocomplete({
                source: 'AddressHandler.ashx'
            });

        });

        function HideLabel() {
            document.getElementById('<%= lblError.ClientID %>').style.display = "none";
        }
        setTimeout(HideLabel, 5000);

        function showModal() {
            $("#popAddItems").modal('show');
        }

        $(function () {
            $("#gvBtnSelect").click(function () {
                showModal();
            });
        });
        function ItemValidate() {
            if (document.getElementById("<%=txtItemName.ClientID%>").value == "") {
                //alert("Name Feild can not be blank");
                document.getElementById("<%=lblError.ClientID%>").value = "Please Enter Item Name."
                document.getElementById("<%=lblError.ClientID%>").visibility = "visible";
                $('#popAddItems').toggle();
                return false;
            }
            <%--if (document.getElementById("<%=txtEmail.ClientID %>").value == "") {
                alert("Email id can not be blank");
                document.getElementById("<%=txtEmail.ClientID %>").focus();
                return false;
            }
            var emailPat = /^(\".*\"|[A-Za-z]\w*)@(\[\d{1,3}(\.\d{1,3}){3}]|[A-Za-z]\w*(\.[A-Za-z]\w*)+)$/;
            var emailid = document.getElementById("<%=txtEmail.ClientID %>").value;
            var matchArray = emailid.match(emailPat);
            if (matchArray == null) {
                alert("Your email address seems incorrect. Please try again.");
                document.getElementById("<%=txtEmail.ClientID %>").focus();
                return false;
            }
            if (document.getElementById("<%=txtWebURL.ClientID %>").value == "") {
                alert("Web URL can not be blank");
                document.getElementById("<%=txtWebURL.ClientID %>").value = "http://"
        document.getElementById("<%=txtWebURL.ClientID %>").focus();
                return false;
            }
            var Url = "^[A-Za-z]+://[A-Za-z0-9-_]+\\.[A-Za-z0-9-_%&\?\/.=]+$"
            var tempURL = document.getElementById("<%=txtWebURL.ClientID%>").value;
            var matchURL = tempURL.match(Url);
            if (matchURL == null) {
                alert("Web URL does not look valid");
                document.getElementById("<%=txtWebURL.ClientID %>").focus();
                return false;
            }
            if (document.getElementById("<%=txtZIP.ClientID%>").value == "") {
                alert("Zip Code is not valid");
                document.getElementById("<%=txtZIP.ClientID%>").focus();
                return false;
            }
            var digits = "0123456789";
            var temp;
            for (var i = 0; i < document.getElementById("<%=txtZIP.ClientID %>").value.length; i++) {
                temp = document.getElementById("<%=txtZIP.ClientID%>").value.substring(i, i + 1);
         if (digits.indexOf(temp) == -1) {
             alert("Please enter correct zip code");
             document.getElementById("<%=txtZIP.ClientID%>").focus();
                    return false;
                }
            }--%>
            return true;
        }
    </script>
</asp:Content>
