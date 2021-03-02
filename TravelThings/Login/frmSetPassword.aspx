<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmSetPassword.aspx.cs" Inherits="TravelThings.Login.SetPassword" %>

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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
        <%-- Sweet Alert --%>
    <script src="../BackEnd/JavaScript/SweetAlert.js" type="text/javascript"></script>
    <link href="../BackEnd/Css/SweetAlert.css" rel="stylesheet" />
    <style>
        .form-gap {
            padding-top: 70px;
        }
    </style>
</head>
<body style="background-image: linear-gradient(to right,#273f7f 0%,#37a0bc 100%)">
    <form id="form1" runat="server">
        <div class="form-gap"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="text-center">
                                <h3>
                                    <asp:Image ID="imgLogo" ImageUrl="~/Images/LogoTTLogin.png" Width="200px" runat="server" Height="150px" />
                                </h3>
                                <h2 class="text-center">Set Password</h2>
                                <asp:Label ID="lblWlcmUser" runat="server"></asp:Label>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-lock fa-1x"></i></span>
                                            <asp:TextBox ID="txtPassword" placeholder="New Password" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-lock fa-1x"></i></span>
                                            <asp:TextBox ID="txtConfirmPsw" placeholder="Confirm Password" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Button ID="btnSetPassowrd" runat="server" CssClass="btn btn-primary btn-block" Text="Set Password" OnClick="btnSetPassowrd_Click" />
                                    </div>
                                </div>
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <u>
                                        <span class="pull-left">
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login/frmLogin.aspx" Text="Back to Log In"></asp:HyperLink>
                                        </span>
                                    </u>
                                    <u>
                                        <span class="pull-right">
                                            <asp:HyperLink ID="HyperLink2" NavigateUrl="~/Web_Forms/Index.aspx" runat="server" Text="Register"></asp:HyperLink>
                                        </span>
                                    </u>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
