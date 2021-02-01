<%@ Page Title="" Language="C#" MasterPageFile="~/BackEnd/BackEnd.Master" AutoEventWireup="true" CodeBehind="frmDashboard.aspx.cs" Inherits="TravelThings.BackEnd.frmDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Travel Things</title>
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
	background-blend-mode:normal;
    }
    .navbar-inverse .navbar-nav>li>a {
    color: #ffffff;
}
a {
    color: #ffffff;
    text-decoration: none;
}
th{
color: #ffffff;
    text-decoration: none;
}
	
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 650px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-repeat: no-repeat;
	background-image: linear-gradient(to right,#37a0bc 0%,#273f7f 100%);
	background-blend-mode:normal;
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
      .row.content {height:auto;} 
    }
	.navbar-inverse .navbar-nav>.active>a, .navbar-inverse .navbar-nav>.active>a:focus, .navbar-inverse .navbar-nav>.active>a:hover {
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
   <%-- <div style="width: 100%; height: 515px; overflow-y: scroll;">--%>
        <div class="form-group col-sm-12">
            <h1>Welcome</h1>
        </div>
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
        <div class="col-sm-12">
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
        </div>
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
