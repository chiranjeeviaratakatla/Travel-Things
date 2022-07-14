<%@ Page Title="" Language="C#" MasterPageFile="~/BackEnd/BackEnd.Master" AutoEventWireup="true" CodeBehind="frmProfile.aspx.cs" Inherits="TravelThings.BackEnd.frmProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/UploadImg/css/jquery.Jcrop.css" rel="stylesheet" />
    <script src="Css/UploadImg/js/jquery.min.js"></script>
    <script src="Css/UploadImg/js/jquery.Jcrop.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%=imgUpload.ClientID%>').Jcrop({
                onSelect: SelectCropArea
            });
        });

        function SelectCropArea(c) {
            $('#<%=X.ClientID%>').val(parseInt(c.x));
            $('#<%=Y.ClientID%>').val(parseInt(c.y));
            $('#<%=W.ClientID%>').val(parseInt(c.w));
            $('#<%=H.ClientID%>').val(parseInt(c.h));
        }
        function ShowHidePassword() {
            var txtOld = $('#<%=txtOldPsw.ClientID%>');
            var txtNew = $('#<%=txtNewPsw.ClientID%>');
            var txtConform = $('#<%=txtConformPsw.ClientID%>');
            if (txtOld.prop("type") == "password") {
                txtOld.prop("type", "text");
                txtNew.prop("type", "text");
                txtConform.prop("type", "text");
                $("label[for='cbShowHidePassword']").text("Hide Password");
            }
            else {
                txtOld.prop("type", "password");
                txtNew.prop("type", "password");
                txtConform.prop("type", "password");
                $("label[for='cbShowHidePassword']").text("Show Password");
            }
        }
        function ChaingPswValidation() {
            var txtOld = document.getElementById("txtOldPsw").value;
            var txtNew = $('#<%=txtNewPsw.ClientID%>');
            var txtConform = $('#<%=txtConformPsw.ClientID%>');
            if (txtOld == '') {
                swal({
                    title: 'Congratulations!',
                    text: 'Your message has been succesfully sent',
                    type: 'success'
                });
                return false;
            }

        }
    </script>
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
                width: 80%;
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
    <asp:Panel ID="pnlUploadProfilePic" runat="server" Visible="false">
        <div class="container emp-profile">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-6">
                        <asp:FileUpload ID="FileUplod" CssClass="file btn btn-lg btn-primary" runat="server" />
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btnUpload" CssClass="btn btn-primary" runat="server" Text="Upload Image" OnClick="btnUpload_Click" />
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btnCrop" runat="server" CssClass="btn btn-primary" Visible="false" Text="Crop & Save" OnClick="btnCrop_Click" />
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btnCancelImage" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="btnCancelImage_Click" />
                    </div>
                </div>
                <div class="col-md-12">

                    <asp:Panel ID="panCrop" runat="server">
                        <asp:Image ID="imgUpload" runat="server" Height="50%" />

                        <asp:HiddenField ID="X" runat="server" />
                        <asp:HiddenField ID="Y" runat="server" />
                        <asp:HiddenField ID="W" runat="server" />
                        <asp:HiddenField ID="H" runat="server" />
                    </asp:Panel>
                </div>
                <div class="col-md-12">
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlProfileView" runat="server">
        <div class="container emp-profile">
            <div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
                <div class="profile-img">
                    <%--<img src="../Images/Profile.jpg" width="100" height="100" />--%>
                    <asp:Image ID="imgProfilePic" runat="server" Height="150px" Width="150px" ImageUrl="~/Images/Profile.jpg" />
                    <div>
                        <asp:Button ID="btnChangePhoto" CssClass="file btn btn-lg btn-primary" OnClick="btnChangePhoto_Click" Text="Change Photo" runat="server" />
                        <%--<input type="file" name="file" />--%>
                    </div>
                </div>

            </div>
            <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">
                <%-- <div class="form-group">
                        <div class="row">--%>
                <div class="profile-head">
                    <h3>Welcome 
                            <asp:Label ID="lblWelUName" runat="server"></asp:Label></h3>
                    <p class="proile-rating">
                        TOTAL REWARDS : <span>RS
                            <asp:Label ID="lblRevards" runat="server"></asp:Label>
                            /-</span>
                    </p>
                </div>
                <%--</div>
                    </div>--%>
            </div>
            <div class="col-md-2 col-xs-12">
                <div class="form-group">
                    <div class="row">
                        <asp:Button ID="btnEditProfile" runat="server" Text="Edit Profile" class="profile-edit-btn" OnClick="btnEditProfile_Click" />
                    </div>
                </div>
            </div>
            <div class="col-md-2 col-xs-12">
            </div>
            <div class="col-md-8">
                <div class="form-group">
                    <div class="row">
                        <div class="col-sm-12 col-xs-12">
                            <div class="col-sm-4 col-xs-4">
                                <asp:Button Text="Profile" BorderStyle="None" ID="tabProfile" OnClick="tabProfile_Click" CssClass="Initial" runat="server" />
                            </div>
                            <div class="col-sm-4 col-xs-4">
                                <asp:Button Text="Address" BorderStyle="None" ID="tabAddress" OnClick="tabAddress_Click" CssClass="Initial" runat="server" />
                            </div>
                            <div class="col-sm-4 col-xs-4">
                                <asp:Button Text="Change Psw" BorderStyle="None" ID="tabChangePsw" OnClick="tabChangePsw_Click" CssClass="Initial" runat="server" />
                            </div>
                            <%--<asp:Button Text="Pyament" BorderStyle="None" ID="btnPayment" CssClass="Initial" runat="server" />--%>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-xs-12">
                    <div class="form-group">
                        <div class="row">
                            <asp:MultiView ID="MainViewProfile" runat="server">
                                <asp:View runat="server" ID="viewProfile">
                                    <div class="col-sm-12 col-xs-12">
                                        <div class="row">
                                            <div class="col-sm-12 col-xs-12">
                                                <div class="col-sm-6 col-xs-6">
                                                    <label>Name:</label>
                                                </div>
                                                <div class="col-sm-6 col-xs-6">
                                                    <asp:Label ID="lblUserName" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-xs-12">
                                                <div class="col-sm-6 col-xs-6">
                                                    <label>User Name:</label>
                                                </div>

                                                <div class="col-sm-6 col-xs-6">
                                                    <asp:Label ID="lblPhoneNo" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-xs-12">
                                                <div class="col-sm-6 col-xs-6">
                                                    <label>Alternative Phone:</label>
                                                </div>

                                                <div class="col-sm-6 col-xs-6">
                                                    <asp:Label ID="lblAltPhone" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-xs-12">
                                                <div class="col-sm-6 col-xs-6">
                                                    <label>Aadhar No:</label>
                                                </div>
                                                <div class="col-sm-6 col-xs-6">
                                                    <asp:Label ID="lblAadharNo" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-xs-12">
                                                <div class="col-sm-6 col-xs-6">
                                                    <label>Mail ID:</label>
                                                </div>
                                                <div class="col-sm-6 col-xs-6">
                                                    <asp:Label ID="lblEmailId" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </asp:View>

                                <asp:View runat="server" ID="viewAddress">
                                    <div class="form-group col-sm-12 col-xs-12">
                                        <div class="row">
                                            <div class="col-sm-12 col-xs-12">
                                                <div class="col-sm-6 col-xs-6">
                                                    <label>Area:</label>
                                                </div>
                                                <div class="col-sm-6 col-xs-6">
                                                    <asp:Label ID="lblArea" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-xs-12">
                                                <div class="col-sm-6 col-xs-6">
                                                    <label>City:</label>
                                                </div>

                                                <div class="col-sm-6 col-xs-6">
                                                    <asp:Label ID="lblCity" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-xs-12">
                                                <div class="col-sm-6 col-xs-6">
                                                    <label>State</label>
                                                </div>

                                                <div class="col-sm-6 col-xs-6">
                                                    <asp:Label ID="lblState" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-xs-12">
                                                <div class="col-sm-6 col-xs-6">
                                                    <label>Pin Code</label>
                                                </div>
                                                <div class="col-sm-6 col-xs-6">
                                                    <asp:Label ID="lblPinCode" runat="server"></asp:Label>
                                                </div>
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
                                                <asp:TextBox ID="txtOldPsw" TextMode="Password" runat="server" CssClass="form-control" placeholder="Enter Old Password"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="col-sm-6">
                                                <label>New Password</label>
                                            </div>

                                            <div class="col-sm-6">
                                                <asp:TextBox ID="txtNewPsw" TextMode="Password" runat="server" CssClass="form-control" placeholder="Enter New Password"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="col-sm-6">
                                                <label>Confirm Password</label>
                                            </div>

                                            <div class="col-sm-6">
                                                <asp:TextBox ID="txtConformPsw" TextMode="Password" runat="server" CssClass="form-control" placeholder="Enter Confirm Password"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="col-sm-6">
                                            </div>

                                            <div class="col-sm-6">
                                                <asp:Button ID="btnChangePsw" runat="server" CssClass="btn btn-primary" Text="Change Password" OnClientClick="return ChaingPswValidation();" /><%--OnClick="btnChangePsw_Click"--%>
                                                <asp:Button ID="btnClearPsw" runat="server" CssClass="btn btn-danger" Text="Clear" OnClick="btnClearPsw_Click" />
                                                <asp:CheckBox ID="chkShowPws" runat="server" Visible="false" AutoPostBack="true" Text="Show Psw" OnCheckedChanged="chkShowPws_CheckedChanged" />
                                            </div>
                                            <div class="col-sm-6">
                                            </div>
                                            <div class="col-sm-6">
                                                <input id="cbShowHidePassword" type="checkbox" onclick="ShowHidePassword();" />
                                                <label for='cbShowHidePassword'>Show Password</label>
                                            </div>
                                        </div>
                                    </div>
                                </asp:View>
                            </asp:MultiView>
                        </div>
                    </div>
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
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" ToolTip="Enter your Name" placeholder="Enter your Name"></asp:TextBox>
            </div>
            <div class="form-group col-sm-4 col-md-3">
                <label for="usr">Phone No:</label>
                <asp:TextBox ID="txtPhoneNo" runat="server" MaxLength="10" Enabled="false" CssClass="form-control" ToolTip="Enter Phone No" placeholder="Enter Phone No" onkeypress="return onlyNumbers(event)"></asp:TextBox>
            </div>
            <div class="form-group col-sm-4 col-md-3">
                <label>Aternative Phone Number:</label>
                <asp:TextBox ID="txtAltPhNo" runat="server" MaxLength="10" CssClass="form-control" ToolTip="Enter Alternative Phone No" placeholder="Optional" onkeypress="return onlyNumbers(event)"></asp:TextBox>
            </div>
            <div class="form-group col-sm-4 col-md-3">
                <label>Email ID:</label>
                <asp:TextBox ID="txtEmailId" runat="server" TextMode="Email" CssClass="form-control" ToolTip="Enter Email ID" placeholder="Enter Email ID"></asp:TextBox>
            </div>
            <div class="form-group col-sm-4 col-md-3">
                <label>Aadhar No:</label>
                <asp:TextBox ID="txtAahdar" runat="server" MaxLength="12" CssClass="form-control" ToolTip="Enter Aadhar No" placeholder="Enter Aadhar No" onkeypress="return onlyNumbers(event)"></asp:TextBox>
            </div>
            <div class="form-group col-sm-4 col-md-3">
                <label>State:</label>
                <asp:TextBox ID="txtState" runat="server" CssClass="form-control" ToolTip="Enter Your State" placeholder="Enter Your State"></asp:TextBox>
            </div>
            <div class="form-group col-sm-4 col-md-3">
                <label>City:</label>
                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" ToolTip="Enter Your City" placeholder="Enter Your City"></asp:TextBox>
            </div>
            <div class="form-group col-sm-4 col-md-3">
                <label>Area:</label>
                <asp:TextBox ID="txtArea" runat="server" CssClass="form-control" ToolTip="Enter Your Area" placeholder="Enter Your Area"></asp:TextBox>
            </div>
            <div class="form-group col-sm-4 col-md-3">
                <label>Pin Code:</label>
                <asp:TextBox ID="txtPinCode" runat="server" MaxLength="6" CssClass="form-control" placeholder="Enter Your Pincode" ToolTip="Enter Your Pincode"></asp:TextBox>
            </div>
            <div class="form-group col-sm-12 col-md-12">
                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click" Text="Save" />
                <asp:Button ID="btnEdit" runat="server" CssClass="btn btn-primary" Visible="false" OnClick="btnEdit_Click" Text="Edit" />
                <span></span>
                <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-warning" OnClick="btnCancel_Click" Text="Cancel" />
            </div>
        </div>
    </asp:Panel>


    <%--</div>--%>
</asp:Content>
