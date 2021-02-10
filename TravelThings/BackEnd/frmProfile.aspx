<%@ Page Title="" Language="C#" MasterPageFile="~/BackEnd/BackEnd.Master" AutoEventWireup="true" CodeBehind="frmProfile.aspx.cs" Inherits="TravelThings.BackEnd.frmProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        @import url("https://fonts.googleapis.com/css?family=Lato:400,400i,700");

        body {
            /*background: -webkit-linear-gradient(left, #3931af, #00c6ff);*/
            /*background-image: linear-gradient(to right,#273f7f 0%,#37a0bc 100%);*/
            background-image: linear-gradient(to right,#0138cc8a 0%,#0092b966 100%);
        }

        .emp-profile {
            padding: 3%;
            margin-top: 3%;
            margin-bottom: 3%;
            border-radius: 0.5rem;
            background: #fff;
        }

        .profile-img {
            text-align: center;
        }

            .profile-img img {
                width: 70%;
                height: 100%;
            }

            .profile-img .file {
                position: relative;
                overflow: hidden;
                margin-top: -20%;
                width: 70%;
                border: none;
                border-radius: 0;
                font-size: 15px;
                background: #212529b8;
            }

                .profile-img .file input {
                    position: absolute;
                    opacity: 0;
                    right: 0;
                    top: 0;
                }

        .profile-head h5 {
            color: #333;
        }

        .profile-head h6 {
            color: #0062cc;
        }

        .profile-edit-btn {
            border: none;
            border-radius: 1.5rem;
            width: 70%;
            padding: 2%;
            font-weight: 600;
            color: #6c757d;
            cursor: pointer;
        }

        .proile-rating {
            font-size: 12px;
            color: #818182;
            margin-top: 5%;
        }

            .proile-rating span {
                color: #495057;
                font-size: 15px;
                font-weight: 600;
            }

        .profile-head .nav-tabs {
            margin-bottom: 5%;
        }

            .profile-head .nav-tabs .nav-link {
                font-weight: 600;
                border: none;
            }

                .profile-head .nav-tabs .nav-link.active {
                    border: none;
                    border-bottom: 2px solid #0062cc;
                }

        .profile-work {
            padding: 14%;
            margin-top: -15%;
        }

            .profile-work p {
                font-size: 12px;
                color: #818182;
                font-weight: 600;
                margin-top: 10%;
            }

            .profile-work a {
                text-decoration: none;
                color: #495057;
                font-weight: 600;
                font-size: 14px;
            }

            .profile-work ul {
                list-style: none;
            }

        .profile-tab label {
            font-weight: 600;
        }

        .profile-tab p {
            font-weight: 600;
            color: #0062cc;
        }
        /**/
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- <div style="width: 100%; height: 515px; overflow-y: scroll;">--%>
    <asp:Panel ID="pnlProfileView" runat="server">
        <div class="container emp-profile">
            <div class="row">
                <div class="col-md-4">
                    <div class="profile-img">
                        <%--<img src="../Images/Profile.jpg" width="100" height="100" />--%>
                        <asp:Image ID="imgProfilePic" runat="server" Height="150px" Width="150px" ImageUrl="~/Images/Profile.jpg" />
                        <div>
                            <asp:Button ID="btnChangePhoto" CssClass="file btn btn-lg btn-primary" Text="Change Photo" runat="server" />
                            <%--<input type="file" name="file" />--%>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">

                    <div class="profile-head">
                        <h3>Welcome : Chiru</h3>
                        <p class="proile-rating">TOTAL REVARDS : <span>RS 540/-</span></p>
                    </div>
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btnEditProfile" runat="server" Text="Edit Profile" class="profile-edit-btn" OnClick="btnEditProfile_Click" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="profile-work">
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="form-group col-sm-12 col-xs-12">

                        <asp:Button Text="Profile" BorderStyle="None" ID="tabProfile" OnClick="tabProfile_Click" CssClass="Initial" runat="server" />
                        <asp:Button Text="Adderess" BorderStyle="None" ID="tabAddress" OnClick="tabAddress_Click" CssClass="Initial" runat="server" />
                        <asp:Button Text="Change Password" BorderStyle="None" ID="tabChangePsw" OnClick="tabChangePsw_Click" CssClass="Initial" runat="server" />
                        <%--<asp:Button Text="Pyament" BorderStyle="None" ID="btnPayment" CssClass="Initial" runat="server" />--%>
                    </div>
                    <asp:MultiView ID="MainViewProfile" runat="server">
                        <asp:View runat="server" ID="viewProfile">
                            <div class="form-group col-sm-12">
                                <div class="col-sm-12">
                                    <div class="col-sm-6">
                                        <label>Name:</label>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:Label ID="lblUserName" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="col-sm-6">
                                        <label>User Name:</label>
                                    </div>

                                    <div class="col-sm-6">
                                        <asp:Label ID="lblPhoneNo" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="col-sm-6">
                                        <label>Alternative Phone:</label>
                                    </div>

                                    <div class="col-sm-6">
                                        <asp:Label ID="lblAltPhone" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="col-sm-6">
                                        <label>Aadhar:</label>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:Label ID="lblAadharNo" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="col-sm-6">
                                        <label>Mail Id:</label>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:Label ID="lblEmailId" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </asp:View>

                        <asp:View runat="server" ID="viewAddress">
                            <div class="form-group col-sm-12">
                                <div class="col-sm-12">
                                    <div class="col-sm-6">
                                        <label>Area:</label>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:Label ID="lblArea" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="col-sm-6">
                                        <label>City:</label>
                                    </div>

                                    <div class="col-sm-6">
                                        <asp:Label ID="lblCity" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="col-sm-6">
                                        <label>State</label>
                                    </div>

                                    <div class="col-sm-6">
                                        <asp:Label ID="lblState" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="col-sm-6">
                                        <label>Pin Code</label>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:Label ID="lblPinCode" runat="server"></asp:Label>
                                    </div>
                                </div>

                            </div>
                        </asp:View>
                        <asp:View runat="server" ID="viewChangePsw">
                            <div class="form-group col-sm-12">
                                <div class="col-sm-12">
                                    <div class="col-sm-6">
                                        <label>Old Password</label>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="txtOldPsw" runat="server" CssClass="form-control" placeholder="Ener Old Password"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="col-sm-6">
                                        <label>New Password</label>
                                    </div>

                                    <div class="col-sm-6">
                                        <asp:TextBox ID="txtNewPsw" runat="server" CssClass="form-control" placeholder="Ener New Password"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="col-sm-6">
                                        <label>Conform Password</label>
                                    </div>

                                    <div class="col-sm-6">
                                        <asp:TextBox ID="txtConformPsw" runat="server" CssClass="form-control" placeholder="Ener Conform Password"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="col-sm-6">
                                    </div>

                                    <div class="col-sm-6">
                                        <asp:Button ID="btnChangePsw" runat="server" CssClass="btn btn-primary" Text="Change Password" OnClick="btnChangePsw_Click" />
                                        <asp:Button ID="btnClearPsw" runat="server" CssClass="btn btn-danger" Text="Clear" OnClick="btnClearPsw_Click" />
                                    </div>
                                </div>
                            </div>
                        </asp:View>
                    </asp:MultiView>
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlProfileEdit" Visible="false" runat="server">
        <div class="container emp-profile">
            <div class="form-group col-sm-12">
                <h1>Profile</h1>
            </div>
            <div class="form-group col-sm-4 col-md-3">
                <label>Name:</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" ToolTip="Enter your Name"></asp:TextBox>
            </div>
            <div class="form-group col-sm-4 col-md-3">
                <label for="usr">Phone No:</label>
                <asp:TextBox ID="txtPhoneNo" runat="server" MaxLength="10" Enabled="false" CssClass="form-control" ToolTip="Enter Phone No"></asp:TextBox>
            </div>
            <div class="form-group col-sm-4 col-md-3">
                <label>Aternative Phone Number:</label>
                <asp:TextBox ID="txtAltPhNo" runat="server" MaxLength="10" CssClass="form-control" ToolTip="Optional"></asp:TextBox>
            </div>
            <div class="form-group col-sm-4 col-md-3">
                <label>Email ID:</label>
                <asp:TextBox ID="txtEmailId" runat="server" TextMode="Email" CssClass="form-control" ToolTip="Please Enter Email ID"></asp:TextBox>
            </div>
            <div class="form-group col-sm-4 col-md-3">
                <label>Aadhar No:</label>
                <asp:TextBox ID="txtAahdar" runat="server" MaxLength="12" CssClass="form-control" ToolTip="Enter Aadhar No"></asp:TextBox>
            </div>

            <div class="form-group col-sm-4 col-md-3">
                <label>Area:</label>
                <asp:TextBox ID="txtArea" runat="server" CssClass="form-control" ToolTip="Enter Your Area"></asp:TextBox>
            </div>
            <div class="form-group col-sm-4 col-md-3">
                <label>City:</label>
                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" ToolTip="Enter Your City"></asp:TextBox>
            </div>
            <div class="form-group col-sm-4 col-md-3">
                <label>State:</label>
                <asp:TextBox ID="txtState" runat="server" CssClass="form-control" ToolTip="Enter Your State"></asp:TextBox>
            </div>
            <div class="form-group col-sm-4 col-md-3">
                <label>Pin Code:</label>
                <asp:TextBox ID="txtPinCode" runat="server" MaxLength="6" CssClass="form-control" ToolTip="Enter Your Pincode"></asp:TextBox>
            </div>
            <div class="form-group col-sm-4 col-md-3">
                <label>Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" MaxLength="15" CssClass="form-control" ToolTip="Enter Your Pincode" TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group col-sm-4 col-md-3">
                <label>Confirm Password:</label>
                <asp:TextBox ID="txtConPassword" runat="server" MaxLength="15" CssClass="form-control" ToolTip="Enter Your Pincode" TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group col-sm-4 col-md-3">
                <label>&nbsp;</label>
                <asp:CheckBox ID="chkShowPws" runat="server" Text="Show Password" CssClass="form-control" AutoPostBack="true" OnCheckedChanged="chkShowPws_CheckedChanged" />
            </div>
            <div class="form-group col-sm-4 col-md-3">
                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click" Text="Save" />
                <asp:Button ID="btnEdit" runat="server" CssClass="btn btn-primary" Visible="false" OnClick="btnEdit_Click" Text="Edit" />
                <span></span>
                <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-warning" OnClick="btnCancel_Click" Text="Cancel" />
            </div>
        </div>
    </asp:Panel>


    <%--</div>--%>
</asp:Content>
