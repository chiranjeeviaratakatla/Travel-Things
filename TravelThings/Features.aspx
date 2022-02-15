<%@ Page Title="" Language="C#" MasterPageFile="~/TravelThingMaster.Master" AutoEventWireup="true" CodeBehind="Features.aspx.cs" Inherits="TravelThings.Web_Forms.SenderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Travel Things Features</title>
    <link rel="icon" type="image/gif/png" href="../Images/titleLogoSmall.png">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TraverlThingMasterContentPlaceHolder" runat="server">
    <main id="main">
        <div class="hero-section inner-page">
            <div class="wave">
                <svg width="1920px" height="265px" viewBox="0 0 1920 265" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                    <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                        <g id="Apple-TV" transform="translate(0.000000, -402.000000)" fill="#FFFFFF">
                            <path d="M0,439.134243 C175.04074,464.89273 327.944386,477.771974 458.710937,477.771974 C654.860765,477.771974 870.645295,442.632362 1205.9828,410.192501 C1429.54114,388.565926 1667.54687,411.092417 1920,477.771974 L1920,667 L1017.15166,667 L0,667 L0,439.134243 Z" id="Path"></path>
                        </g>
                    </g>
                </svg>
            </div>

            <div class="container">
                <div class="row align-items-center">
                    <div class="col-12">
                        <div class="row justify-content-center">
                            <div class="col-md-7 text-center hero-text">
                                <h1 data-aos="fade-up" data-aos-delay="">Features</h1>
                                <p class="mb-5" data-aos="fade-up" data-aos-delay="100">TravelThings is a courier delivery app which simplifies the Parcel delivery service.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>



        <div class="site-section pb-0">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-4 mr-auto">
                        <h2 class="mb-4">Better Tracking</h2>
                        <p class="mb-4">
                            A Tracking link will be sent to Sender, Traveller and receiver to ensure an effective and transparent communication process. This enables the customer to 
track the exact location of the parcel and the delivery personnel, thus allowing them to estimate the exact time when the delivery will be executed.
The customers get the recent delivery update through the tracking system. If due to some unfortunate reason the delivery is being delayed, 
the customer can have an idea of the situation rather than just waiting for their delivery at an estimated time. 
The tracker provides real-time information.
                        </p>
                        <%--<p><a href="#">Read More</a></p>--%>
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
                        <p class="mb-4">The dashboard offers a consolidated view of the entire parcel delivery business, with details of all the orders, completed trips, total earnings, 
status of all the trips and other relevant details, helping the business owners with complete track records.</p>
                        <%--<p><a href="#">Read More</a></p>--%>
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
                        <p class="mb-4">TravelThings integrates the popularly used payment gateways, Google map to ensure seamless operations. The app is built in Android as well as iOS.</p>
                        <%--<p><a href="#">Read More</a></p>--%>
                    </div>
                     <div class="col-md-6" data-aos="fade-right">
                        <img src="../Template/img/undraw_svg_4.svg" alt="Image" class="img-fluid">
                    </div>
                </div>
            </div>
        </div>
        <!-- .site-section -->

       <%-- <div class="site-section">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-4 ml-auto order-2">
                        <h2 class="mb-4">Powerful App Design </h2>
                        <p class="mb-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tenetur at reprehenderit optio, laudantium eius quod, eum maxime molestiae porro omnis. Dolores aspernatur delectus impedit incidunt dolore mollitia esse natus beatae.</p>
                        <%--<p><a href="#">Read More</a></p>
                    </div>
                    <div class="col-md-6" data-aos="fade-right">
                        <img src="../Template/img/undraw_svg_4.svg" alt="Image" class="img-fluid">
                    </div>
                </div>
            </div>
        </div>--%>
        <!-- .site-section -->


        <%-- <div class="site-section border-top border-bottom">
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
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius ea delectus pariatur, numquam aperiam dolore nam optio dolorem facilis itaque voluptatum recusandae deleniti minus animi, provident voluptates consectetur maiores quos.</p>
                                </blockquote>



                                <p class="review-user">
                                    <img src="img/person_1.jpg" alt="Image" class="img-fluid rounded-circle mb-3">
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
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius ea delectus pariatur, numquam aperiam dolore nam optio dolorem facilis itaque voluptatum recusandae deleniti minus animi, provident voluptates consectetur maiores quos.</p>
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
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius ea delectus pariatur, numquam aperiam dolore nam optio dolorem facilis itaque voluptatum recusandae deleniti minus animi, provident voluptates consectetur maiores quos.</p>
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
                        <p><a href="#" class="btn"><span class="icofont-brand-apple mr-3"></span>App store</a> <a href="#" class="btn"><span class="icofont-ui-play mr-3"></span>Google play</a></p>
                    </div>
                </div>
            </div>
        </div>


    </main>
</asp:Content>
