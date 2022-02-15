<%@ Page Title="" Language="C#" MasterPageFile="~/TravelThingMaster.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="TravelThings.Web_Forms.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Travel Things Home</title>
    <link rel="icon" type="image/gif/png" href="../Images/titleLogoSmall.png">
    <script type="text/javascript" lang="javascript">
        function ConformLogin() {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Something went wrong!',
                footer: '<a href>Why do I have this issue?</a>'
            });
        }
        // Only ASCII character in that range allowed
        function onlyNumbers(event) {
            var charCode = (event.which) ? event.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TraverlThingMasterContentPlaceHolder" runat="server">
    <asp:Panel ID="pnlMainIndex" runat="server">
        <main id="main">
            <div class="hero-section">
                <div class="wave">

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
                </div>
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-12 hero-text-image">
                            <div class="row">
                                <div class="col-lg-7 text-center text-lg-left">
                                    <h1 data-aos="fade-right">Travel Things</h1>
                                    <p class="mb-5" data-aos="fade-right" data-aos-delay="100">
                                        We will Send your Things wherever you want.
                                    </p>
                                    <%--<p data-aos="fade-right" data-aos-delay="200" data-aos-offset="-500">
                                        <a href="#"
                                            class="btn btn-outline-white">Download App</a>
                                    </p>--%>
                                </div>

                                <div class="col-lg-5 iphone-wrap">
                                    <div class="col-md-12 mb-5 mb-md-0" data-aos="fade-up">
                                        <div class="row">
                                            <%-- <div runat="server" id="divReg">--%>
                                            <div class="col-md-12 form-group">
                                                <asp:Label ID="lblName" ForeColor="White" runat="server">Name</asp:Label>
                                                <h2 style="color: white" data-aos="fade-up">
                                                    <asp:Label ID="lblOtpName" runat="server" Text="Please enter the OTP"></asp:Label></h2>
                                                <p>
                                                    <asp:Label ID="lblMessage" runat="server" Text="Sent to your registered mobile #:973xxxx5643"></asp:Label>
                                                </p>

                                                <asp:Label ID="lblTimeLimit" class="mb-5" runat="server" Text="This OTP will expire in 5 munites."></asp:Label>
                                                <asp:TextBox ID="txtName" MaxLength="50" runat="server" placeholder="Please Enter Name" CssClass="form-control" data-rule="minlen:4" data-msg="Please enter at least 4 chars"></asp:TextBox>
                                                <asp:TextBox ID="txtOTP" placeholder="Please Enter OTP" runat="server" TextMode="Number" MaxLength="6" CssClass="form-control"></asp:TextBox>
                                                <div class="validate"></div>
                                            </div>
                                            <div class="col-md-12 form-group">
                                                <asp:Label ID="lblPhoneNo" ForeColor="White" runat="server">Phone Number</asp:Label>
                                                <asp:TextBox ID="txtPhoneNo" runat="server" placeholder="Please Enter Phone Number" CssClass="form-control" MaxLength="10" data-rule="minlen:4" onkeypress="return onlyNumbers(event)" data-msg="Please enter at least 4 chars"></asp:TextBox>
                                                <asp:Button ID="btnCheckOTP" runat="server" CssClass="btn btn-outline-white" Text="Validate OTP" />
                                                <asp:Button ID="btnReSendOtp" Text="Re-Send OTP" CssClass="btn btn-outline-white" runat="server" />
                                                <div class="validate"></div>
                                            </div>

                                            <div class="col-md-6 form-group">
                                                <asp:Button ID="btnRegister" Text="Register Now" CssClass="btn btn-outline-white" OnClick="btnRegister_Click" runat="server" />
                                            </div>
                                            <div class="col-md-6 form-group">
                                            </div>
                                            <%-- </div>--%>
                                            <%--<img src="../Template/img/phone_1.png" alt="Image" class="phone-1" data-aos="fade-right">
                  <img src="../Template/img/phone_2.png" alt="Image" class="phone-2" data-aos="fade-right" data-aos-delay="200">--%>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="site-section">
                <div class="container">

                    <div class="row justify-content-center text-center mb-7">
                        <div class="col-md-7" data-aos="fade-up">
                            <h5 class="section-heading">Save your time using Travel Things</h5>
                        </div>
                    </div>
                    <div class="row justify-content-center text-center mb-10">
                        <div class="col-md-10" data-aos="fade-up">
                            <p>TravelThings is a courier delivery app which simplifies the Parcel delivery service business in and around the city and ensures hassle-free delivery with our zero involvement.</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4" data-aos="fade-up" data-aos-delay="">
                            <div class="feature-1 text-center">
                                <div class="wrap-icon icon-1">
                                    <span class="icon la la-road"></span>
                                </div>
                                <h3 class="mb-3">Delivery made easy</h3>
                                <p>With TravelThings, courier /Parcel delivery has been made easy. Customers can book the delivery requests with just a few clicks.</p>
                            </div>
                        </div>
                        <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
                            <div class="feature-1 text-center">
                                <div class="wrap-icon icon-1">
                                    <span class="icon la la-send"></span>
                                </div>
                                <h3 class="mb-3">What you want to send</h3>
                                <p>Senders just have to register the details of the shipment that they want to send through the application.</p>
                            </div>
                        </div>
                        <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
                            <div class="feature-1 text-center">
                                <div class="wrap-icon icon-1">
                                    <span class="icon la la-map-pin"></span>
                                </div>
                                <h3 class="mb-3">Sit and Track</h3>
                                <p>You just need to send parcel delivery to the Traveller, Track the status of delivery in your phone only.</p>
                            </div>
                        </div>
                        <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
                            <div class="feature-1 text-center">
                                <div class="wrap-icon icon-1">
                                    <span class="icon la la-money"></span>
                                </div>
                                <h3 class="mb-3">Travel and Earn</h3>
                                <p>Travellers can deliver the parcel with minimum effort and earn rewards/money.</p>
                            </div>
                        </div>
                        <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
                            <div class="feature-1 text-center">
                                <div class="wrap-icon icon-1">
                                    <span class="icon la la-dropbox"></span>
                                </div>
                                <h3 class="mb-3">Deliver to the receiver</h3>
                                <p>We will deliver the package to the receiver within estimated time and date.</p>
                            </div>
                        </div>
                        <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
                            <div class="feature-1 text-center">
                                <div class="wrap-icon icon-1">
                                    <span class="icon la la-stack-overflow"></span>
                                </div>
                                <h3 class="mb-3">Easy task allocation</h3>
                                <p>Senders have the chance to select traveller from the list and assign, as well Traveller can accept or reject the task when notification is received.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- .site-section -->

            <div class="site-section">
                <div class="container">
                    <%--<div class="row justify-content-center text-center mb-5" data-aos="fade">
                        <div class="col-md-6 mb-5">
                            <img src="../Template/img/undraw_svg_1.svg" alt="Image" class="img-fluid">
                        </div>
                    </div>--%>
                    <div class="row justify-content-center text-center mb-6">
                        <div class="col-md-6">
                            <h2 class="section-heading">Why TravelThings</h2>
                        </div>
                    </div>
                    <div class="row justify-content-center text-center mb-10">
                        <div class="col-md-10" data-aos="fade-up">
                            <p>
                                TravelThings is a courier delivery application which simplifies the Parcel hassle-free delivery, where customers can book their package or parcel delivery slot, to be picked up and safely delivered to the recipient within just a few clicks. The application offers  user-friendly features and redefines parcel delivery with simplicity.</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="step">
                                <span class="number">01</span>
                                <h3>Earn extra money</h3>
                                <p>Simply earn money with no extra effort.</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="step">
                                <span class="number">02</span>
                                <h3>No extra hours</h3>
                                <p>Unlike part-time jobs, you can utilise while you are travelling.</p>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-6">
                            <div class="step">
                                <span class="number">03</span>
                                <h3>Easy to get started</h3>
                                <p>Don't worry, Get registered just with a click and start.</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="step">
                                <span class="number">04</span>
                                <h3>Low cost for parcel delivery</h3>
                                <p>Here you go... if your pocket is light</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- .site-section -->



            <div class="site-section pb-0">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-md-4 mr-auto">
                            <h2 class="mb-4">Better Tracking</h2>
                            <p class="mb-4">
                                A Tracking link will be sent to Sender, Traveller and receiver to ensure an effective and transparent communication process. This enables the customer to 
track the exact location of the parcel and the delivery personnel, thus allowing them to estimate the exact time when the delivery will be executed.

                            </p>
                            <%--Read More--%>
                            <%--The customers get the recent delivery update through the tracking system. If due to some unfortunate reason the delivery is being delayed, 
the customer can have an idea of the situation rather than just waiting for their delivery at an estimated time. 
The tracker provides real-time information.--%>
                            <p><a href="Features.aspx">Read More</a></p>
                        </div>
                        <div class="col-md-6" data-aos="fade-left">
                            <img src="../Template/img/undraw_svg_2.svg" alt="Image" class="img-fluid">
                        </div>
                    </div>
                </div>
            </div>
            <!-- .site-section -->

            <div class="site-section">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-md-4 ml-auto order-2">
                            <h2 class="mb-4">Dashboard</h2>
                            <p class="mb-4">
                                The dashboard offers a consolidated view of the entire parcel delivery business, with details of all the orders, completed trips, total earnings, 
status of all the trips and other relevant details, helping the business owners with complete track records.
                            </p>
                            <p><a href="Features.aspx">Read More</a></p>
                        </div>
                        <div class="col-md-6" data-aos="fade-right">
                            <img src="../Template/img/undraw_svg_3.svg" alt="Image" class="img-fluid">
                        </div>
                    </div>
                </div>
            </div>
            <!-- .site-section -->


            <div class="site-section pb-0">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-md-4 mr-auto">
                            <h2 class="mb-4">Technology stack</h2>
                            <p class="mb-4">
                                TravelThings integrates the popularly used payment gateways, Google map to ensure seamless operations. The app is built in Android as well as iOS.
                            </p>
                            <p><a href="Features.aspx">Read More</a></p>
                        </div>
                        <div class="col-md-6" data-aos="fade-right">
                            <img src="../Template/img/undraw_svg_4.svg" alt="Image" class="img-fluid">
                        </div>
                    </div>
                </div>
            </div>

            <%--  <div class="site-section border-top border-bottom">
                <div class="container">
                    <div class="row justify-content-center text-center mb-5">
                        <div class="col-md-4">
                            <h2 class="section-heading">Review From Our Users</h2>
                        </div>
                    </div>
                    <div class="row justify-content-center text-center">
                        <div class="col-md-7">
                            <div class="owl-carousel testimonial-carousel">
                                <div class="review text-center">
                                    <p class="stars">
                                        <span class="icofont-star"></span>
                                        <span class="icofont-star"></span>
                                        <span class="icofont-star"></span>
                                        <span class="icofont-star"></span>
                                        <span class="icofont-star muted"></span>
                                    </p>
                                    <h3>Excellent App!</h3>
                                    <blockquote>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius ea delectus pariatur, numquam
                      aperiam dolore nam optio dolorem facilis itaque voluptatum recusandae deleniti minus animi,
                      provident voluptates consectetur maiores quos.
                                        </p>
                                    </blockquote>



                                    <p class="review-user">
                                        <img src="../Template/img/person_1.jpg" alt="Image" class="img-fluid rounded-circle mb-3">
                                        <span class="d-block">
                                            <span class="text-black">Jean Doe</span>, &mdash; App User
                                        </span>
                                    </p>

                                </div>

                                <div class="review text-center">
                                    <p class="stars">
                                        <span class="icofont-star"></span>
                                        <span class="icofont-star"></span>
                                        <span class="icofont-star"></span>
                                        <span class="icofont-star"></span>
                                        <span class="icofont-star muted"></span>
                                    </p>
                                    <h3>This App is easy to use!</h3>
                                    <blockquote>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius ea delectus pariatur, numquam
                      aperiam dolore nam optio dolorem facilis itaque voluptatum recusandae deleniti minus animi,
                      provident voluptates consectetur maiores quos.
                                        </p>
                                    </blockquote>



                                    <p class="review-user">
                                        <img src="../Template/img/person_2.jpg" alt="Image" class="img-fluid rounded-circle mb-3">
                                        <span class="d-block">
                                            <span class="text-black">Johan Smith</span>, &mdash; App User
                                        </span>
                                    </p>

                                </div>


                                <div class="review text-center">
                                    <p class="stars">
                                        <span class="icofont-star"></span>
                                        <span class="icofont-star"></span>
                                        <span class="icofont-star"></span>
                                        <span class="icofont-star"></span>
                                        <span class="icofont-star muted"></span>
                                    </p>
                                    <h3>Awesome functionality!</h3>
                                    <blockquote>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius ea delectus pariatur, numquam
                      aperiam dolore nam optio dolorem facilis itaque voluptatum recusandae deleniti minus animi,
                      provident voluptates consectetur maiores quos.
                                        </p>
                                    </blockquote>



                                    <p class="review-user">
                                        <img src="../Template/img/person_3.jpg" alt="Image" class="img-fluid rounded-circle mb-3">
                                        <span class="d-block">
                                            <span class="text-black">Jean Thunberg</span>, &mdash; App User
                                        </span>
                                    </p>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>



            <div class="site-section cta-section">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-md-6 mr-auto text-center text-md-left mb-5 mb-md-0">
                            <h2>Download App</h2>
                        </div>
                        <div class="col-md-5 text-center text-md-right">
                            <p>
                                <a href="#" class="btn"><span class="icofont-brand-apple mr-3"></span>App store</a> <a href="#"
                                    class="btn"><span class="icofont-ui-play mr-3"></span>Google play</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </asp:Panel>

</asp:Content>
