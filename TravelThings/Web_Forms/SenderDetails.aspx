<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Forms/TravelThingMaster.Master" AutoEventWireup="true" CodeBehind="SenderDetails.aspx.cs" Inherits="TravelThings.Web_Forms.SenderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="Scripts/jquery.searchabledropdown-1.0.8.min.js" type="text/javascript"></script>
    <script type="text/javascript">
 $(document).ready(function () {
   $("select").searchable({
      maxListSize: 200, // if list size are less than maxListSize, show them all
      maxMultiMatch: 300, // how many matching entries should be displayed
      exactMatch: false, // Exact matching on search
      wildcards: true, // Support for wildcard characters (*, ?)
      ignoreCase: true, // Ignore case sensitivity
      latency: 200, // how many millis to wait until starting search
      warnMultiMatch: 'top {0} matches ...',
      warnNoMatch: 'no matches ...',
      zIndex: 'auto'
          });
       });

    </script>--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.min.css" rel="stylesheet" />
    <link href= "../DatePicker/datepicker.css" rel="stylesheet" />
    <script src="../DatePicker/bootstrap-datepicker.min.js"></script>
    <script src="../DatePicker/jquery.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TraverlThingMasterContentPlaceHolder" runat="server">
    <main id="main">
        <div class="hero-section">
            <%--<div class="wave">
                <svg width="100%" height="355px" viewBox="0 0 1920 355" version="1.1" xmlns="http://www.w3.org/2000/svg"
                    xmlns:xlink="http://www.w3.org/1999/xlink">
                    <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                        <g id="Apple-TV" transform="translate(0.000000, -402.000000)" fill="#FFFFFF">
                            <path
                                d="M0,439.134243 C175.04074,464.89273 327.944386,477.771974 458.710937,477.771974 C654.860765,477.771974 870.645295,442.632362 1205.9828,410.192501 C1429.54114,388.565926 1667.54687,411.092417 1920,477.771974 L1920,757 L1017.15166,757 L0,757 L0,439.134243 Z"
                                id="Path">
                            </path>
                        </g>
                    </g>
                </svg>
            </div>--%>

            <div class="container">
                <div class="row align-items-center">
                    <div class="col-12 hero-text-image">
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label for="name">Pease select source</label>
                                <asp:TextBox runat="server" CssClass="form-control" data-rule="minlen:4" data-msg="Please enter at least 4 chars" AutoPostBack="true" ID="txtSource" OnTextChanged="txtArea_TextChanged"></asp:TextBox>
                            </div>
                            <div class="col-md-6 form-group">
                                <label for="name">Pease select destination</label>
                                <asp:TextBox runat="server" CssClass="form-control" data-rule="minlen:4" data-msg="Please enter at least 4 chars" AutoPostBack="true" ID="txtDestination" OnTextChanged="txtDestination_TextChanged"></asp:TextBox>
                            </div>
                            <div class="col-md-6 form-group">
                                <label for="name">Pease select Travel Date</label>
                                <asp:TextBox runat="server" CssClass="form-control" data-rule="minlen:4" data-msg="Please enter at least 4 chars" AutoPostBack="true" ID="txtStartingDt"></asp:TextBox>
                            </div>
                            <div class="col-md-6 form-group">
                                <label for="name">Pease select Area</label>
                                <asp:DropDownList CssClass="form-control" Height="53" ID="ddlWeightage" runat="server">
                                    <asp:ListItem>Select</asp:ListItem>
                                    <asp:ListItem>venki</asp:ListItem>
                                    <asp:ListItem>venu</asp:ListItem>
                                    <asp:ListItem>charles ven</asp:ListItem>
                                    <asp:ListItem>venuzila</asp:ListItem>
                                    <asp:ListItem>veron philender</asp:ListItem>
                                    <asp:ListItem>india</asp:ListItem>
                                    <asp:ListItem>indianven</asp:ListItem>
                                    <asp:ListItem>vesta</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <asp:Button ID="btnGetTravelers" CssClass="btn btn-outline-white" OnClick="btnGetTravelers_Click" runat="server" Text="Get Travelers" />
                            <asp:Button ID="btnGetBackToHome" CssClass="btn btn-outline-white" OnClick="btnGetBackToHome_Click" runat="server" Text="Get Back to Home" />
                        </div>
                        <div class="col-12 hero-text-image">
                            <div class="row">
                                <div class="mapouter">
                                    <%--<div class="gmap_canvas">
                                        <iframe width="1080" height="600" id="gmap_canvas" src="https://maps.google.com/maps?q=university%20of%20san%20francisco&t=&z=15&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                                        <a href="https://www.embedgooglemap.net">embedgooglemap.net</a>
                                    </div>--%>
                                    <style>
                                         #ddlWeightage {
                                            position: relative;
                                            text-align: right;
                                            height: 1000px;
                                            width: 1080px;
                                        }

                                        #ddlWeightage.gmap_canvas {
                                            overflow: hidden;
                                            background: none !important;
                                            height: 1000px;
                                            width: 1080px;
                                        }
                                    </style>
                                    <script>
                                      <%--  $('#<%=ddlWeightage.ClientID%>').chosen();--%>
                                         var dt = new Date();

                                    </script>
                                    <asp:GridView ID="gvAvilableTravelerList" runat="server" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Id">
                                                <ItemTemplate>
                                                    <asp:Label ID="UserId" runat="server" Text='<%# Bind("UD_User_Id") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Traveler Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="TravelerName" runat="server" Text='<%# Bind("UD_User_Name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Travel by">
                                                <ItemTemplate>
                                                    <asp:Label ID="Travelby" runat="server" Text='<%# Bind("TD_Travel_by") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Strating Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="StratingDt" runat="server" Text='<%# Bind("TD_Strating_Dt") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Estimate Money">
                                                <ItemTemplate>
                                                    <asp:Label ID="EstimateMoney" runat="server" Text='<%# Bind("TD_Estimate_Money") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        <script>
                    var time = dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();
        var today = new Date(dt.getFullYear(), dt.getMonth(), dt.getDate());
        $(function () {
            $("[id$=txtStartingDt]").datepicker({
                maxDate: '0',
                beforeShow: function () {
                    jQuery(this).datepicker({ maxDate: 0 });
                },
                showOn: 'button',
                format: 'dd/mm/yyyy',
                todayHighlight: true,
                time: today,
                "autoclose": true,

            });


            $("[id$=txtStartingDt]").datepicker({
                maxDate: '0',
                beforeShow: function () {
                    jQuery(this).datepicker('option', 'minDate', jQuery('#txtStartingDt').val());
                },
                showOn: 'button',
                format: 'dd/mm/yyyy',
                time: today,
                todayHighlight: true,

                "autoclose": true,

            });
        });
        </script>
    </main>
</asp:Content>
