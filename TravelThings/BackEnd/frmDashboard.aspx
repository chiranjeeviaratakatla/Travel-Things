<%@ Page Title="" Language="C#" MasterPageFile="~/BackEnd/BackEnd.Master" AutoEventWireup="true" CodeBehind="frmDashboard.aspx.cs" Inherits="TravelThings.BackEnd.frmDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Travel Things </title>

    <style>
        /*cards*/
        body {
            /*margin-top: 20px;*/
            /*background: #FAFAFA;*/
            background-image: linear-gradient(to right,#0138cc8a 0%,#0092b966 100%);
        }

        .profile {
            padding: 3%;
            margin-top: 3%;
            margin-bottom: 3%;
            border-radius: 0.5rem;
            background: #fff;
        }

        .order-card {
            color: #fff;
        }

        .bg-c-blue {
            background: linear-gradient(45deg,#4099ff,#73b4ff);
        }

        .bg-c-green {
            background: linear-gradient(45deg,#2ed8b6,#59e0c5);
        }

        .bg-c-yellow {
            background: linear-gradient(45deg,#FFB64D,#ffcb80);
        }

        .bg-c-pink {
            background: linear-gradient(45deg,#FF5370,#ff869a);
        }


        .card {
            border-radius: 5px;
            -webkit-box-shadow: 0 1px 2.94px 0.06px rgba(4,26,55,0.16);
            box-shadow: 0 1px 2.94px 0.06px rgba(4,26,55,0.16);
            border: none;
            margin-bottom: 30px;
            -webkit-transition: all 0.3s ease-in-out;
            transition: all 0.3s ease-in-out;
        }

            .card .card-block {
                padding: 25px;
            }

        .order-card i {
            font-size: 26px;
        }

        .f-left {
            float: left;
        }

        .f-right {
            float: right;
        }

        .text-shadow {
            text-shadow: 2px 2px 4px #000000;
        }

        .profile-edit-btn {
            border: none;
            border-radius: 1.5rem;
            width: 100%;
            padding: 2%;
            font-weight: 600;
            color: #6c757d;
            cursor: pointer;
        }

       
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:Panel ID="pnlDashboard" runat="server">
        <div class="container profile">
            <div class="row">
                <div class="col-md-6 col-xl-6 col-xs-12 col-sm-6">
                    <div class="card bg-c-blue order-card">
                        <div class="card-block">
                            <h3 class="m-b-20 text-shadow">Travel Request's</h3>
                            <h2 class="text-right text-shadow"><i class="fa fa-bell f-left"></i><span>
                                <asp:Label ID="lblTravelRequest" Text="0" runat="server"></asp:Label></span></h2>
                            <a class="m-b-0">
                                <asp:LinkButton ID="lbTravelRequest" Text="More Details" OnClick="lbTravelRequest_Click" runat="server"></asp:LinkButton></a><%--<span class="f-right">351</span>--%>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-xl-6 col-xs-12 col-sm-6">
                    <div class="card bg-c-green order-card">
                        <div class="card-block">
                            <h3 class="m-b-20 text-shadow">Sent Items</h3>
                            <h2 class="text-right text-shadow"><i class="fa fa-paper-plane f-left"></i><span>
                                <asp:Label ID="lblSentItems" Text="0" runat="server"></asp:Label></span></h2>
                            <a class="m-b-0">
                                <asp:LinkButton ID="lbSendItems" Text="More Details" OnClick="lbSendItems_Click" runat="server"></asp:LinkButton>
                            </a><%--<span class="f-right">351</span>--%>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-xl-6 col-xs-12 col-sm-6">
                    <div class="card bg-c-yellow order-card">
                        <div class="card-block">
                            <h3 class="m-b-20 text-shadow">Received Items</h3>
                            <h2 class="text-right text-shadow"><i class="fa fa-cubes f-left"></i><span>
                                <asp:Label ID="lblReceivedItems" Text="0" runat="server"></asp:Label></span></h2>
                            <a class="m-b-0">
                                <asp:LinkButton ID="lbReceivedItem" Text="More Details" OnClick="lbReceivedItem_Click" runat="server"></asp:LinkButton></a><%--<span class="f-right">351</span>--%>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-xl-6 col-xs-12 col-sm-6">
                    <div class="card bg-c-pink order-card">
                        <div class="card-block">
                            <h3 class="m-b-20 text-shadow">Travel Details</h3>
                            <h2 class="text-right text-shadow"><i class="fa fa-bicycle f-left"></i><span>
                                <asp:Label ID="lblTravelerDetails" Text="0" runat="server"></asp:Label></span></h2>
                            <a class="m-b-0">
                                <asp:LinkButton ID="lbTravelDetails" Text="More Details" OnClick="lbTravelDetails_Click" runat="server"></asp:LinkButton></a><%--<span class="f-right">351</span>--%>
                        </div>
                    </div>
                </div>
            </div>
            <%-- <div class="row">
                 <div class="col-md-6 col-xl-6 col-xs-12 col-sm-6">
                    <div class="card bg-c-pink order-card">
                        <div class="card-block">
                            <h3 class="m-b-20 text-shadow">Travel Details</h3>
                            <h2 class="text-right text-shadow"><i class="fa fa-bicycle f-left"></i><span>
                                <asp:Label ID="Label1" Text="0" runat="server"></asp:Label></span></h2>
                            <a class="m-b-0">
                                <asp:LinkButton ID="LinkButton1" Text="More Details" runat="server"></asp:LinkButton></a>
                        </div>
                    </div>
                </div>
                 <div class="col-md-6 col-xl-6 col-xs-12 col-sm-6">
                    <div class="card bg-c-pink order-card">
                        <div class="card-block">
                            <h3 class="m-b-20 text-shadow">Travel Details</h3>
                            <h2 class="text-right text-shadow"><i class="fa fa-bicycle f-left"></i><span>
                                <asp:Label ID="Label2" Text="0" runat="server"></asp:Label></span></h2>
                            <a class="m-b-0">
                                <asp:LinkButton ID="LinkButton2" Text="More Details" runat="server"></asp:LinkButton></a>
                        </div>
                    </div>
                </div>
            </div>--%>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlTravelRequest" runat="server" Visible="false">
        <div class="container profile">
            <div class="row">
                <div class="col-sm-10">
                </div>
                <div class="col-sm-2">
                    <asp:Button ID="btnBackToDashboard" runat="server" Text="Back to Dashboard" class="profile-edit-btn" OnClick="btnBackToDashboard_Click" />
                </div>
                <div class="col-sm-12 col-xs-12">
                    <div style="width: 100%; height: 100%; overflow: auto;">
                        <asp:GridView ID="gvTravelRequist" runat="server" Width="100%" CssClass="table table-hover" AutoGenerateColumns="false">
                            <Columns>
                                <asp:TemplateField HeaderText="Select">
                                    <ItemTemplate>
                                        <asp:Button ID="gvBtnSelect" runat="server" Text="Accept" CssClass="btn btn-primary" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>" />
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
                                        <asp:Button ID="btnDeleteJoureny" runat="server" Text="Reject" CssClass="btn btn-danger" CommandName="DeleteItem" CommandArgument="<%# Container.DataItemIndex %>" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
