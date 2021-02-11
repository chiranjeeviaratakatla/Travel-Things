<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="TravelThings.BackEnd.frmLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Travel Things </title>
    <link rel="icon" type="image/gif/png" href="../Images/titleLogoSmall.png">
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
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
    </style>
</head>
<body style="background-image: linear-gradient(to right,#273f7f 0%,#37a0bc 100%)">
    <form id="form1" runat="server">
        <div>
            <div id="mydiv">
                <div class="imgcontainer">
                    <%--<img src="../Images/TravelThingsLogo.png" alt="Avatar" class="avatar">--%>
                    <asp:Image D="imgLogo" runat="server" AlternateText="Travel Things Logo" CssClass="avatar" ImageUrl="~/Images/TravelThingsLogo.png" />
                </div>

                <div class="container">
                    <label for="uname"><b>Phone Number</b></label>
                    <asp:TextBox ID="txtPhoneNo" runat="server" placeholder="Enter Phone No" CssClass=""></asp:TextBox>
                    <%--<input type="text" placeholder="Enter Username" name="uname" required>--%>

                    <label for="psw"><b>Password</b></label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Enter Password" CssClass=""></asp:TextBox>
                    <%--<input type="password" placeholder="Enter Password" name="psw" required>--%>

                    <%--<button type="submit">Login</button>--%>
                    <asp:Button ID="btnLogin" runat="server" CssClass="button" OnClick="btnLogin_Click" Text="Login" />
                    <label>
                        <asp:CheckBox ID="chkRemeber" runat="server" Text="Remember me" />
                        <%--<input type="checkbox" checked="checked" name="remember">
                        Remember me--%>
                    </label>
                </div>

                <div class="container" style="background-color: #f1f1f1">
                    <asp:LinkButton ID="lbCancel" runat="server" PostBackUrl="~/Web_Forms/Index.aspx" CssClass="cancelbtn" Text="Cancel"></asp:LinkButton>
                    <%--<asp:n[LinkButton ID="btnCancel" runat="server" CssClass="cancelbtn" Text="Cancel" ></asp:LinkButton>--%>
                    <span class="psw">Forgot
                        <asp:HyperLink ID="hlForgotPsw" runat="server" NavigateUrl="~/BackEnd/frmProfile.aspx" Text="Password ?"></asp:HyperLink></span>
                    <%--<button type="button" class="cancelbtn">Cancel</button>
                    <span class="psw">Forgot <a href="#">password?</a></span>--%>
                </div>
            </div>
        </div>
    </form>
</body>

</html>
<script type="text/javascript">
   
    /*#mydiv {
       position:absolute;
       top: 38%;
       left: 50%;
       width:30em;
       height:28em;
        margin-top: -9em; //*set to a negative number 1/2 of your height
        margin-left: -15em; //*set to a negative number 1/2 of your width
        border: 1px solid #ccc;
        background-image: linear-gradient(to right,#273f7f 0%,#37a0bc 100%);
       position:absolute;
       top: 38%;
       left: 75%;
       width:20em;
       height:24em;
       margin-top: -9em; //set to a negative number 1/2 of your height
       margin-left: -15em; //set to a negative number 1/2 of your width
       border: 1px solid #ccc;
       background-image: linear-gradient(to right,#273f7f 0%,#37a0bc 100%);

    }*/
</script>
