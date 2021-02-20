<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="TravelThings.BackEnd.frmLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Travel Things </title>
    <link rel="icon" type="image/gif/png" href="../Images/titleLogoSmall.png" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <%-- Bootstrap --%>
    <link href="Css/Bootstrap_V_3_4_1.css" rel="stylesheet" />
    <script src="JavaScript/JQuery_V_3_4_1.js" type="text/javascript"></script>
    <script src="JavaScript/BootstrapCdnMin.js" type="text/javascript"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <%-- Sweet Alert --%>
    <script src="JavaScript/SweetAlert.js" type="text/javascript"></script>
    <link href="Css/SweetAlert.css" rel="stylesheet" />

    <%-- <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        /*form {
            border: 3px solid #f1f1f1;
        }*/

        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        .button {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            opacity: 0.8;
        }

        .cancelbtn {
            width: auto;
            padding: 10px 18px;
            background-color: #f44336;
        }

        .imgcontainer {
            text-align: center;
            margin: 24px 0 12px 0;
        }

        img.avatar {
            width: 40%;
            border-radius: 50%;
        }

        .container {
            padding: 16px;
        }

        span.psw {
            float: right;
            padding-top: 16px;
        }

        /* Change styles for span and cancel button on extra small screens */
        @media screen and (max-width: 300px) {
            span.psw {
                display: block;
                float: none;
            }

            .cancelbtn {
                width: 100%;
            }
        }

        #mydiv {
            position: absolute;
            top: 38%;
            left: 50%;
            width: 30em;
            height: 28em;
            margin-top: -9em; /*set to a negative number 1/2 of your height*/
            margin-left: -15em; /*set to a negative number 1/2 of your width*/
            border: 1px solid #ccc;
            background-image: linear-gradient(to right,#273f7f 0%,#37a0bc 100%);
        }

        /*#b {
            [[ =[p  nd-color:yellow;
        }*/
    </style>--%>
    <style>
        .form-gap {
            padding-top: 70px;
        }

        .imageSelection {
            user-select: none;
        }
    </style>
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
                                    <asp:Image ID="imgLogo" ImageUrl="~/Images/BlackLogo.png" Width="150px" CssClass="imageSelection" runat="server" Height="100px" />
                                </h3>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-phone fa-1x"></i></span>
                                            <asp:TextBox ID="txtPhoneNo" runat="server" TextMode="Phone" placeholder="Enter Phone No" CssClass="form-control"></asp:TextBox>
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
                                        <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-lg btn-primary btn-block" OnClick="btnLogin_Click" Text="Login" />
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
                                    <asp:HyperLink ID="hlRegister" NavigateUrl="~/Web_Forms/Index.aspx" runat="server" Text="Register"></asp:HyperLink>
                                </span></u>
                                <u><span class="pull-right">
                                    <asp:HyperLink ID="hlForgotPassword" runat="server" NavigateUrl="~/BackEnd/frmForgotPassword.aspx" Text="Forgot Password"></asp:HyperLink>
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
