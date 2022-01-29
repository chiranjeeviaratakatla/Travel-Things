<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="TravelThings.BackEnd.frmLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Travel Things </title>
    <link rel="icon" type="image/gif/png" href="../Images/titleLogoSmall.png" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <%-- Bootstrap --%>
    <link href="../BackEnd/Css/Bootstrap_V_3_4_1.css" rel="stylesheet" />
    <script src="../BackEnd/JavaScript/JQuery_V_3_4_1.js" type="text/javascript"></script>
    <script src="../BackEnd/JavaScript/BootstrapCdnMin.js" type="text/javascript"></script>
    <script src="../BackEnd/JavaScript/CommonFunctions.js" type="text/javascript"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
    <%-- Sweet Alert --%>
    <script src="../BackEnd/JavaScript/SweetAlert.js" type="text/javascript"></script>
    <link href="../BackEnd/Css/SweetAlert.css" rel="stylesheet" />
    <style>
        .form-gap {
            padding-top: 70px;
        }

        .imageSelection {
            user-select: none;
        }
    </style>
    <script lang="text/javascript">
         // Only ASCII character in that range allowed
        function onlyNumbers(event) {
            var charCode = (event.which) ? event.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }
        <%-- function PhoneNoErrorMessage() {
            var Number = document.getElementById("btnLogin");
            var ErrorMsg = '';
            var phoneno = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
            if (!Number.length < 11 || !Number.length < 9) {
                ErrorMsg = 'Invalid phone number format. Please Check'
            }
            else if ((Number.value.match(phoneno)) {
                ErrorMsg = 'Please enter 10 digit mobile number'
            }
            if (ErrorMsg.length = '') {
                alert(ErrorMsg)
            }
        }--%>
</script>
</head>
<body style="background-image: linear-gradient(to right,#273f7f 0%,#37a0bc 100%)">
    <form id="login" runat="server">
        <div class="form-gap"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="text-center">
                                <h3>
                                    <%--<i class="fa fa-lock fa-4x"></i>--%>
                                    <asp:Image ID="imgLogo" ImageUrl="~/Images/LogoTTLogin.png" Width="200px" CssClass="imageSelection" runat="server" Height="150px" />
                                </h3>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-phone fa-1x"></i></span>
                                            <asp:TextBox ID="txtPhoneNo" runat="server" MaxLength="10" TextMode="Phone" placeholder="Enter Phone No" CssClass="form-control" onkeypress="return onlyNumbers(event)"></asp:TextBox>
                                            <%--<input id="email" name="email" placeholder="email address" class="form-control" type="email">--%>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-lock fa-1x"></i></span>
                                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Enter Password" CssClass="form-control"></asp:TextBox>
                                            <%--<input id="email" name="email" placeholder="email address" class="form-control" type="email">--%>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-lg btn-primary btn-block" OnClick="btnLogin_Click" OnClientClick="PhoneNoErrorMessage()" Text="Login" />
                                        <%--<asp:Button ID="btnSendOtp" runat="server" CssClass="btn btn-lg btn-primary btn-block" Text="Reset Password" />--%>
                                        <%--<input name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Reset Password" type="submit">--%>
                                    </div>
                                    <div class="form-group">
                                        <asp:CheckBox ID="chkRemeber" runat="server" CssClass="form-control alert-info checkbox" Text="Remember me" />
                                    </div>
                                    <%--<input type="hidden" class="hide" name="token" id="token" value="">--%>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-footer">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <u><span class="pull-left">
                                    <asp:HyperLink ID="hlRegister" NavigateUrl="~/Index.aspx" runat="server" Text="Register"></asp:HyperLink>
                                </span></u>
                                <u><span class="pull-right">
                                    <asp:HyperLink ID="hlForgotPassword" runat="server" NavigateUrl="~/Login/frmForgotPassword.aspx" Text="Forgot Password"></asp:HyperLink>
                                </span></u>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
