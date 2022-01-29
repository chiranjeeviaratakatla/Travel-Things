<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmForgotPassword.aspx.cs" Inherits="TravelThings.BackEnd.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Travel Things </title>
    <link rel="icon" type="image/gif/png" href="../Images/titleLogoSmall.png">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%-- Bootstrap --%>
    <link href="../BackEnd/Css/Bootstrap_V_3_4_1.css" rel="stylesheet" />
    <script src="../BackEnd/JavaScript/JQuery_V_3_4_1.js" type="text/javascript"></script>
    <script src="../BackEnd/JavaScript/BootstrapCdnMin.js" type="text/javascript"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"/>
    <style>
        .form-gap {
            padding-top: 70px;
        }
    </style>
</head>
<body style="background-image: linear-gradient(to right,#273f7f 0%,#37a0bc 100%)">
    <form id="form1" runat="server">
        <asp:Panel ID="pnlSendMail" runat="server" Visible="true">
            <div class="form-gap"></div>
            <div class="container">

                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="text-center">
                                    <h3>
                                        <%--<i class="fa fa-lock fa-4x"></i>--%>
                                        <asp:Image ID="imgLogo" ImageUrl="~/Images/LogoTTLogin.png" Width="200px" runat="server" Height="150px" />
                                    </h3>
                                    <h2 class="text-center">Forgot Password?</h2>
                                    <p>You can reset your password here.</p>
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                                                <asp:TextBox ID="txtEmail" placeholder="Email Address" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                                <%--<input id="email" name="email" placeholder="email address" class="form-control" type="email">--%>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Button ID="btnSendOtp" runat="server" CssClass="btn btn-info btn-block" Text="Send OTP" OnClick="btnSendOtp_Click" />
                                            <%--<input name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Reset Password" type="submit">--%>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-lock fa-1x"></i></span>
                                                <asp:TextBox ID="TextBox1" placeholder="OTP" runat="server" CssClass="form-control"></asp:TextBox>
                                                <%--<input id="email" name="email" placeholder="email address" class="form-control" type="email">--%>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Button ID="btnRestPassowrd" runat="server" CssClass="btn btn-primary btn-block" Text="Reset Password"/>
                                            <%--<input name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Reset Password" type="submit">--%>
                                        </div>

                                        <%--<input type="hidden" class="hide" name="token" id="token" value="">--%>
                                    </div>
                                     <div class="d-flex justify-content-between align-items-center mb-2">
                                            <u>
                                                <span class="pull-left">
                                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login/frmLogin.aspx" Text="Back to Log In"></asp:HyperLink>
                                                </span>
                                            </u>

                                            <u>
                                                <span class="pull-right">
                                                    <asp:HyperLink ID="HyperLink2" NavigateUrl="~/Index.aspx" runat="server" Text="Register"></asp:HyperLink>
                                                </span>
                                            </u>
                                        </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </asp:Panel>
        <asp:Panel ID="pnlResetPassword" runat="server" Visible="false">
            <div class="form-gap"></div>
            <div class="container">

                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <div class="panel panel-default">
                            <div class="panel-body">

                                <div class="text-center">
                                    <h3>
                                        <%--<i class="fa fa-lock fa-4x"></i>--%>
                                        <asp:Image ID="Image1" ImageUrl="~/Images/LogoTTLogin.png" Width="200px" runat="server" Height="150px" />
                                    </h3>
                                    <!--Section: Block Content-->
                                    <section class="mb-5 text-center">
                                        <h2 class="text-center">Set a new password</h2>

                                        <div class="md-form md-outline">
                                            <span class="pull-left">
                                                <label data-error="wrong" data-success="right" for="newPass">New password</label>
                                            </span>
                                            <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" placeholder="New Password"></asp:TextBox>
                                            <%--<input type="password" id="newPass" class="form-control">--%>
                                        </div>
                                        <div class="md-form md-outline">
                                            <span class="pull-left">
                                                <label data-error="wrong" data-success="right" for="newPassConfirm">Confirm password</label>
                                                </span>
                                            <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" placeholder="Confirm Password"></asp:TextBox>
                                            <%--<input type="password" id="newPassConfirm" class="form-control">--%>
                                        </div>
                                        <span></br></span>
                                        <asp:Button ID="btnChangePsw" runat="server" CssClass="btn btn-primary" Text="Change Password" />
                                        <%--<button type="submit" class="btn btn-primary mb-4">Change password</button>--%>
                                        <span></br></span>
                                        <div class="d-flex justify-content-between align-items-center mb-2">
                                            <u>
                                                <span class="pull-left">
                                                    <asp:HyperLink ID="hlBackToLogin" runat="server" NavigateUrl="~/Login/frmLogin.aspx" Text="Back to Log In"></asp:HyperLink>
                                                </span>
                                            </u>

                                            <u>
                                                <span class="pull-right">
                                                    <asp:HyperLink ID="hlRegister" NavigateUrl="~/Index.aspx" runat="server" Text="Register"></asp:HyperLink>
                                                </span>
                                            </u>
                                        </div>
                                    </section>
                                    <!--Section: Block Content-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </asp:Panel>
    </form>
</body>
</html>
