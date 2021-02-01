<%@ Page Title="" Language="C#" MasterPageFile="~/BackEnd/BackEnd.Master" AutoEventWireup="true" CodeBehind="frmSender.aspx.cs" Inherits="TravelThings.BackEnd.tabTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        $(function () {
            SetTabs();
        });
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        if (prm != null) {
            prm.add_endRequest(function (sender, e) {
                if (sender._postBackSettings.panelsToUpdate != null) {
                    SetTabs();
                }
            });
        };
        function SetTabs() {
            var tabName = $("[id*=TabName]").val() != "" ? $("[id*=TabName]").val() : "information";
            $('#main-content a[href="#' + tabName + '"]').tab('show');
            $("#main-content a").click(function () {
                $("[id*=TabName]").val($(this).attr("href").replace("#", ""));
            });
        };
    </script>
    <div style="width: 100%; height: 515px; overflow-y: scroll;">
        <div id="main-content">
            <ul class="nav nav-pills" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="information-tab" data-toggle="tab" href="#information" role="tab" aria-controls="information" aria-selected="true">Items</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="employee-tab" data-toggle="tab" href="#employee" role="tab" aria-controls="employee" aria-selected="false">Desitination</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="documents-tab" data-toggle="tab" href="#documents" role="tab" aria-controls="documents" aria-selected="false">Reciver</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="transfer-tab" data-toggle="tab" href="#transfer" role="tab" aria-controls="transfer" aria-selected="false">Transfer History</a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <%-- Item --%>
                <div class="tab-pane fade show active" id="information" role="tabpanel" aria-labelledby="information-tab">
                    <div class="form-group col-sm-12">
                        <h3>Send your Items</h3>
                    </div>
                </div>
                <%-- Destination --%>
                <div class="tab-pane fade" id="employee" role="tabpanel" aria-labelledby="employee-tab">
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
                <%-- Recevir --%>
                <div class="tab-pane fade" id="documents" role="tabpanel" aria-labelledby="documents-tab">
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
                <%-- extra --%>
                <div class="tab-pane fade" id="transfer" role="tabpanel" aria-labelledby="transfer-tab">
                </div>
            </div>

            <asp:HiddenField ID="TabName" runat="server" Value="information" />
        </div>
    </div>

</asp:Content>
