﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BackEnd/BackEnd.Master" AutoEventWireup="true" CodeBehind="Wf.aspx.cs" Inherits="TravelThings.BackEnd.Wf" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Get User Current Location using Google Map Geolocation API Service in asp.net  
        website</title>  
    <style type="text/css">  
        html  
        {  
            height: 100%;  
        }  
        body  
        {  
            height: 100%;  
            margin: 0;  
            padding: 0;  
        }  
        #MyMapLOC  
        {  
            height: 100%;  
        }  
    </style>  
  
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC6v5-2uaq_wusHDktM9ILcqIrlPtnZgEk&sensor=false">  
    </script>  
  
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places">  
    </script>  
  
    <script type="text/javascript">  
        if (navigator.geolocation) {  
            navigator.geolocation.getCurrentPosition(success);  
        } else {  
        alert("There is Some Problem on your current browser to get Geo Location!");  
        }  
  
        function success(position) {  
            var lat = position.coords.latitude;  
            var long = position.coords.longitude;  
            var city = position.coords.locality;  
            var LatLng = new google.maps.LatLng(lat, long);  
            var mapOptions = {  
                center: LatLng,  
                zoom: 12,  
                mapTypeId: google.maps.MapTypeId.ROADMAP  
            };  
  
            var map = new google.maps.Map(document.getElementById("MyMapLOC"), mapOptions);  
            var marker = new google.maps.Marker({  
                position: LatLng,  
                title: "<div style = 'height:60px;width:200px'><b>Your location:</b><br />Latitude: "   
                            + lat + +"<br />Longitude: " + long  
            });  
  
            marker.setMap(map);  
            var getInfoWindow = new google.maps.InfoWindow({ content: "<b>Your Current Location</b><br/> Latitude:" +   
                                    lat + "<br /> Longitude:" + long + "" });  
            getInfoWindow.open(map, marker);  
        }  
    </script>  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="MyMapLOC" style="width: 550px; height: 470px">  
    </div>  
</asp:Content>
