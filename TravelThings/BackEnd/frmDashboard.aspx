<%@ Page Title="" Language="C#" MasterPageFile="~/BackEnd/BackEnd.Master" AutoEventWireup="true" CodeBehind="frmDashboard.aspx.cs" Inherits="TravelThings.BackEnd.frmDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Travel Things </title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <!--Graph javascripts-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <!--Bar Graph css-->
    <link href="https://canvasjs.com/assets/css/jquery-ui.1.11.2.min.css" rel="stylesheet" />
    <script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
    <script src="https://canvasjs.com/assets/script/jquery-ui.1.11.2.min.js"></script>
    <script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>

    <style>
        /* Remove the navbar's default margin-bottom and rounded borders */
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
            background-repeat: no-repeat;
            background-image: linear-gradient(to right,#273f7f 0%,#37a0bc 100%);
            background-blend-mode: normal;
        }

        .navbar-inverse .navbar-nav > li > a {
            color: #ffffff;
        }

        a {
            color: #ffffff;
            text-decoration: none;
        }

        th {
            color: #ffffff;
            text-decoration: none;
        }

        /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
        .row.content {
            height: 650px;
        }

        /* Set gray background color and 100% height */
        .sidenav {
            padding-top: 20px;
            background-repeat: no-repeat;
            background-image: linear-gradient(to right,#37a0bc 0%,#273f7f 100%);
            background-blend-mode: normal;
            height: 100%;
        }

        /* Set black background color, white text and some padding */
        footer {
            background-color: #555;
            color: white;
            padding: 15px;
        }

        /* On small screens, set height to 'auto' for sidenav and grid */
        @media screen and (max-width: 767px) {
            .sidenav {
                height: auto;
                padding: 15px;
            }

            .row.content {
                height: auto;
            }
        }

        .navbar-inverse .navbar-nav > .active > a, .navbar-inverse .navbar-nav > .active > a:focus, .navbar-inverse .navbar-nav > .active > a:hover {
            color: #fff;
            background-color: #020f4e;
        }
    </style>


    <script type="text/javascript">
        // Load google charts
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(drawChart);

        // Draw the chart and set the chart values
        function drawChart() {
            var data = google.visualization.arrayToDataTable([
            ['Task', 'Hours per Day'],
            ['Work', 8],
            ['Eat', 2],
            ['TV', 4],
            ['Gym', 2],
            ['Sleep', 8]
            ]);

            // Optional; add a title and set the width and height of the chart
            var options = { 'title': 'My Average Day', 'width': 550, 'height': 400 };

            // Display the chart inside the <div> element with id="piechart"
            var chart = new google.visualization.PieChart(document.getElementById('piechart'));
            chart.draw(data, options);
        }
        //<!-- window.onload = function () { -->
        //            <!-- setTimeout(function () { -->
        //                <!-- document.body.removeChild(modal); -->
        //                <!-- loading.style.display = "none"; -->
        //            <!-- }, 2000); //Delay just used for example and must be set to 0. -->
        //        <!-- }; -->
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron">
        <div class="container text-center">
            <h2>Travel Things
            </h2>
            <p>We will Send your Things wherever you want.</p>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-sm-8">
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="../Images/Dashboard1.jpg" style="width:800px; height:375px" alt="Image">
                            <div class="carousel-caption">
                                <h3>Travel Things</h3>
                                <p>We will Send your Things wherever you want.</p>
                            </div>
                        </div>

                        <div class="item">
                            <img src="https://placehold.it/800x400?text=Another Image Maybe" alt="Image">
                            <div class="carousel-caption">
                                <h3>More Sell $</h3>
                                <p>Lorem ipsum...</p>
                            </div>
                        </div>
                    </div>

                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="well">
                    <p>Some text..</p>
                </div>
                <div class="well">
                    <p>Upcoming Events..</p>
                </div>
                <div class="well">
                    <p>Visit Our Blog</p>
                </div>
            </div>
        </div>
        <hr>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <div class="panel panel-primary">
                    <div class="panel-heading">BLACK FRIDAY DEAL</div>
                    <div class="panel-body">
                        <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width: 100%" alt="Image">
                    </div>
                    <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="panel panel-danger">
                    <div class="panel-heading">BLACK FRIDAY DEAL</div>
                    <div class="panel-body">
                        <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width: 100%" alt="Image">
                    </div>
                    <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="panel panel-success">
                    <div class="panel-heading">BLACK FRIDAY DEAL</div>
                    <div class="panel-body">
                        <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width: 100%" alt="Image">
                    </div>
                    <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
                </div>
            </div>
        </div>
    </div>
    <br>

    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <div class="panel panel-primary">
                    <div class="panel-heading">BLACK FRIDAY DEAL</div>
                    <div class="panel-body">
                        <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width: 100%" alt="Image">
                    </div>
                    <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="panel panel-primary">
                    <div class="panel-heading">BLACK FRIDAY DEAL</div>
                    <div class="panel-body">
                        <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width: 100%" alt="Image">
                    </div>
                    <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="panel panel-primary">
                    <div class="panel-heading">BLACK FRIDAY DEAL</div>
                    <div class="panel-body">
                        <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width: 100%" alt="Image">
                    </div>
                    <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
                </div>
            </div>
        </div>
    </div>

    <%-- <nav class="navbar navbar-inverse visible-xs">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Logo</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Dashboard</a></li>
                    <li><a href="#">Age</a></li>
                    <li><a href="#">Gender</a></li>
                    <li><a href="#">Geo</a></li>
                </ul>
            </div>
        </div>
    </nav>--%>

    <%-- <div class="container">
        <div class="row content">
            <%--<div class="col-sm-3 sidenav hidden-xs">
                <h2>Logo</h2>
                <ul class="nav nav-pills nav-stacked">
                    <li class="active"><a href="#section1">Dashboard</a></li>
                    <li><a href="#section2">Age</a></li>
                    <li><a href="#section3">Gender</a></li>
                    <li><a href="#section3">Geo</a></li>
                </ul>
                <br>
            </div>
            <br>--%>

    <%--  <div class="col-sm-12">
                <div class="well">
                    <h4>Dashboard</h4>
                    <p>Some text..</p>
                </div>
                <div class="row">
                    <div class="col-sm-3">
                        <div class="well">
                            <h4>Users</h4>
                            <p>1 Million</p>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="well">
                            <h4>Pages</h4>
                            <p>100 Million</p>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="well">
                            <h4>Sessions</h4>
                            <p>10 Million</p>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="well">
                            <h4>Bounce</h4>
                            <p>30%</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <div class="well">
                            <p>Text</p>
                            <p>Text</p>
                            <p>Text</p>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="well">
                            <p>Text</p>
                            <p>Text</p>
                            <p>Text</p>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="well">
                            <p>Text</p>
                            <p>Text</p>
                            <p>Text</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-8">
                        <div class="well">
                            <p>Text</p>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="well">
                            <p>Text</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>

    <%-- <div style="width: 100%; height: 515px; overflow-y: scroll;">--%>
    <%--<div class="form-group col-sm-12">
            <h1>Welcome</h1>
        </div>--%>
    <%--<div class="col-sm-6">
            <div id="tabs" style="height: 360px">
                <!--<ul>
				<li ><a href="#tabs-1" style="font-size: 12px">Spline</a></li>
				<li ><a href="#tabs-2"  style="font-size: 12px">Spline Area</a></li>
			</ul>-->
                <div id="tabs-1" style="height: 300px">
                    <div id="chartContainer1" style="height: 300px; width: 100%;"></div>
                </div>
                <!--<div id="tabs-2" style="height: 300px">
				<div id="chartContainer2" style="height: 300px; width: 100%;"></div>
			</div>-->
            </div>
        </div>--%>
    <%--  <div class="col-sm-12">
            <div id="piechart"></div>
        </div>

        <div class="col-sm-12">
            <table class="table table-hover">
                <thead class="navbar">
                    <tr>
                        <th>Firstname</th>
                        <th>Lastname</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>John</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                    </tr>
                    <tr>
                        <td>Mary</td>
                        <td>Moe</td>
                        <td>mary@example.com</td>
                    </tr>
                    <tr>
                        <td>July</td>
                        <td>Dooley</td>
                        <td>july@example.com</td>
                    </tr>
                </tbody>
            </table>
        </div>--%>
    <%--   </div>--%>
    <%--<script>
        window.onload = function () {
            var options1 = {
                animationEnabled: true,
                title: {
                    text: "Spline Chart using jQuery Plugin"
                },
                axisX: {
                    labelFontSize: 14
                },
                axisY: {
                    labelFontSize: 14
                },
                data: [{
                    type: "spline", //change it to line, area, bar, pie, etc
                    dataPoints: [
                        { y: 10 },
                        { y: 6 },
                        { y: 14 },
                        { y: 12 },
                        { y: 19 },
                        { y: 14 },
                        { y: 26 },
                        { y: 10 },
                        { y: 22 }
                    ]
                }]
            };

            var options2 = {
                title: {
                    text: "Spline Area Chart using jQuery Plugin"
                },
                axisX: {
                    labelFontSize: 14
                },
                axisY: {
                    labelFontSize: 14
                },
                data: [{
                    type: "splineArea", //change it to line, area, bar, pie, etc
                    dataPoints: [
                        { y: 10 },
                        { y: 6 },
                        { y: 14 },
                        { y: 12 },
                        { y: 19 },
                        { y: 14 },
                        { y: 26 },
                        { y: 10 },
                        { y: 22 }
                    ]
                }]
            };

            $("#tabs").tabs({
                create: function (event, ui) {
                    //Render Charts after tabs have been created.
                    $("#chartContainer1").CanvasJSChart(options1);
                    $("#chartContainer2").CanvasJSChart(options2);
                },
                activate: function (event, ui) {
                    //Updates the chart to its container size if it has changed.
                    ui.newPanel.children().first().CanvasJSChart().render();
                }
            });

        }
    </script>--%>
</asp:Content>
