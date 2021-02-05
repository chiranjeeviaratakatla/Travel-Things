<%@ Page Title="" Language="C#" MasterPageFile="~/BackEnd/BackEnd.Master" AutoEventWireup="true" CodeBehind="frmReceiver.aspx.cs" Inherits="TravelThings.BackEnd.frmReceiver" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<div style="width: 100%; height: 515px; overflow-y: scroll;">--%>
        <div class="col-sm-12">
            <h3>Get your Item</h3>
        </div>

        <div class="col-sm-12">
            <div style="height: 100%; overflow-x: scroll;">
                <table class="table table-hover">
                    <thead class="navbar">
                        <tr>
                            <th>Select</th>
                            <th>Firstname</th>
                            <th>Lastname</th>
                            <th>Email</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Details</button></td>
                            <td>John</td>
                            <td>Doe</td>
                            <td>john@example.com</td>
                        </tr>
                        <tr>
                            <td>
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Details</button></td>
                            <td>Mary</td>
                            <td>Moe</td>
                            <td>mary@example.com</td>
                        </tr>
                        <tr>
                            <td>
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Details</button></td>
                            <td>July</td>
                            <td>Dooley</td>
                            <td>july@example.com</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    <%--</div>--%>
    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">JON </h4>
                    <div class="col-sm-6 col-xs-6">
                        <a href="tel:123-456-7890" class="btn btn-primary">
                            <span class="glyphicon glyphicon-earphone"></span>Sender
                        </a>
                    </div>
                    <div class="col-sm-6 col-xs-6">
                        <a href="tel:123-456-7890" class="btn btn-info">
                            <span class="glyphicon glyphicon-earphone"></span>Traveler
                        </a>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="container-fluid text-center">
                        <div class="col-sm-12">
                            <div class="col-sm-6 col-xs-6">
                                <label>From :</label>
                            </div>
                            <div class="col-sm-6 col-xs-6">
                                <p>Jayapur</p>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="col-sm-6 col-xs-6">
                                <label>To :</label>
                            </div>
                            <div class="col-sm-6 col-xs-6">
                                <p>Pune</p>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="col-sm-6 col-xs-6">
                                <label>Wait :</label>
                            </div>
                            <div class="col-sm-6 col-xs-6">
                                <p>20 kgs</p>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="col-sm-6 col-xs-6">
                                <label>Item Type :</label>
                            </div>
                            <div class="col-sm-6 col-xs-6">
                                <p>Glass Item</p>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="col-sm-6 col-xs-6">
                                <label>Charges for Item :</label>
                            </div>
                            <div class="col-sm-6 col-xs-6">
                                <p>Rs 200/-</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
