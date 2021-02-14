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
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <div class="container profile">
        <div class="row">
            <div class="col-md-4 col-xl-3">
                <div class="card bg-c-blue order-card">
                    <div class="card-block">
                        <h3 class="m-b-20 text-shadow">Sent Items</h3>
                        <h2 class="text-right text-shadow"><i class="fa fa-paper-plane f-left"></i><span>486</span></h2>
                        <p class="m-b-0">More Details<span class="f-right">351</span></p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-xl-3">
                <div class="card bg-c-green order-card">
                    <div class="card-block">
                        <h3 class="m-b-20 text-shadow">Received Items</h3>
                        <h2 class="text-right text-shadow"><i class="fa fa-cubes f-left"></i><span>486</span></h2>
                        <p class="m-b-0">More Details<span class="f-right">351</span></p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-xl-3">
                <div class="card bg-c-yellow order-card">
                    <div class="card-block">
                        <h3 class="m-b-20 text-shadow">Travel Details</h3>
                        <h2 class="text-right text-shadow"><i class="fa fa-bicycle f-left"></i><span>486</span></h2>
                        <p class="m-b-0">More Details<span class="f-right">351</span></p>
                    </div>
                </div>
            </div>

            <%-- <div class="col-md-3 col-xl-3">
                <div class="card bg-c-pink order-card">
                    <div class="card-block">
                        <h6 class="m-b-20">Orders Received</h6>
                        <h2 class="text-right"><i class="fa fa-credit-card f-left"></i><span>486</span></h2>
                        <p class="m-b-0">Completed Orders<span class="f-right">351</span></p>
                    </div>
                </div>
            </div>--%>
        </div>
    </div>
</asp:Content>
